using BgdEcho.Application;
using BgdEcho.Application.UseCases;
using BgdEcho.EfDataAccess;
using Newtonsoft.Json;
using System;

namespace BgdEcho.Implementation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly Context _context;

        public DatabaseUseCaseLogger(Context context)
        {
            _context = context;
        }

        public void Log(IApplicationActor actor, IUseCase useCase, object data)
        {
            _context.UseCaseLogs.Add(new Domain.UseCaseLog
            {
                Actor = $"ID: {actor.Id} [{actor.Identity}]",
                Data = JsonConvert.SerializeObject(data),
                Date = DateTime.UtcNow,
                UseCaseName = useCase.Name
            });

            _context.SaveChanges();
        }
    }
}
