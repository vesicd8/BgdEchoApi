using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Reviews;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Reviews
{
    public class AddReview : EFGenericInsert<Review, ReviewDto>, IAddReviewUseCase
    {
        public AddReview(QueryBuilder queryBuilder, IMapper mapper, AddReviewValidator validator) : base(mapper, queryBuilder, validator)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 21;

        public override string Name => "Add Review";
    }
}
