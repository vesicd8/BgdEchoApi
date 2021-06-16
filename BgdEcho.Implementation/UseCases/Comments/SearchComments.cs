using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Comments;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Comments
{
    public class SearchComments : ISearchCommentsUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;
        public SearchComments(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => false;

        public int Id => 19;

        public string Name => "Search Comments";

        public object Execute(CommentSearch request)
        {
            var query = _queryBuilder.BuildQuery<Comment>();

            if (request.PostId.HasValue)
            {
                query = query.Where(x => x.PostId == request.PostId.Value);
            }

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.User.Username.ToLower().Contains(request.Keyword.ToLower()));
            }

            return query.AsPagedResponse<CommentDto, Comment>(request, _mapper);

        }
    }
}
