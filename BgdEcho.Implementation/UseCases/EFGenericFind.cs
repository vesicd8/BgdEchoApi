using BgdEcho.Application.UseCases;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using AutoMapper;

namespace BgdEcho.Implementation.UseCases
{
    public abstract class EFGenericFind<TEntity, TResult> : IUseCaseOperation<int, TResult>
        where TResult : Dto
        where TEntity : Entity
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;

        protected EFGenericFind(QueryBuilder queryBuilder, IMapper mapper)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
        }

        public abstract bool ShouldBeLogged { get; }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public virtual TResult Execute(int request)
        {
            var item = _queryBuilder.FindById<TEntity>(request);
            return _mapper.Map<TResult>(item);
        }
    }
}
