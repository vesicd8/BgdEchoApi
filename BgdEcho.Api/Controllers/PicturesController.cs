using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Pictures;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PicturesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public PicturesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [HttpPost]
        public IActionResult Insert([FromBody] PictureDto request, [FromServices] IAddPictureUseCase useCase)
        {
            _executor.Execute(useCase, request);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePictureUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
