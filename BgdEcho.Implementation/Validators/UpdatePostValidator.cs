using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.IO;

namespace BgdEcho.Implementation.Validators
{
    public class UpdatePostValidator : AbstractValidator<UpdatePostDto>
    {
        public UpdatePostValidator(QueryBuilder queryBuilder)
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
        }
    }
}
