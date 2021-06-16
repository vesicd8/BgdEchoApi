using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Exceptions
{
    public class ExtensionNotAllowedException : Exception
    {
        public string FileName { get; private set; }
        public ExtensionNotAllowedException(string ext, string fileName) : base($"[{ext}] extension of a file is not allowed.")
        {
            FileName = fileName;
        }
    }
}
