using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Comments;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Comments
{
    public class FindComment : EFGenericFind<Comment, CommentDto>, FindCommentUseCase
    {
        public FindComment(QueryBuilder queryBuilder, IMapper mapper) : base(queryBuilder, mapper)
        {

        }
        public override bool ShouldBeLogged => false;

        public override int Id => 20;

        public override string Name => "Find Comment";
    }
}
