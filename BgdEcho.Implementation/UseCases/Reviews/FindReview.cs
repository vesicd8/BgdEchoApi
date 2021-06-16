using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Reviews;
using BgdEcho.Domain;

namespace BgdEcho.Implementation.UseCases.Reviews
{
    public class FindReview : EFGenericFind<Review, ReviewDto>, IFindReviewUseCase
    {
        public FindReview(IMapper mapper, QueryBuilder queryBuilder) : base(queryBuilder, mapper)
        {
        }

        public override bool ShouldBeLogged => false;

        public override int Id => 23;

        public override string Name => "Find Review";
    }
}
