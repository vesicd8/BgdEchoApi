using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Reviews;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Reviews
{
    public class UpdateReview : EFGenericUpdate<Review, ReviewDto>, IUpdateReviewUseCase
    {
        public UpdateReview(QueryBuilder queryBuilder, IMapper mapper, UpdateReviewValidator validator) : base(queryBuilder, mapper, validator)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 22;

        public override string Name => "Update Review";
    }
}
