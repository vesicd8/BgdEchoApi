using BgdEcho.Api.Core.FileManager;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PostPicturesController : ControllerBase
    {
        private readonly PostImagesFileManager _manager;

        public PostPicturesController(PostImagesFileManager manager)
        {
            _manager = manager;
        }

        [HttpPost]
        public IActionResult UploadMany([FromForm] IEnumerable<IFormFile> files)
        {
            if(files == null || !files.Any())
            {
                return BadRequest(new { error = "File(s) not selected." });
            }

            return Ok(_manager.UploadMany(files));
        }
    }
}
