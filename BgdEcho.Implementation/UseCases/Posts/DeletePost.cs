using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Posts
{
    public class DeletePost : EFGenericSoftDelete<Post>
    {
        public DeletePost(QueryBuilder queryBuilder) : base(queryBuilder)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 9;

        public override string Name => "Delete Post";
    }
}
