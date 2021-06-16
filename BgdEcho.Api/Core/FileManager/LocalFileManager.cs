using BgdEcho.Api.Core.Exceptions;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace BgdEcho.Api.Core.FileManager
{
    public abstract class LocalFileManager : IFileManager
    {
        protected abstract string Path { get; }
        protected abstract List<string> AllowedExtensions { get; }
        protected abstract int MaxSizeInBytes { get; }
        public virtual bool Validate(IFormFile file)
        {
            var extension = System.IO.Path.GetExtension(file.FileName);
            if (file.Length > MaxSizeInBytes)
            {
                throw new MaxFileSizeExceededException(MaxSizeInBytes, file.FileName);
            }

            if(!AllowedExtensions.Any(x => x == extension))
            {
                throw new ExtensionNotAllowedException(extension, file.FileName);
            }

            return true;
        }
        public string Upload(IFormFile file)
        {
            var extension = System.IO.Path.GetExtension(file.FileName);
            var newFileName = Utility.GenerateRandomGuid() + extension;

            var fullPath = System.IO.Path.Combine(Path, newFileName);

            if (Validate(file))
            {
                using var fileStream = new FileStream(fullPath, FileMode.Create);
                file.CopyTo(fileStream);
            }

            return newFileName;
        }

        public void Delete(string fileName)
        {
            var fullPath = System.IO.Path.Combine(Path, fileName);

            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }
        }

    }
}
