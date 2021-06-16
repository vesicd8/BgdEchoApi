using System;
using System.Collections.Generic;

namespace BgdEcho.Application.DataTransfer
{
    public class PostDto : Dto
    {
        public string Header { get; set; }
        public string Text { get; set; }
        public string CoverImageSource { get; set; }
        public int? CategoryId { get; set; }
        public string Category { get; set; }
        public int NumberOfComments { get; set; }
        public IEnumerable<PictureDto> Pictures { get; set; } = new List<PictureDto>();
        public DateTime Date { get; set; }
        public double? Rating { get; set; }
    }
}
