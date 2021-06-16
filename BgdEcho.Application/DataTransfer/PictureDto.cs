namespace BgdEcho.Application.DataTransfer
{
    public class PictureDto : Dto
    {
        public int? PostId { get; set; }
        public string PictureSource { get; set; }
        public string PictureAlt { get; set; }
    }
}
