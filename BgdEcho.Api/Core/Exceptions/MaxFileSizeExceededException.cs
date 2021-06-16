using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Exceptions
{
    public class MaxFileSizeExceededException : Exception
    {
        public string FileName { get; private set; }
        public MaxFileSizeExceededException(int size, string fileName) : base($"Maximum size exceeded ({size} bytes).")
        {
            FileName = fileName;
        }
    }
}
