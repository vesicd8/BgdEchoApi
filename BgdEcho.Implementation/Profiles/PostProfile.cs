using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Domain;
using System.Linq;

namespace BgdEcho.Implementation.Profiles
{
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Post, PostDto>()
                 .ForMember(x => x.Category, x => x.MapFrom(b => b.Category.CategoryName))
                 .ForMember(x => x.Rating, x => x.MapFrom(r => r.Reviews.Average(x => x.Rate)))
                 .ForMember(x => x.NumberOfComments, x => x.MapFrom(r => r.Comments.Count));

            CreateMap<PostDto, Post>();

            CreateMap<UpdatePostDto, Post>();
        }
    }
}
