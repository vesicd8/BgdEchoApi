using System.Collections.Generic;

namespace BgdEcho.Application
{
    public interface IApplicationActor
    {
        public int Id { get; }
        public string Identity { get; }
        public IEnumerable<int> AllowedUseCases { get; }
        public bool IsSuperAdmin { get; }
        public bool IsModerator { get; }
        public bool CanGiveModeratorRole { get; }
    }
}
