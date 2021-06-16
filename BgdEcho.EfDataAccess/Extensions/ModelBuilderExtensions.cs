using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Linq;
using System.Linq.Expressions;

namespace BgdEcho.EfDataAccess.Extensions
{
    public static class ModelBuilderExtensions
    {
        public static void ApplyGlobalFilters<T>(this ModelBuilder modelBuilder, Expression<Func<T, bool>> expression)
        {
            var entities = modelBuilder.Model
                .GetEntityTypes()
                .Where(e => e.ClrType.BaseType.Name == (typeof(T).Name))
                .Select(e => e.ClrType);

            foreach (var entity in entities)
            {
                var newParam = Expression.Parameter(entity);
                var newBody = ReplacingExpressionVisitor.Replace(expression.Parameters.Single(), newParam, expression.Body);
                modelBuilder.Entity(entity).HasQueryFilter(Expression.Lambda(newBody, newParam));
            }
        }
    }
}
