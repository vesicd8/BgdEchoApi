using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Audit;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AuditController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AuditController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] ISearchAuditLogsUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, search));
        }
    }
}
