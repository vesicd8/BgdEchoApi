using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Domain
{
    public class Picture : Entity
    {
        public string PictureSource { get; set; }
        public string PictureAlt { get; set; }
        public int PostId { get; set; }
        public virtual Post Post { get; set; }
    }
}
