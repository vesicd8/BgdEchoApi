using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Posts;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Posts
{
    public class UpdatePost : EFGenericUpdate<Post, UpdatePostDto>, IUpdatePostUseCase
    {
        public UpdatePost(QueryBuilder queryBuilder, IMapper mapper, UpdatePostValidator validator) : base(queryBuilder, mapper, validator)
        {
        }

        public override bool ShouldBeLogged => true;
        public override int Id => 7;
        public override string Name => "Update Post";
    }
}
