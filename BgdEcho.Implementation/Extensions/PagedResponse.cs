using System;
using System.Collections.Generic;

namespace BgdEcho.Implementation.Extensions
{
    public class PagedResponse<T> where T : class
    {
        public int Total { get; set; }
        public int Current { get; set; }
        public int PerPage { get; set; }
        public int PagesCount => (int) Math.Ceiling((float) Total / PerPage);
        public IEnumerable<T> Items { get; set; }
    }
}
