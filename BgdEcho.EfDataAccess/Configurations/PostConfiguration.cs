using BgdEcho.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace BgdEcho.EfDataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.Property(x => x.CategoryId).IsRequired();
            builder.Property(x => x.CoverImageSource).IsRequired();
            builder.Property(x => x.Header).IsRequired().HasMaxLength(150);
            builder.Property(x => x.Text).IsRequired();

            builder
                .HasMany(x => x.Pictures)
                .WithOne(p => p.Post)
                .HasForeignKey(p => p.PostId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
