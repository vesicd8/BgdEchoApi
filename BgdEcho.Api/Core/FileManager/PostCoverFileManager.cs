using System.Collections.Generic;

namespace BgdEcho.Api.Core.FileManager
{
    public class PostCoverFileManager : LocalFileManager
    {
        protected override string Path => ApplicationSettings.CoverSource;
        protected override List<string> AllowedExtensions => new() { ".jpg", ".png", ".jpeg" };
        protected override int MaxSizeInBytes => 5242880;
    }
}
