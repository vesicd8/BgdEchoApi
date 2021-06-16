using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Roles;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Roles
{
    public class FindRole : EFGenericFind<Role, RoleDto>, IFindRoleUseCase
    {
        public FindRole(QueryBuilder queryBuilder, IMapper mapper) : base(queryBuilder, mapper)
        {
        }
        public override bool ShouldBeLogged => false;

        public override int Id => 28;

        public override string Name => "Find Role";
    }
}
