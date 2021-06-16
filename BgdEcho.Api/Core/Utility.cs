using System;
using System.Security.Cryptography;

namespace BgdEcho.Api.Core
{
    public static class Utility
    {
        public static string GenerateRandomGuid()
        {
            var randomNumber = RandomNumberGenerator.Create();
            var bytes = new byte[16];

            randomNumber.GetBytes(bytes);

            var guid = new Guid(bytes);

            return guid.ToString();
        }
    }
}
