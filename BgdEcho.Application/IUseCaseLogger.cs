using BgdEcho.Application.UseCases;

namespace BgdEcho.Application
{
    public interface IUseCaseLogger
    {
        public void Log(IApplicationActor actor, IUseCase useCase, object data);
    }
}
