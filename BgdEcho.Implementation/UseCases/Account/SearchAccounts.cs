using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.Searches;
using BgdEcho.Application.UseCases.Account;
using BgdEcho.Domain;
using BgdEcho.Implementation.Extensions;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Account
{
    public class SearchAccounts : ISearchAccountsUseCase
    {
        private readonly IMapper _mapper;
        private readonly QueryBuilder _queryBuilder;

        public SearchAccounts(IMapper mapper, QueryBuilder queryBuilder)
        {
            _mapper = mapper;
            _queryBuilder = queryBuilder;
        }

        public bool ShouldBeLogged => false;

        public int Id => 15;

        public string Name => "Search Accounts";

        public object Execute(BaseSearch request)
        {
            var query = _queryBuilder.BuildQuery<User>();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                var keyword = request.Keyword.ToLower();
                query = query.Where(x =>
                                    x.FirstName.ToLower().Contains(keyword) ||
                                    x.LastName.ToLower().Contains(keyword) ||
                                    x.Username.ToLower().Contains(keyword));
            }

            return query.AsPagedResponse<UserDto, User>(request, _mapper);
        }
    }
}
