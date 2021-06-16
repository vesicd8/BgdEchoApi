using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Categories;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Categories
{
    public class UpdateCategory : EFGenericUpdate<Category, CategoryDto>, IUpdateCategoryUseCase
    {
        public UpdateCategory(QueryBuilder _queryBuilder, UpdateCategoryValidator _validator, IMapper _mapper) : base(_queryBuilder, _mapper, _validator)
        {
        }
        public override bool ShouldBeLogged => true;

        public override int Id => 4;

        public override string Name => "Update Category";
    }
}
