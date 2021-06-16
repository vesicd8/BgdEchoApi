using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using FluentValidation;
using System.Linq;

namespace BgdEcho.Implementation.Validators
{
    public class AddUserValidator : AbstractValidator<UserDto>
    {
        public AddUserValidator(QueryBuilder queryBuilder)
        {
            var actor = queryBuilder.Actor;

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email address is required")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email)
                    .EmailAddress()
                    .WithMessage("Format of an email address is not valid.")
                    .DependentRules(() =>
                    {
                        RuleFor(x => x.Email)
                        .Must(x => !queryBuilder.BuildQuery<User>().Any(y => y.Email == x))
                        .WithMessage("Email address is already in use.");
                    });
                });

            RuleFor(x => x.Username)
                .NotEmpty()
                .WithMessage("Username is required")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Username)
                    .Must(x => !queryBuilder.BuildQuery<User>().Any(y => y.Username == x))
                    .WithMessage("Username is already in use.");
                });

            RuleFor(x => x.RoleId)
                .Must(x => x == 1)
                .When(x => !queryBuilder.Actor.IsSuperAdmin)
                .WithMessage("You are not allowed to choose role.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.RoleId)
                        .Must((y, x) => queryBuilder.FindById<Role>(x) != null)
                        .WithMessage("Role does not exist.");
                });

            RuleFor(x => x.Password)
            .NotEmpty()
            .WithMessage("Password is required")
            .DependentRules(() =>
            {
                RuleFor(x => x.Password)
                .Matches(@"^(?=.*[\.\+\!\*])(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                .WithMessage("Password needs to contain at least one character, one special character and one number, with minimum length of 8 and maximum length of 25 characters.");
            });

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name is required.");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name is required.");

            RuleFor(x => x.IsModerator)
                .Must(y => !y)
                .When(x => !actor.CanGiveModeratorRole || !actor.IsSuperAdmin)
                .WithMessage("You are not allowed to grant moderator role.");

            RuleFor(x => x.CanGrantModeratorRole)
                .Must(y => !y)
                .When(x => !actor.IsSuperAdmin)
                .WithMessage("You are not allowed to grant moderator role to others.");
        }
    }
}