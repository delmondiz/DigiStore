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
        internal static User GetUserByStorename(DigiStoreDBModelContainer db, string storeName)
        {
            int storeId = (from s in db.Stores where s.Name.ToLower() == storeName.ToLower() select s.Id).FirstOrDefault();
            User checkUser = (from u in db.Users where u.Store.Id == storeId select u).FirstOrDefault();

            return checkUser;
        }

        internal static Item GetItemById(DigiStoreDBModelContainer db, int id)
        {
            Item item = (from i in db.Items where i.Id == id select i).FirstOrDefault();

            return item;
        }

        internal static User GetUserByEmail(DigiStoreDBModelContainer db, string email)
        {
            User currentUser = (from u in db.Users
                                where u.Email.ToLower() == email.ToLower()
                                select u).FirstOrDefault();

            return currentUser;
        }

        internal static void CreateUserPaymentMethodIfNotExisting(DigiStoreDBModelContainer db, User user)
        {
            User currentUser = ModelHelpers.GetCurrentUser(db);
            if (currentUser != null)
            {
                PaymentMethod payment = currentUser.PaymentMethods.FirstOrDefault();
                if (payment == null)
                    payment = db.PaymentMethods.Create();
                db.SaveChanges();
            }
        }

        internal static void CreateUserStoreIfNotExisting(DigiStoreDBModelContainer db, User user)
        {
            string[] DAYS_OF_THE_WEEK = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
            // If the user is not null, we continue
            if (user != null)
            {
                // If the user's store does not exist, we create it.
                if (user.Store == null)
                {
                    user.Store = new Store();
                    user.Store.Address = "";
                    user.Store.City = "";
                    user.Store.Country = "";
                    user.Store.Name = user.UserName;
                    user.Store.PostalCode = "";
                    user.Store.PhoneNumber = "";
                    user.Store.StateProv = "";
                }

                // If the user's store doesn't have hours, we add them now.
                // This is seperate for existing stores that don't have hours as of yet to receive store hours.
                if (user.Store.StoreHours.Count == 0)
                {
                    for (int i = user.Store.StoreHours.Count; i < 7; i++)
                    {
                        StoreHours storeHours = new StoreHours();
                        storeHours.StoreId = user.Store.Id;
                        storeHours.DayOfTheWeek = DAYS_OF_THE_WEEK[i];
                        storeHours.StartTime = new DateTime(2015, 1, 1, 1, 0, 0);
                        storeHours.EndTime = new DateTime(2015, 1, 1, 1, 0, 0);
                        user.Store.StoreHours.Add(storeHours);
                    }
                }
                db.SaveChanges();
            }
        }
    }
}