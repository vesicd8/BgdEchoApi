using AutoMapper;
using BgdEcho.Application;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();
        }
    }
}
