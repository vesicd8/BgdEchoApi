using System;

namespace BgdEcho.Application
{
    public interface IExceptionLogger
    {
        void Log(Exception e);
    }
}
