using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;

namespace BgdEcho.Implementation.Validators
{
    public class AddCommentValidator : AbstractValidator<CommentDto>
    {
        public AddCommentValidator(QueryBuilder queryBuilder)
        {
            RuleFor(x => x.UserId)
                .Must(x => x == queryBuilder.Actor.Id && queryBuilder.FindById<User>(x.Value) != null)
                .WithMessage("You cannot perform this action.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.PostId)
                    .Must(x => queryBuilder.FindById<Post>(x.Value) != null)
                    .WithMessage("Post does not exist.");

                    RuleFor(x => x.Content)
                    .NotEmpty()
                    .WithMessage("Comment is required and cannot be empty.");
                });
        }
    }
}
