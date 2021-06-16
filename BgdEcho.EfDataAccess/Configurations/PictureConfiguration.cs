using BgdEcho.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace BgdEcho.EfDataAccess.Configurations
{
    public class PictureConfiguration : IEntityTypeConfiguration<Picture>
    {
        public void Configure(EntityTypeBuilder<Picture> builder)
        {
            builder.Property(x => x.PictureSource).IsRequired();
            builder.Property(x => x.PictureAlt).IsRequired();
            builder.Property(x => x.PostId).IsRequired();
        }
    }
}
