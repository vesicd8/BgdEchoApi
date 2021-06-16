using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Roles;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Roles
{
    public class UpdateRole : EFGenericUpdate<Role, RoleDto>, IUpdateRoleUseCase
    {
        public UpdateRole(QueryBuilder queryBuilder, IMapper mapper, UpdateRoleValidator validator) : base(queryBuilder, mapper, validator)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 27;

        public override string Name => "Update Role";
    }
}
