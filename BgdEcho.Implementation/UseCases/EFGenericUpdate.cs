using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases;
using BgdEcho.Domain;
using FluentValidation;

namespace BgdEcho.Implementation.UseCases
{
    public abstract class EFGenericUpdate<TEntity, TDto> : IUseCaseOperation<TDto, EmptyResponse>
        where TEntity : Entity
        where TDto : Dto
    {
        private readonly QueryBuilder _queryBuilder;
        private readonly IMapper _mapper;
        private readonly AbstractValidator<TDto> _validator;

        protected EFGenericUpdate(QueryBuilder queryBuilder, IMapper mapper, AbstractValidator<TDto> validator)
        {
            _queryBuilder = queryBuilder;
            _mapper = mapper;
            _validator = validator;
        }

        public abstract bool ShouldBeLogged { get; }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public EmptyResponse Execute(TDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = _queryBuilder.FindById<TEntity>(request.Id);

            _mapper.Map(request, item);

            _queryBuilder.Update(item);

            return EmptyResponse.Instance;
        }
    }
}
