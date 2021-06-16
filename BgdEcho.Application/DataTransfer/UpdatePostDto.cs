using System;

namespace BgdEcho.Application.DataTransfer
{
    public class UpdatePostDto : Dto
    {
        public string Header { get; set; }
        public string Text { get; set; }
        public string CoverImageSource { get; set; }
        public int? CategoryId { get; set; }
        public bool IsActive { get; set; } = true;
        public DateTime Date { get; set; }
    }
}
