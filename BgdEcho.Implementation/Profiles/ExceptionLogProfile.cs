using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.Profiles
{
    public class ExceptionLogProfile : Profile
    {
        public ExceptionLogProfile()
        {
            CreateMap<ExceptionLog, ExceptionLogDto>();
        }
    }
}
