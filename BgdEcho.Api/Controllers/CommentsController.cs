using BgdEcho.Application;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Comments;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CommentsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public CommentsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get([FromQuery] CommentSearch search, [FromServices] ISearchCommentsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, search));
        }

        [HttpGet("{id}")]
        public IActionResult Find(int id, [FromServices] FindCommentUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, id));
        }

        [HttpPost]
        public IActionResult Insert([FromBody] CommentDto dto, [FromServices] IAddCommentUseCase useCase, [FromServices] IApplicationActor actor)
        {
            dto.UserId = actor.Id;
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] CommentDto comment, [FromServices] IUpdateCommentUseCase useCase, [FromServices] IApplicationActor actor)
        {
            comment.Id = id;
            comment.UserId = actor.Id;
            _executor.Execute(useCase, comment);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCommentUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
