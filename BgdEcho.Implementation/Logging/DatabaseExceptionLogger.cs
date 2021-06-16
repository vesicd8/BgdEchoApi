using BgdEcho.Application;
using BgdEcho.Domain;
using BgdEcho.EfDataAccess;
using System;

namespace BgdEcho.Implementation.Logging
{
    public class DatabaseExceptionLogger : IExceptionLogger
    {
        private readonly Context _context;

        public DatabaseExceptionLogger(Context context)
        {
            _context = context;
        }

        public void Log(Exception e)
        {
            _context.ExceptionLogs.Add(new ExceptionLog
            {
                ExceptionMessage = e.Message,
                Date = DateTime.Now
            });

            _context.SaveChanges();
        }
    }
}
