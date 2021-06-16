using AutoMapper;
using AutoMapper.QueryableExtensions;
using BgdEcho.Application.Searches;
using System.Linq;

namespace BgdEcho.Implementation.Extensions
{
    public static class QueryExtensions
    {
        public static object AsPagedResponse<TDto, TEntity>(this IQueryable<TEntity> query, BaseSearch search, IMapper mapper)
            where TDto : class
        {
            if (search.Paged)
            {
                int skip = search.PerPage * (search.CurrentPage - 1);

                return new PagedResponse<TDto>
                {
                    Current = search.CurrentPage,
                    PerPage = search.PerPage,
                    Total = query.Count(),
                    Items = query.Skip(skip).Take(search.PerPage).ProjectTo<TDto>(mapper.ConfigurationProvider).ToList()
                };
            }

            return query.ProjectTo<TDto>(mapper.ConfigurationProvider).ToList();
        }
    }
}
