using Microsoft.AspNetCore.Http;
using System.Collections.Generic;

namespace BgdEcho.Api.Core.FileManager
{
    public class PostImagesFileManager : LocalFileManager
    {
        protected override string Path => ApplicationSettings.ImagesSource;
        protected override List<string> AllowedExtensions => new() { ".jpg", ".png", ".jpeg" };
        protected override int MaxSizeInBytes => 5242880;

        public List<object> UploadMany(IEnumerable<IFormFile> files)
        {
            List<object> sources = new();

            foreach(var file in files)
            {
                Validate(file);
            }

            foreach(var file in files)
            {
                var fileName = Upload(file);
                sources.Add(new { src = fileName });
            }

            return sources;
        }
    }
}
