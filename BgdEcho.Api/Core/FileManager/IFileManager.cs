using Microsoft.AspNetCore.Http;

namespace BgdEcho.Api.Core.FileManager
{
    public interface IFileManager
    {
        bool Validate(IFormFile file);
        string Upload(IFormFile file);
        void Delete(string path);
    }
}
