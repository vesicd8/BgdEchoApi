using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.Profiles
{
    public class PictureProfile : Profile
    {
        public PictureProfile()
        {
            CreateMap<Picture, PictureDto>();

            CreateMap<PictureDto, Picture>();
        }
    }
}
