using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Categories;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Categories
{
    public class FindCategory : EFGenericFind<Category, CategoryDto>, IFindCategoryUseCase
    {
        public FindCategory(QueryBuilder queryBuilder, IMapper mapper) : base(queryBuilder, mapper)
        {
        }

        public override bool ShouldBeLogged => false;

        public override int Id => 5;

        public override string Name => "Find Category";
    }
}
