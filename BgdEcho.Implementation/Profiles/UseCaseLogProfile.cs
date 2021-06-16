using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.Profiles
{
    public class UseCaseLogProfile : Profile
    {
        public UseCaseLogProfile()
        {
            CreateMap<UseCaseLog, UseCaseLogDto>().ReverseMap();
        }
    }
}
