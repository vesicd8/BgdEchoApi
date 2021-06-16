using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Comments;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Comments
{
    public class AddComment : EFGenericInsert<Comment, CommentDto>, IAddCommentUseCase
    {
        public AddComment(IMapper mapper, AddCommentValidator validator, QueryBuilder queryBuilder) : base(mapper, queryBuilder, validator)
        {
        }

        public override bool ShouldBeLogged => true;
        public override int Id => 16;
        public override string Name => "Add Comment";
    }
}
