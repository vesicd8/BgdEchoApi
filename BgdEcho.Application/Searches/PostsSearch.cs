using System;

namespace BgdEcho.Application.Searches
{
    public class PostsSearch : BaseSearch
    {
        public DateTime? Date { get; set; }
        public int? Category { get; set; }
        public OrderByDirections OrderByDirection { get; set; } = OrderByDirections.ASC;
    }
}
