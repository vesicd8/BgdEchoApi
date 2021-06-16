using BgdEcho.Domain;
using BgdEcho.EfDataAccess.Extensions;
using Microsoft.EntityFrameworkCore;
using System;

namespace BgdEcho.EfDataAccess
{
    public class Context : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(GetType().Assembly);
            modelBuilder.Entity<RoleUseCase>().HasKey(x => new { x.RoleId, x.UseCaseId });
            modelBuilder.ApplyGlobalFilters<Entity>(x => x.DeletedAt == null);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder
                .UseSqlServer(@"Data Source=DESKTOP-E7L6914\SQLEXPRESS;Initial Catalog=BgdEcho;Integrated Security=True")
                .UseLazyLoadingProxies();
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Added:
                            e.CreatedAt = DateTime.UtcNow;
                            e.IsActive = true;
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Picture> Pictures { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<ExceptionLog> ExceptionLogs { get; set; }
    }
}
