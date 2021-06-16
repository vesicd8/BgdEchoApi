using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Domain
{
    public class ExceptionLog
    {
        public int Id { get; set; }
        public string ExceptionMessage { get; set; }
        public DateTime Date { get; set; }
    }
}
