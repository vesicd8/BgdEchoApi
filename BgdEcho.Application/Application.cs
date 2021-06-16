using System.Collections.Generic;
using System.IO;

namespace BgdEcho.Application
{
    public static class Application
    {
        public static List<int> AnonymousActorUseCases => new() { 3, 8, 10, 13, 19, 20, 25 };
        public static string CoverSource => Path.Combine("wwwroot", "covers");
        public static string ImagesSource => Path.Combine("wwwroot", "images");
    }
}
