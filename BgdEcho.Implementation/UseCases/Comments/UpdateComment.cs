using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Comments;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Comments
{
    public class UpdateComment : EFGenericUpdate<Comment, CommentDto>, IUpdateCommentUseCase
    {
        public UpdateComment(IMapper mapper, UpdateCommentValidator validator, QueryBuilder queryBuilder) : base(queryBuilder, mapper, validator)
        {
        }

        public override bool ShouldBeLogged => true;
        public override int Id => 17;
        public override string Name => "Update Comment";
    }
}
