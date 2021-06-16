using BgdEcho.Domain;
using System.Linq;

namespace BgdEcho.EfDataAccess.Extensions
{
    public static class QueryExtensions
    {
        public static IQueryable<TEntity> ExcludeInactive<TEntity>(this IQueryable<TEntity> query)
            where TEntity : Entity
        {
            return query.Where(x => x.IsActive);
        }
    }
}
