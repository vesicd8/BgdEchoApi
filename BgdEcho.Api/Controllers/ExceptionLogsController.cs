using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Exceptions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ExceptionLogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ExceptionLogsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] ISearchExceptionLogsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, search));
        }
    }
}
