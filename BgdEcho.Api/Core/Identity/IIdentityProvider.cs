using BgdEcho.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Identity
{
    public interface IIdentityProvider
    {
        IApplicationActor GetUser(string username, string password);
        IApplicationActor GetUserById(int userId);
    }
}
