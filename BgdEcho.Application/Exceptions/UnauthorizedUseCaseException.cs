using BgdEcho.Application.UseCases;
using System;

namespace BgdEcho.Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            : base($"{DateTime.UtcNow}\t\t(ID: {actor.Id}, Identity: {actor.Identity}) has tried to execute '{useCase.Name}'.")
        {

        }
    }
}
