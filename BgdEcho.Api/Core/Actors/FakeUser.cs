using BgdEcho.Application;
using System.Collections.Generic;

namespace BgdEcho.Api.Core.Actors
{
    public class FakeUser : IApplicationActor
    {
        public int Id => 1;
        public string Identity => "Fake user";
        public IEnumerable<int> AllowedUseCases => Application.Application.AnonymousActorUseCases;
        public bool IsSuperAdmin => false;
        public bool IsModerator => false;
        public bool CanGiveModeratorRole => false;
    }
}
