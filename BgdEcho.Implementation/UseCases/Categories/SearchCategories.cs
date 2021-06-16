using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Categories;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Categories
{
    public class SearchCategories : ISearchCategoriesUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        public SearchCategories(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => true;

        public int Id => 3;

        public string Name => "Search Categories";

        public object Execute(BaseSearch request)
        {
            var query = _queryBuilder.BuildQuery<Category>();

            if (!string.IsNullOrWhiteSpace(request.Keyword))
            {
                query = query.Where(x => x.CategoryName.ToLower().Contains(request.Keyword.ToLower()));
            }

            return query.AsPagedResponse<CategoryDto, Category>(request, _mapper);
        }
    }
}
