using BgdEcho.Api.Core.Actors;
using BgdEcho.Api.Core.Identity;
using BgdEcho.Api.Core.Jwt;
using BgdEcho.Application;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Account;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        private readonly IIdentityProvider _provider;
        private readonly IJwtStorage _storage;
        private readonly IJwtValidator _tokenValidator;
        private readonly JwtManager _manager;
        private readonly UseCaseExecutor _executor;

        public AccountController(IIdentityProvider provider, JwtManager manager, IJwtStorage storage, IJwtValidator tokenValidator, UseCaseExecutor executor)
        {
            _provider = provider;
            _manager = manager;
            _storage = storage;
            _tokenValidator = tokenValidator;
            _executor = executor;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch dto, [FromServices] ISearchAccountsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, dto));
        }

        [AllowAnonymous]
        [HttpPost("[action]")]
        public IActionResult Login([FromBody] LoginDto dto)
        {
            var user = _provider.GetUser(dto.Username, dto.Password);

            if(user == null)
            {
                return Unauthorized();
            }

            var token = _manager.GenerateToken(user);

            _storage.Add(user.Id, token.RefreshToken, token.AccessToken);

            return Ok(new JwtToken { AccessToken = token.AccessToken, RefreshToken = token.RefreshToken });
        }

        [AllowAnonymous]
        [HttpPost("[action]")]
        public IActionResult Register([FromBody] UserDto dto, [FromServices] IAddAccountUseCase useCase, [FromServices] IApplicationActor actor)
        {
            if (!actor.IsSuperAdmin)
            {
                dto.RoleId = 1;
                dto.CanGrantModeratorRole = false;
                dto.IsModerator = false;
            }

            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] UserDto dto, [FromServices] IUpdateAccountUseCase useCase)
        {
            dto.Id = id;
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpPost("[action]")]
        public IActionResult Logout([FromBody] TokenRequest tkn)
        {
            if(tkn == null)
            {
                return BadRequest("You need to send refresh token.");
            }

            if (string.IsNullOrWhiteSpace(tkn.RefreshToken))
            {
                return BadRequest("Refresh token not set. Please try again.");
            }

            var token = _storage.FindByRefreshToken(tkn.RefreshToken);

            if(token == null)
            {
                return BadRequest("User already logged out.");
            }

            _storage.Remove(tkn.RefreshToken);

            return Ok();
        }

        [HttpPost("[action]")]
        public IActionResult RefreshToken([FromBody] TokenRequest tkn)
        {
            if(tkn == null)
            {
                return BadRequest("You need to send refresh token.");
            }

            if (string.IsNullOrEmpty(tkn.RefreshToken))
            {
                return BadRequest("Refresh token is not set.");
            }

            var token = _storage.FindByRefreshToken(tkn.RefreshToken);

            if(token == null)
            {
                return Unauthorized();
            }

            if (!_tokenValidator.IsValid(token))
            {
                _storage.Remove(tkn.RefreshToken);
                return Unauthorized();
            }

            var user = _provider.GetUserById(token.UserId) as JwtActor;
            var newToken = _manager.GenerateToken(user);

            _storage.Remove(tkn.RefreshToken);
            _storage.Add(user.Id, newToken.RefreshToken, newToken.AccessToken);

            return Ok(new JwtToken { AccessToken = newToken.AccessToken, RefreshToken = newToken.RefreshToken });
        }
    }

    public class LoginDto
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class TokenRequest
    {
        public string RefreshToken { get; set; }
    }

    public class JwtToken
    {
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
    }
}
