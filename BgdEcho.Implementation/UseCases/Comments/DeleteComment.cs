using BgdEcho.Application.Exceptions;
using BgdEcho.Application.UseCases;
using BgdEcho.Application.UseCases.Comments;
using BgdEcho.Domain;
using System;
using System.Linq;

namespace BgdEcho.Implementation.UseCases.Comments
{
    public class DeleteComment : IUseCaseOperation<int, EmptyResponse>, IDeleteCommentUseCase
    {
        private readonly QueryBuilder _queryBuilder;

        public DeleteComment(QueryBuilder queryBuilder)
        {
            _queryBuilder = queryBuilder;
        }

        public bool ShouldBeLogged => true;

        public int Id => 18;

        public string Name => "Delete Comment";

        public EmptyResponse Execute(int request)
        {
            var query = _queryBuilder.BuildQuery<Comment>().Where(x => x.Id == request);
            var actor = _queryBuilder.Actor;

            if (!actor.IsSuperAdmin && !actor.IsModerator)
            {
                query = query.Where(x => x.UserId == actor.Id);
            }

            var item = query.FirstOrDefault();

            if(item == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }

            item.DeletedAt = DateTime.Now;
            _queryBuilder.Commit();

            return EmptyResponse.Instance;
        }
    }
}
