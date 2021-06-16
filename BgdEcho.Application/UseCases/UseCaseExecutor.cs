using BgdEcho.Application.Exceptions;
using System.Linq;

namespace BgdEcho.Application.UseCases
{
    public class UseCaseExecutor
    {
        private readonly IApplicationActor _actor;
        private readonly IUseCaseLogger _logger;

        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger logger)
        {
            _actor = actor;
            _logger = logger;
        }

        public TResult Execute<TRequest, TResult>(IUseCaseOperation<TRequest, TResult> useCase, TRequest request)
            where TResult : class
        {
            if (useCase.ShouldBeLogged)
            {
                _logger.Log(_actor, useCase, request);
            }

            if (!_actor.IsSuperAdmin && !_actor.AllowedUseCases.Any(x => x == useCase.Id))
            {
                throw new UnauthorizedUseCaseException(useCase, _actor);
            }

            return useCase.Execute(request);
        }
    }
}
