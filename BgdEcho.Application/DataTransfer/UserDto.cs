namespace BgdEcho.Application.DataTransfer
{
    public class UserDto : Dto
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int RoleId { get; set; } = 1;
        public bool IsModerator { get; set; } = false;
        public bool CanGrantModeratorRole { get; set; } = false;
    }
}
