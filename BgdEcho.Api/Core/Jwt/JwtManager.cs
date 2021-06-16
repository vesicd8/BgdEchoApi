using BgdEcho.Api.Core.Identity;
using BgdEcho.Application;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Jwt
{
    public class JwtManager
    {
        public JwtToken GenerateToken(IApplicationActor _actor)
        {
            return new JwtToken
            {
                AccessToken = MakeAccessToken(_actor),
                RefreshToken = RefreshToken
            };
        }

        private string MakeAccessToken(IApplicationActor actor)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                new Claim(JwtRegisteredClaimNames.Iss, ApplicationSettings.JwtIssuer, ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, ApplicationSettings.JwtIssuer),
                new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, ApplicationSettings.JwtIssuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ApplicationSettings.JwtKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: ApplicationSettings.JwtIssuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddMinutes(ApplicationSettings.AccessTokenExpirationMinutes),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
        private string RefreshToken
        {
            get
            {
                var refreshTokenSerialNumber = Utility.GenerateRandomGuid();
                var claims = new List<Claim>
                {
                    new Claim(JwtRegisteredClaimNames.Jti, Utility.GenerateRandomGuid(), ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                    new Claim(JwtRegisteredClaimNames.Iss, ApplicationSettings.JwtIssuer, ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                    new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.String, ApplicationSettings.JwtIssuer),
                    new Claim("SerialNumber", refreshTokenSerialNumber, ClaimValueTypes.String, ApplicationSettings.JwtIssuer)
                };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ApplicationSettings.JwtKey));
                var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                var now = DateTime.UtcNow;
                var token = new JwtSecurityToken(
                    issuer: ApplicationSettings.JwtIssuer,
                    audience: "Any",
                    claims: claims,
                    notBefore: now,
                    expires: now.AddMinutes(ApplicationSettings.RefreshTokenExpirationMinutes),
                    signingCredentials: creds);

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
        }
    }

    public class JwtToken
    {
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
    }
}
