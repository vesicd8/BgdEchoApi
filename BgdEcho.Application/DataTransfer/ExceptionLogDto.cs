using System;

namespace BgdEcho.Application.DataTransfer
{
    public class ExceptionLogDto
    {
        public int Id { get; set; }
        public string ExceptionMessage { get; set; }
        public DateTime Date { get; set; }
    }
}
