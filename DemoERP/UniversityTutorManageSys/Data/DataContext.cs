using Microsoft.EntityFrameworkCore;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) :base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Myuser>().ToTable("Myuser");
            //modelBuilder.Entity<Enrollment>().ToTable("Enrollment");
            //modelBuilder.Entity<Student>().ToTable("Student");
        }

        public DbSet<Myuser> Myusers { get; set; }

        public DbSet<UniversityTutorManageSys.Models.MyTaskwake> MyTaskwake { get; set; }
    }
}
