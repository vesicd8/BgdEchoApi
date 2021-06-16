using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.Profiles
{
    public class ReviewProfile : Profile
    {
        public ReviewProfile()
        {
            CreateMap<Review, ReviewDto>().ReverseMap();
        }
    }
}
