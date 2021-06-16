using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Posts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class PostsController : Controller
    {
        private readonly UseCaseExecutor _executor;

        public PostsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get([FromQuery] PostsSearch request, [FromServices] ISearchPostsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, request));
        }

        [AllowAnonymous]
        [HttpGet("{id}")]
        public IActionResult Find(int id, [FromServices] IFindPostUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, id));
        }

        [HttpPost]
        public IActionResult Insert([FromBody] PostDto request, [FromServices] IAddPostUseCase useCase)
        {
            _executor.Execute(useCase, request);
            return NoContent();
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] UpdatePostDto request, [FromServices] IUpdatePostUseCase useCase)
        {
            request.Id = id;
            useCase.Execute(request);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
