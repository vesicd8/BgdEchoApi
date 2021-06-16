namespace BgdEcho.Api.Core.Jwt
{
    public interface IJwtStorage
    {
        void Add(int userId, string refreshToken, string accessToken);
        void Remove(string refreshToken);
        JwtRecord FindByAccessToken(string accessToken);
        JwtRecord FindByRefreshToken(string refreshToken);
    }
}
