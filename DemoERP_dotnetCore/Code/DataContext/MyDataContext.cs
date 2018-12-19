using DataContext.Cache;
using Microsoft.EntityFrameworkCore;
using Model.Taskwake;
using Model.User;

namespace DataContext
{
    public class MyDataContext : DbContext
    {
        public MyDataContext(DbContextOptions<MyDataContext> options) :base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Myuser>().ToTable("Myuser");
            //modelBuilder.Entity<Enrollment>().ToTable("Enrollment");
            //modelBuilder.Entity<Student>().ToTable("Student");
        }

        public DbSet<Myuser> Myusers { get; set; }

        public DbSet<MyTaskwake> MyTaskwake { get; set; }
    }
}
