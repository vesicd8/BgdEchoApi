using System.Collections.Generic;

namespace BgdEcho.Application.DataTransfer
{
    public class RoleDto : Dto
    {
        public string RoleName { get; set; }
        public virtual IEnumerable<int> UseCases { get; set; } = new List<int>();
    }
}
