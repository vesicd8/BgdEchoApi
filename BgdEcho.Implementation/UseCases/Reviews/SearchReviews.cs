using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Reviews;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Reviews
{
    public class SearchReviews : ISearchReviewsUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        public SearchReviews(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => false;

        public int Id => 25;

        public string Name => "Search Reviews";

        public object Execute(ReviewSearch request)
        {
            var query = _queryBuilder.BuildQuery<Review>();

            if (request.PostId.HasValue)
            {
                query = query.Where(x => x.PostId == request.PostId.Value);
            }

            return query.AsPagedResponse<ReviewDto, Review>(request, _mapper);
        }
    }
}
