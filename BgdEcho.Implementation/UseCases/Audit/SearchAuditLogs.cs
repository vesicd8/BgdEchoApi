using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Audit;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Audit
{
    public class SearchAuditLogs : ISearchAuditLogsUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        public SearchAuditLogs(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => false;
        public int Id => 30;
        public string Name => "Search Audit Logs";
        public object Execute(BaseSearch request)
        {
            var query = _queryBuilder.Query<UseCaseLog>().OrderByDescending(x => x.Date).AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(request.Keyword.ToLower()));
            }

            return query.AsPagedResponse<UseCaseLogDto, UseCaseLog>(request, _mapper);
        }
    }
}
