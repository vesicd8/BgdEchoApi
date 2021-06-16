using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class UpdateRoleValidator : AbstractValidator<RoleDto>
    {
        private readonly QueryBuilder _queryBuilder;
        public UpdateRoleValidator(QueryBuilder queryBuilder)
        {
            _queryBuilder = queryBuilder;

            RuleFor(x => x.RoleName).NotEmpty().WithMessage("Role name is required.");

            RuleFor(x => x.Id)
                .Must(x => GetRole(x) != null)
                .WithMessage("Role does not exist.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Id)
                        .Must(x => !GetRole(x).IsSuperAdminRole)
                        .WithMessage("Super Admin role cannot be modified.")
                        .DependentRules(() =>
                        {
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
                                                .WithMessage($"Use case does not exist");
                                        });
                                });
                        });
                });
        }

        private Role GetRole(int id)
        {
            return _queryBuilder.FindById<Role>(id);
        }
    }
}
