namespace BgdEcho.Application.Searches
{
    public class BaseSearch
    {
        public bool Paged { get; set; }
        public string Keyword { get; set; }
        public int PerPage { get; set; } = 15;
        public int CurrentPage { get; set; } = 1;
    }
}
