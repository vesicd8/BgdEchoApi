using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.IO;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class PictureValidator : AbstractValidator<PictureDto>
    {
        public PictureValidator(QueryBuilder queryBuilder, bool validatePostId = true)
        {
            RuleFor(x => x.PictureAlt).NotEmpty().WithMessage("Picture alt is required.");

            RuleFor(x => x.PictureSource)
                .NotEmpty()
                .WithMessage("Picture source is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.PictureSource)
                    .Must(x => File.Exists(Application.Application.ImagesSource + $"\\{x}"))
                    .WithMessage("Selected image does not exist.");
                });

            if (validatePostId)
            {
                RuleFor(x => x.PostId)
                    .Must(x => x.HasValue)
                    .WithMessage("Post ID is required.")
                    .DependentRules(() => 
                    {
                        RuleFor(x => x.PostId)
                        .Must(x => queryBuilder.BuildQuery<Post>().Any(p => p.Id == x.Value))
                        .WithMessage("Post does not exist");
                    });
            }
        }
    }
}
