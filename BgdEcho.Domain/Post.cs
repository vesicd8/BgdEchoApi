using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Domain
{
    public class Post : Entity
    {
        public string Header { get; set; }
        public string Text { get; set; }
        public string CoverImageSource { get; set; }
        public DateTime Date { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>(); 
        public virtual ICollection<Picture> Pictures { get; set; } = new HashSet<Picture>(); 
        public virtual ICollection<Review> Reviews { get; set; } = new HashSet<Review>();
    }
}
