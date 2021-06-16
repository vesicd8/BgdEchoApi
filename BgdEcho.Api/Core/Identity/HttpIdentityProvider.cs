using BgdEcho.Api.Core.Actors;
using BgdEcho.Application;
using BgdEcho.Application.Exceptions;
using BgdEcho.Domain;
using BgdEcho.Implementation;
using System.Linq;

namespace BgdEcho.Api.Core.Identity
{
    public class HttpIdentityProvider : IIdentityProvider
    {
        private readonly QueryBuilder _queryBuilder;

        public HttpIdentityProvider(QueryBuilder queryBuilder)
        {
            _queryBuilder = queryBuilder;
        }

        public IApplicationActor GetUser(string username, string password)
        {
            IApplicationActor actor = null;

            var user = _queryBuilder.BuildQuery<User>().FirstOrDefault(x => x.Username == username && x.Password == password);

            if (user == null)
            {
                throw new UserNotFoundException();
            }

            actor = new JwtActor
            {
                Id = user.Id,
                Identity = user.Username,
                AllowedUseCases = user.Role.UseCases.Select(x => x.UseCaseId),
                IsModerator = user.IsModerator,
                CanGiveModeratorRole = user.CanGrantModeratorRole
            };

            return actor;
        }

        public IApplicationActor GetUserById(int userId)
        {
            IApplicationActor actor = null;

            var user = _queryBuilder.FindById<User>(userId);

            if (user != null)
            {
                actor = new JwtActor
                {
                    Id = user.Id,
                    Identity = user.Username,
                    AllowedUseCases = user.Role.UseCases.Select(x => x.UseCaseId)
                };
            }

            return actor;
        }
    }
}
