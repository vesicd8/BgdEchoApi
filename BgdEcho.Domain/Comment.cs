namespace BgdEcho.Domain
{
    public class Comment : Entity
    {
        public int UserId { get; set; }
        public int PostId { get; set; }
        public virtual User User{ get; set; }
        public virtual Post Post { get; set; }
        public string Content { get; set; }
    }
}
