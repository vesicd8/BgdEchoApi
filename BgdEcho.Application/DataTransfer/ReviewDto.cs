namespace BgdEcho.Application.DataTransfer
{
    public class ReviewDto : Dto
    {
        public int? UserId { get; set; }
        public int? PostId { get; set; }
        public int? Rate { get; set; }
    }
}
