using System;

namespace BgdEcho.Api.Core.Jwt
{
    public class JwtRecord
    {
        public int UserId { get; set; }
        public string AccessToken { get; set; }
        public DateTimeOffset AccessTokenExpirationDate { get; set; }
        public string RefreshToken { get; set; }
        public DateTimeOffset RefreshTokenExpirationDate { get; set; }
    }
}
