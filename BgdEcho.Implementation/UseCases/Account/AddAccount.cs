using AutoMapper;
using BgdEcho.Application.DataTransfer;
using BgdEcho.Application.UseCases.Account;
using BgdEcho.Domain;
using BgdEcho.Implementation.Validators;

namespace BgdEcho.Implementation.UseCases.Account
{
    public class AddAccount : EFGenericInsert<User, UserDto>, IAddAccountUseCase
    {
        public AddAccount(QueryBuilder queryBuilder, IMapper mapper, AddUserValidator validator) : base(mapper, queryBuilder, validator)
        {
        }

        public override bool ShouldBeLogged => true;

        public override int Id => 13;

        public override string Name => "Register New User";
    }
}
