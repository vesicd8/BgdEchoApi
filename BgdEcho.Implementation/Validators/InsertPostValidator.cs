using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.IO;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class InsertPostValidator : AbstractValidator<PostDto>
    {
        public InsertPostValidator(QueryBuilder queryBuilder)
        {
            RuleFor(x => x.CoverImageSource)
                .NotEmpty()
                .WithMessage("Image not uploaded")
                .DependentRules(() => 
                {
                    RuleFor(x => x.CoverImageSource)
                    .Must(x => File.Exists(Application.Application.CoverSource + $"\\{x}"))
                    .WithMessage("Selected image does not exist.");
                });

            RuleFor(x => x.Header).NotEmpty().WithMessage("Header is required.");

            RuleFor(x => x.Text).NotEmpty().WithMessage("Text for a post is required.");

            RuleFor(x => x.CategoryId)
                .Must(x => x.HasValue)
                .WithMessage("Category ID is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.CategoryId)
                        .Must(x => queryBuilder.FindById<Category>(x.Value) != null)
                        .WithMessage("Category does not exist.")
                        .When(x => x.CategoryId != null);
                });

            RuleForEach(x => x.Pictures).SetValidator(new PictureValidator(queryBuilder, false)).When(x => x.Pictures != null && x.Pictures.Any());
        }
    }
}
