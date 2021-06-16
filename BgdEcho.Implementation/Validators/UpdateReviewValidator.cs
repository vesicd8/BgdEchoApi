using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class UpdateReviewValidator : AbstractValidator<ReviewDto>
    {
        public UpdateReviewValidator(QueryBuilder queryBuilder)
        {
            RuleFor(x => x.Id)
                .Must(y => queryBuilder.FindById<Review>(y) != null)
                .WithMessage("Review does not exist")
                .DependentRules(() =>
                {
                    RuleFor(x => x.PostId)
                    .NotNull()
                    .WithMessage("Post is required.")
                    .DependentRules(() =>
                    {
                        RuleFor(x => x.PostId)
                            .Must(x => queryBuilder.FindById<Post>(x.Value) != null)
                            .When(x => x.PostId != null)
                            .WithMessage("Post does not exist");
                    });

                    RuleFor(x => x.UserId)
                        .NotNull()
                        .WithMessage("UserId is required.")
                        .DependentRules(() =>
                        {
                            RuleFor(x => x.UserId)
                                .Must(x => x == queryBuilder.Actor.Id)
                                .When(x => x.UserId != null)
                                .WithMessage("You are not allowed to perform this action.")
                                .DependentRules(() =>
                                {
                                    RuleFor(x => x.UserId)
                                        .Must(x => queryBuilder.FindById<User>(x.Value) != null)
                                        .When(x => x.UserId != null)
                                        .WithMessage("User does not exist")
                                        .DependentRules(() =>
                                        {
                                            RuleFor(x => x)
                                                .Must((y) => queryBuilder.Query<Review>().Where(x => x.PostId == y.PostId && x.UserId == y.UserId && x.Id == y.Id).FirstOrDefault() != null)
                                                .WithMessage("Review does not exist.");
                                        });
                                });
                        });

                    RuleFor(x => x.Rate)
                        .NotNull()
                        .WithMessage("Rate is required.")
                        .DependentRules(() =>
                        {
                            RuleFor(x => x.Rate)
                                .InclusiveBetween(1, 5)
                                .When(x => x.Rate != null)
                                .WithMessage("Rate needs to between 1 and 5.");
                        });
                });
        }
    }
}
