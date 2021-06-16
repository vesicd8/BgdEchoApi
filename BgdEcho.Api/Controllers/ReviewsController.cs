using BgdEcho.Application;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Reviews;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ReviewsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get([FromQuery] ReviewSearch request, [FromServices] ISearchReviewsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, request));
        }

        [AllowAnonymous]
        [HttpGet("{id}")]
        public IActionResult Find(int id, [FromServices] IFindReviewUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, id));
        }

        [HttpPost]
        public IActionResult Insert([FromBody] ReviewDto request, [FromServices] IAddReviewUseCase useCase, [FromServices] IApplicationActor actor)
        {
            request.UserId = actor.Id;
            _executor.Execute(useCase, request);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ReviewDto request, [FromServices] IUpdateReviewUseCase useCase, [FromServices] IApplicationActor actor)
        {
            request.Id = id;
            request.UserId = actor.Id;
            _executor.Execute(useCase, request);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteReviewUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
