using BgdEcho.Application;
using BgdEcho.Implementation.UseCases;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class UseCasesController : Controller
    {
        [HttpGet]
        public IActionResult Get([FromServices] IApplicationActor actor)
        {
            if (!actor.IsSuperAdmin)
                return NotFound();
            return Ok(UseCases.UseCaseList);
        }
    }
}
