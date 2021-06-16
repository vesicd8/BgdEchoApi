using System.IO;

namespace BgdEcho.Api.Core
{
    public static class ApplicationSettings
    {
        public static string JwtIssuer => "bgd_echo";
        public static string JwtKey => "12nuf9ewnfu9ewnfy83u2g2rbu9fe";
        public static int AccessTokenExpirationMinutes => 120;
        public static int RefreshTokenExpirationMinutes => 240;
        public static string CoverSource => Path.Combine("wwwroot", "covers");
        public static string ImagesSource => Path.Combine("wwwroot", "images");
    }
}
