using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Order.Models
{
    public class AppDbContext : IdentityDbContext<IdentityUser>
    { public AppDbContext(DbContextOptions<AppDbContext> options) :
            base(options) { }
        public DbSet<Shop> Shops{ get; set;}
    public DbSet<Food> Foods{ get; set;}
    }
}
