using DigiStoreWithMVC.Models;
using System.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace DigiStoreWithMVC.Controllers
{
    public class ModelHelpers
    {

        /// <summary>
        /// Returns the currently logged in User, or null.
        /// </summary>
        /// <param name="db">The DBModelContainer to be used to retrieve the user.</param>
        /// <returns>A DigistoreWithMVC.Models.User or null </returns>
        internal static User GetCurrentUser(DigiStoreDBModelContainer db)
        {
            User currentUser = (from u in db.Users
                                where u.Email.ToLower() == HttpContext.Current.User.Identity.Name.ToLower()
                                select u).FirstOrDefault();

            return currentUser;
        }

        /// <summary>
        /// Returns a User, or null, chosen through the store name.
        /// </summary>
        /// <param name="db">The DBModelContainer to be used to retrieve the user.</param>
        /// <param name="storeName">The name of the store.</param>
        /// <returns>A DigistoreWithMVC.Models.User or null </returns>
        public static User GetUserByStorename(DigiStoreDBModelContainer db, string storeName)
        {
            int storeId = (from s in db.Stores where s.Name.ToLower() == storeName.ToLower() select s.Id).FirstOrDefault();
            User checkUser = (from u in db.Users where u.Store.Id == storeId select u).FirstOrDefault();

            return checkUser;
        }

        public static Item GetItemById(DigiStoreDBModelContainer db, int id)
        {
            Item item = (from i in db.Items where i.Id == id select i).FirstOrDefault();

            return item;
        }

        public static User GetUserByEmail(DigiStoreDBModelContainer db, string email)
        {
            User currentUser = (from u in db.Users
                                where u.Email.ToLower() == email.ToLower()
                                select u).FirstOrDefault();

            return currentUser;
        }
    }
}