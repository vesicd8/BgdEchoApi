using System;

namespace BgdEcho.Application.DataTransfer
{
    public class CommentDto : Dto
    {
        public string Username { get; set; }
        public int? PostId { get; set; }
        public int? UserId { get; set; }
        public string Content { get; set; }
        public DateTime Date { get; set; }
    }
}
