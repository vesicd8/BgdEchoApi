using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Roles;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Roles
{
    public class AddRole : EFGenericInsert<Role, RoleDto>, IAddRoleUseCase
    {
        public AddRole(QueryBuilder queryBuilder, IMapper mapper, AddRoleValidator validator) : base(mapper, queryBuilder, validator)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 26;

        public override string Name => "Add Role";
    }
}
