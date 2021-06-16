using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Account;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Account
{
    public class UpdateAccount : EFGenericUpdate<User, UserDto>, IUpdateAccountUseCase
    {
        public UpdateAccount(QueryBuilder queryBuilder, IMapper mapper, UpdateUserValidator validator) : base(queryBuilder, mapper, validator)
        {
        }

        public override bool ShouldBeLogged => true;
        public override int Id => 14;
        public override string Name => "Update User";
    }
}
