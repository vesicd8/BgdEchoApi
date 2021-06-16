using BgdEcho.Api.Core.FileManager;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class CoversController : Controller
    {
        private readonly PostCoverFileManager _manager;

        public CoversController(PostCoverFileManager manager)
        {
            _manager = manager;
        }

        [HttpPost]
        public IActionResult Upload([FromForm] IFormFile cover)
        {
            if(cover == null)
            {
                return BadRequest(new { error = "File not selected." });
            }
            return Ok(new { src = _manager.Upload(cover) });
        }
    }
}
