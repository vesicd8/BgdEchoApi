using BgdEcho.Application.UseCases.Roles;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Roles
{
    public class DeleteRole : EFGenericDeactivate<Role>, IDeleteRoleUseCase
    {
        public DeleteRole(QueryBuilder queryBuilder) : base(queryBuilder)
        {
        }
        public override bool ShouldBeLogged => true;
        public override int Id => 29;
        public override string Name => "Deactivate Role";
    }
}
