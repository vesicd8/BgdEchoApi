using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class AddCategoryValidator : AbstractValidator<CategoryDto>
    {
        public AddCategoryValidator(QueryBuilder queryBuilder)
        {
            RuleFor(x => x.CategoryName).NotEmpty().WithMessage("Category name is required,.");

            RuleFor(x => x.CategoryName).Must(x => !queryBuilder.BuildQuery<Category>().Any(c => c.CategoryName == x)).WithMessage("Category name has already been taken.");
        }
    }
}
