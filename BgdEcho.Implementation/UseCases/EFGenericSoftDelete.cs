using BgdEcho.Application.UseCases;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases
{
    public abstract class EFGenericSoftDelete<TEntity> : IUseCaseOperation<int, EmptyResponse>
        where TEntity : Entity
    {
        private readonly QueryBuilder _queryBuilder;

        protected EFGenericSoftDelete(QueryBuilder queryBuilder)
        {
            _queryBuilder = queryBuilder;
        }

        public abstract bool ShouldBeLogged { get; }
        public abstract int Id { get; }
        public abstract string Name { get; }
        public EmptyResponse Execute(int request)
        {
            _queryBuilder.DeleteById<TEntity>(request);
            return EmptyResponse.Instance;
        }
    }
}
