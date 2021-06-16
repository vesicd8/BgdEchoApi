using BgdEcho.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Jwt
{
    public interface IJwtValidator
    {
        bool IsValid(JwtRecord record);
    }
}
