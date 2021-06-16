using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Roles;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Roles
{
    public class SearchRoles : ISearchRolesUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        public SearchRoles(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => false;

        public int Id => 31;

        public string Name => "Search Roles";

        public object Execute(BaseSearch request)
        {
            var query = _queryBuilder.BuildQuery<Role>().Where(x => !x.UseCases.Any(u => u.UseCaseId == 1000));

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.RoleName.ToLower().Contains(request.Keyword.ToLower()));
            }

            return query.AsPagedResponse<RoleDto, Role>(request, _mapper);
        }
    }
}
