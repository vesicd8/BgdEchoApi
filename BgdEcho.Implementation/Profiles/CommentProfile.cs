using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using System.Collections.Generic;

namespace BgdEcho.Implementation.Profiles
{
    public class CommentProfile : Profile
    {
        public CommentProfile()
        {
            CreateMap<Comment, CommentDto>()
                .ForMember(x => x.Username, x => x.MapFrom(entity => entity.User.Username))
                .ForMember(x => x.Date, x => x.MapFrom(entity => entity.CreatedAt));

            CreateMap<CommentDto, Comment>();

            CreateMap<IEnumerable<Comment>, IEnumerable<CommentDto>>();
        }
    }
}
