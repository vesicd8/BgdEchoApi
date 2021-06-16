namespace BgdEcho.Application.UseCases
{
    public interface IUseCaseOperation<TRequest, TResponse> : IUseCase
        where TResponse : class
    {
        TResponse Execute(TRequest request);
        bool ShouldBeLogged { get; }
    }
}
