using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Posts;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Posts
{
    public class AddPost : EFGenericInsert<Post, PostDto>, IAddPostUseCase
    {
        public AddPost(IMapper mapper, InsertPostValidator validator, QueryBuilder queryBuilder) : base(mapper, queryBuilder, validator)
        {
        }
        public override bool ShouldBeLogged => true;

        public override int Id => 6;

        public override string Name => "Add Post";
    }
}
