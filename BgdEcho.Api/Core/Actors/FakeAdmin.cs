using BgdEcho.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Actors
{
    public class FakeAdmin : IApplicationActor
    {
        public int Id => 1;
        public string Identity => "Fake Admin";
        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 1000);
        public bool IsSuperAdmin => true;
        public bool IsModerator => true;
        public bool CanGiveModeratorRole => true;
    }
}
