using BgdEcho.Application.Exceptions;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Reviews;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Reviews
{
    public class DeleteReview : IDeleteReviewUseCase
    {
        private readonly QueryBuilder queryBuilder;

        public DeleteReview(QueryBuilder queryBuilder)
        {
            this.queryBuilder = queryBuilder;
        }

        public bool ShouldBeLogged => true;

        public int Id => 24;

        public string Name => "Delete Review";

        public EmptyResponse Execute(int request)
        {
            var item = queryBuilder.FindById<Review>(request);
            var actor = queryBuilder.Actor;

            if (item.Id != actor.Id && (!actor.IsSuperAdmin && !actor.IsModerator))
            {
                throw new UnauthorizedActionException();
            }

            queryBuilder.DeleteById<Review>(request);

            return EmptyResponse.Instance;
        }
    }
}
