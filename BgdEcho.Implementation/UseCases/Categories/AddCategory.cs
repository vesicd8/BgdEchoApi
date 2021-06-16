using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Categories;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Categories
{
    public class AddCategory : EFGenericInsert<Category, CategoryDto>, IAddCategoryUseCase
    {
        public AddCategory(IMapper _mapper, QueryBuilder _queryBuilder, AddCategoryValidator _validator) : base(_mapper, _queryBuilder, _validator)
        {
        }

        public override bool ShouldBeLogged => true;
        public override int Id => 1;
        public override string Name => "Add Category";
    }
}
