using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using System.Linq;

namespace BgdEcho.Implementation.Profiles
{
    public class RoleProfile : Profile
    {
        public RoleProfile()
        {
            CreateMap<Role, RoleDto>().ForMember(x => x.UseCases, x => x.MapFrom(r => r.UseCases.Select(x => x.UseCaseId)));
            CreateMap<RoleDto, Role>().ForMember(x => x.UseCases, x => x.MapFrom(r => r.UseCases.Select(x => new RoleUseCase { UseCaseId = x })));

        }
    }
}
