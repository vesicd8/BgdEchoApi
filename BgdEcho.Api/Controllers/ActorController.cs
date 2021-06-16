using BgdEcho.Application;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    //[Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class ActorController : Controller
    {
        private readonly IApplicationActor _actor;

        public ActorController(IApplicationActor actor)
        {
            _actor = actor;
        }

        [HttpGet("[action]")]
        public IActionResult Get()
        {
            return Ok(_actor);
        }

    }
}
