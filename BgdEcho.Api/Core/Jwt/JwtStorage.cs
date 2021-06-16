using System;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Api.Core.Jwt
{
    public class JwtStorage : IJwtStorage, IJwtValidator
    {
        private static readonly List<JwtRecord> _users = new();

        public void Add(int userId, string refreshToken, string accessToken)
        {
            _users.Add(GenerateTokenRecord(userId, refreshToken, accessToken));
        }

        public JwtRecord FindByAccessToken(string accessToken)
        {
            return _users.FirstOrDefault(x =>x.AccessToken == accessToken);
        }

        public JwtRecord FindByRefreshToken(string refreshToken)
        {
            return _users.FirstOrDefault(x => x.RefreshToken == refreshToken);
        }

        public bool IsValid(JwtRecord record)
        {
            return record.RefreshTokenExpirationDate >= DateTimeOffset.UtcNow;
        }

        public void Remove(string refreshToken)
        {
            var item = _users.FirstOrDefault(x => x.RefreshToken == refreshToken);

            if(item != null)
            {
                _users.Remove(item);
            }
        }

        private static JwtRecord GenerateTokenRecord(int userId, string refreshToken, string accessToken)
        {
            var time = DateTimeOffset.UtcNow;
            return new JwtRecord
            {
                UserId = userId,
                AccessToken = accessToken,
                RefreshToken = refreshToken,
                AccessTokenExpirationDate = time.AddMinutes(ApplicationSettings.AccessTokenExpirationMinutes),
                RefreshTokenExpirationDate = time.AddMinutes(ApplicationSettings.RefreshTokenExpirationMinutes)
            };
        }
    }
}
