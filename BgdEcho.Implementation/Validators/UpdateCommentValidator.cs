using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;

namespace BgdEcho.Implementation.Validators
{
    public class UpdateCommentValidator : AbstractValidator<CommentDto>
    {
        public UpdateCommentValidator(QueryBuilder queryBuilder)
        {
            
            RuleFor(x => x)
            .Custom((x, y) => 
            {
                var post = queryBuilder.FindById<Comment>(x.Id);

                if(post == null)
                {
                    y.AddFailure(new FluentValidation.Results.ValidationFailure("Id", "Comment not found."));
                }
                else
                {
                    if (x.PostId.HasValue)
                    {
                        if (post.PostId != x.PostId.Value)
                        {
                            y.AddFailure(new FluentValidation.Results.ValidationFailure("PostId", "You cannot change post on which comment has been made."));
                        }
                    }
                    else
                    {
                        y.AddFailure(new FluentValidation.Results.ValidationFailure("PostId", "PostId is not valid."));
                    }

                    if (x.UserId.HasValue && queryBuilder.Actor.Id == x.UserId.Value)
                    {
                        if (post.UserId != x.UserId.Value)
                        {
                            y.AddFailure(new FluentValidation.Results.ValidationFailure("UserId", "You cannot perform this action."));
                        }
                    }
                    else
                    {
                        y.AddFailure(new FluentValidation.Results.ValidationFailure("UserId", "UserId is not valid."));
                    }

                    if (string.IsNullOrEmpty(x.Content))
                    {
                        y.AddFailure(new FluentValidation.Results.ValidationFailure("Content", "Comment is required."));
                    }
                } 
            });
        }
    }
}
