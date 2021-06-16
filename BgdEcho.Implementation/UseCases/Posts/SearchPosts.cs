using BgdEcho.Implementation.Extensions;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases;
using BgdEcho.Domain;
using System.Linq;
using BgdEcho.Application.DataTransfer;
using AutoMapper;
using BgdEcho.Application.UseCases.Posts;

namespace BgdEcho.Implementation.UseCases.Posts
{
    public class SearchPosts : IUseCaseOperation<PostsSearch, object>, ISearchPostsUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;
        public SearchPosts(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => true;

        public int Id => 8;

        public string Name => "Search Posts";

        public object Execute(PostsSearch request)
        {
            var query = _queryBuilder.BuildQuery<Post>();

            if (!string.IsNullOrWhiteSpace(request.Keyword))
            {
                query = query.Where(x => x.Header.ToLower().Contains(request.Keyword.ToLower()));
            }

            if (request.Category.HasValue)
            {
                query = query.Where(x => x.CategoryId == request.Category.Value);
            }

            if (request.Date != null)
            {
                query = query.Where(x => x.Date == request.Date);
            }

            switch (request.OrderByDirection)
            {
                case OrderByDirections.DESC:
                    query = query.OrderByDescending(x => x.Date);
                    break;
                case OrderByDirections.ASC:
                    query = query.OrderBy(x => x.Date);
                    break;
            }

            return query.AsPagedResponse<PostDto, Post>(request, _mapper);
        }
    }
}
