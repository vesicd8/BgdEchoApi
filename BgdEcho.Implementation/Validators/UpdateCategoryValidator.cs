using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(QueryBuilder queryBuilder)
        {
            RuleFor(x => x.CategoryName).NotEmpty().WithMessage("Category name is required,.");

            RuleFor(x => x.CategoryName).Must((y, x) => !queryBuilder.BuildQuery<Category>().Any(c => c.CategoryName == x && c.Id != y.Id)).WithMessage("Category name has already been taken.");
        }
    }
}
