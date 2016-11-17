using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigiStoreWithMVC.Models
{
    public class DigistoreApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public interface IDigistoreApplicationDbContext
        {

        }

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