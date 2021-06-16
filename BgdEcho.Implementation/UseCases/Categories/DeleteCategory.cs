using BgdEcho.Application.UseCases.Categories;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Categories
{
    public class DeleteCategory : EFGenericDeactivate<Category>, IDeleteCategoryUseCase
    {
        public DeleteCategory(QueryBuilder _queryBuilder) : base(_queryBuilder)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 2;

        public override string Name => "Delete Category";
    }
}
