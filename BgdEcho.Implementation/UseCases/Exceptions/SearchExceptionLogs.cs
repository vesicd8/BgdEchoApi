using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Exceptions;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Implementation.UseCases.Exceptions
{
    public class SearchExceptionLogs : ISearchExceptionLogsUseCase
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        public SearchExceptionLogs(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public bool ShouldBeLogged => false;

        public int Id => 32;

        public string Name => "Search Exception Logs";

        public object Execute(BaseSearch request)
        {
            var query = _queryBuilder.Query<ExceptionLog>();
            return query.AsPagedResponse<ExceptionLogDto, ExceptionLog>(request, _mapper);
        }
    }
}
