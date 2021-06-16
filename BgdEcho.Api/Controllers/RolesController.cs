using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Roles;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RolesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch request, [FromServices] ISearchRolesUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, request));
        }

        [HttpGet("{id}")]
        public IActionResult Find(int id, [FromServices] IFindRoleUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, id));
        }

        [HttpPost]
        public IActionResult Post([FromBody] RoleDto dto, [FromServices] IAddRoleUseCase useCase)
        {
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] RoleDto dto, [FromServices] IUpdateRoleUseCase useCase)
        {
            dto.Id = id;
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteRoleUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
