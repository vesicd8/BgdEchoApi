using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Posts
{
    public class FindPost : EFGenericFind<Post, PostDto>
    {
        public FindPost(QueryBuilder queryBuilder, IMapper mapper) : base(queryBuilder, mapper)
        {
        }

        public override bool ShouldBeLogged => false;
        public override int Id => 10;
        public override string Name => "Find Post";
    }
}
