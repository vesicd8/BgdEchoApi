using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Pictures;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Pictures
{
    public class AddPicture : EFGenericInsert<Picture, PictureDto>, IAddPictureUseCase
    {
        public AddPicture(QueryBuilder queryBuilder, IMapper mapper, PictureValidator validator) : base(mapper, queryBuilder, validator)
        {
        }
        public override bool ShouldBeLogged => true;

        public override int Id => 11;

        public override string Name => "Add Picture";
    }
}
