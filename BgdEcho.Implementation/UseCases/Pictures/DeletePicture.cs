using BgdEcho.Application.UseCases.Pictures;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Pictures
{
    public class DeletePicture : EFGenericSoftDelete<Picture>, IDeletePictureUseCase
    {
        public DeletePicture(QueryBuilder queryBuilder) : base(queryBuilder)
        {
        }
        public override bool ShouldBeLogged => true;

        public override int Id => 12;

        public override string Name => "Delete Picture";
    }
}
