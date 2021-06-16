using BgdEcho.Application.DataTransfer;
using FluentValidation;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class AddRoleValidator : AbstractValidator<RoleDto>
    {
        public AddRoleValidator()
        {
            RuleFor(x => x.RoleName)
                .NotEmpty()
                .WithMessage("Role name is required.");

            RuleFor(x => x.UseCases)
                .Must(x => x.Any())
                .WithMessage("List of use cases cannot be empty.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UseCases)
                        .Must(x => x.Count() == x.Distinct().Count())
                        .WithMessage("Duplicate use cases are not allowed.")
                        .DependentRules(() =>
                        {
                            RuleForEach(x => x.UseCases)
                                .Must(x => UseCases.UseCases.UseCaseList.Any(u => u.Id == x))
                                .WithMessage("Use case does not exist");
                        });
                });
        }
    }
}
