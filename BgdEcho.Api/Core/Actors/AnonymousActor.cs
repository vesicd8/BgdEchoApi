using BgdEcho.Application;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Api.Core.Actors
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;
        public string Identity => "Anonymous Actor";
        public IEnumerable<int> AllowedUseCases => Application.Application.AnonymousActorUseCases;
        public bool IsSuperAdmin => false;
        public bool IsModerator => false;
        public bool CanGiveModeratorRole => false;
    }
}
