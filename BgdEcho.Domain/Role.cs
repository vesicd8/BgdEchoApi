using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace BgdEcho.Domain
{
    public class Role : Entity
    {
        public string RoleName { get; set; }
        [NotMapped]
        public bool IsSuperAdminRole => UseCases.Any(x => x.UseCaseId == 1000);
        public virtual ICollection<User> Users { get; set; } = new HashSet<User>();
        public virtual ICollection<RoleUseCase> UseCases { get; set; } = new HashSet<RoleUseCase>();
    }
}
