using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Categories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BgdEcho.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : Controller
    {
        private readonly UseCaseExecutor _executor;

        public CategoriesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] ISearchCategoriesUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, search));
        }

        [HttpGet("{id}")]
        public IActionResult Find(int id, [FromServices] IFindCategoryUseCase useCase)
        {
            return Ok(_executor.Execute(useCase, id));
        }

        [HttpPost]
        public IActionResult Insert([FromBody] CategoryDto dto, [FromServices] IAddCategoryUseCase useCase)
        {
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] CategoryDto dto, [FromServices] IUpdateCategoryUseCase useCase)
        {
            dto.Id = id;
            _executor.Execute(useCase, dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryUseCase useCase)
        {
            _executor.Execute(useCase, id);
            return Ok();
        }
    }
}
