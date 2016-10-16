using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace DigiStoreWithMVC.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class DigistoreApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<DigistoreApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class DigistoreApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DigistoreApplicationDbContext() : base("DefaultConnection", throwIfV1Schema: false)
        {
            DigiStoreDBModelContainer dbDigistore = new DigiStoreDBModelContainer();
        }

        public static DigistoreApplicationDbContext Create()
        {
            return new DigistoreApplicationDbContext();
        }
    }
}