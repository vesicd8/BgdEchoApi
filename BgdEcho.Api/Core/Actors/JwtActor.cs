using BgdEcho.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core.Actors
{
    public class JwtActor : IApplicationActor
    {
        public int Id { get; set; }
        public string Identity { get; set; }
        public IEnumerable<int> AllowedUseCases { get; set; }
        public bool IsSuperAdmin => AllowedUseCases.Any(x => x == 1000);
        public bool IsModerator { get; set; }
        public bool CanGiveModeratorRole { get; set; }
    }
}
