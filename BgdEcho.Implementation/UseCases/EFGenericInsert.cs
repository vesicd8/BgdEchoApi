using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases;
using BgdEcho.Domain;
using FluentValidation;

namespace BgdEcho.Implementation.UseCases
{
    public abstract class EFGenericInsert<TEntity, TRequest> : IUseCaseOperation<TRequest, EmptyResponse>
        where TEntity : Entity
        where TRequest : Dto
    {
        private readonly IMapper _mapper;
        private readonly QueryBuilder _queryBuilder;
        private readonly AbstractValidator<TRequest> _validator;

        protected EFGenericInsert(IMapper mapper, QueryBuilder queryBuilder, AbstractValidator<TRequest> validator)
        {
            _mapper = mapper;
            _queryBuilder = queryBuilder;
            _validator = validator;
        }

        public abstract bool ShouldBeLogged { get; }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public EmptyResponse Execute(TRequest request)
        {
            _validator.ValidateAndThrow(request);

            var item = _mapper.Map<TEntity>(request);

            _queryBuilder.Insert(item);

            return EmptyResponse.Instance;
        }
    }
}
