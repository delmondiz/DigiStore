using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DigiStoreWithMVC.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Threading.Tasks;
using System.Net;
using System.Data.Entity;

namespace DigiStoreWithMVC.Controllers
{
    public class StoreController : Controller
    { 
        private DigiStoreDBModelContainer db = new DigiStoreDBModelContainer();
        string[] DAYS_OF_THE_WEEK = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
        public ActionResult Index(string storeName)
        {
            if (storeName != null)
            {
                User checkUser = (from u in db.Users where u.UserName == storeName select u).FirstOrDefault();
                
                if (checkUser != null)
                {
                    // A StoreService class will be created to handle the creation of a store 
                    // upon the user making an account.
                    if (checkUser.Store == null)
                    {
                        checkUser.Store = new Store();
                        checkUser.Store.Address = "";
                        checkUser.Store.City = "";
                        checkUser.Store.Country = "";
                        checkUser.Store.Name = checkUser.UserName;
                        checkUser.Store.PostalCode = "";
                        checkUser.Store.PhoneNumber = "";
                        checkUser.Store.StateProv = "";
                        db.SaveChanges();
                    }

                    if (checkUser.Store.StoreHours.Count == 0)
                    {
                        for (int i = checkUser.Store.StoreHours.Count; i < 7; i++)
                        {
                            StoreHours storeHours = new StoreHours();
                            storeHours.StoreId = checkUser.Store.Id;
                            storeHours.DayOfTheWeek = DAYS_OF_THE_WEEK[i];
                            storeHours.StartTime = new DateTime(2015, 1, 1, 1, 0, 0);
                            storeHours.EndTime = new DateTime(2015, 1, 1, 1, 0, 0);
                            checkUser.Store.StoreHours.Add(storeHours);
                            db.SaveChanges();
                        }
                    }

                    if (checkUser.Store.Name != null)
                    {

                        return View(checkUser);
                    }

                    else
                        return View(checkUser);
                }
                else
                    return View();
            }
            else if (User.Identity.IsAuthenticated)
            {
                User currentUser = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();

                if (currentUser != null)
                {
                    return View(currentUser);
                }
                else
                    return View();
            }
            else
                return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        public ActionResult Index(Store store)
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();
                

                if (currentUser != null)
                    return View(currentUser);
                else
                    return View();
            }
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult RandomStore()
        {
            int max = db.Users.Count();
            Random rand = new Random();
            int randUserNum = rand.Next(0, (max - 1));
            int count = 0;
            User randomUser = null;
            do
            {
                randomUser = (from u in db.Users
                              where (u.Id == randUserNum)
                              select u).FirstOrDefault();
                if (count > 1000)
                    randomUser = new User();
                count++;
            } while (randomUser == null);

            // This won't be reached any time soon.
            if (count > 1000)
                return RedirectToActionPermanent("Index", "Home", new { controller = "Home", action = "Index" });

            return RedirectToAction("Index", "Store", new { storeName = randomUser.UserName });
        }

        public ActionResult StoreInventory()
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = (from u in db.Users
                                    where u.Email == User.Identity.Name
                                    select u).FirstOrDefault();

                if (currentUser != null)
                    return View(currentUser);
                else
                    return RedirectToAction("Login", "Account");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StoreInventory([Bind(Include = "Id,Name,Description,Price,Weight,Quantity,ImagePath")]Item item)
        {
            if (User.Identity.IsAuthenticated)
            {
                // Get our current user.
                User user = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();
                if (ModelState.IsValid)
                {
                    // Add the item to our current user.
                    user.Items.Add(item);
                    // Save the changes to the DB.
                    db.SaveChanges();
                    // Return the user to the Store Inventory
                    return View(user);
                }
                return View(user);
            }
            else
                return RedirectToAction("Login", "Account");
        }



        // POST: Items/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateItem([Bind(Include = "Id,Name,Description,Price,Weight,Quantity,ImagePath")]Item item)
        {
            if (User.Identity.IsAuthenticated)
            {
                User user = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();
                if (ModelState.IsValid)
                {
                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("StoreInventory", "Store");
                }
                return RedirectToAction("StoreInventory", "Store");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        // POST: Items/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteItem([Bind(Include = "Id")]Item item)
        {
            if (User.Identity.IsAuthenticated)
            {
                User user = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();
                Item dbItem = (from i in db.Items where i.Id == item.Id select i).FirstOrDefault();
                user.Items.Remove(dbItem);
                db.SaveChanges();
                return RedirectToAction("StoreInventory", "Store");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult ShoppingCart()
        {
            if (User.Identity.IsAuthenticated)
                return View();
            else
                return RedirectToAction("Login", "Account");
        }

        //
        // POST: /Manage/ChangePayment
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditStoreInfo(User model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {

                User existingUser = (from u in db.Users
                                     where u.Email == User.Identity.Name
                                     select u).FirstOrDefault();
                if (existingUser != null)
                {
                    if (model.Store.Name != null)
                        existingUser.Store.Name = model.Store.Name;

                    if (model.Store.Address != null)
                        existingUser.Store.Address = model.Store.Address;

                    if (model.Store.City != null)
                        existingUser.Store.City = model.Store.City;

                    if (model.Store.StateProv != null)
                        existingUser.Store.StateProv = model.Store.StateProv;

                    if (model.Store.PostalCode != null)
                        existingUser.Store.PostalCode = model.Store.PostalCode;

                    if (model.Store.Country != null)
                        existingUser.Store.Country = model.Store.Country;

                    if (model.Store.PhoneNumber != null)
                        existingUser.Store.PhoneNumber = model.Store.PhoneNumber;

                    db.SaveChanges();
                    TempData["resultMessage"] = "Payment successfully updated!";
                    return RedirectToAction("Index", "Store");
                }
            }
            return View();
        }


        //
        // POST: /Store/Index
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditStoreHours(User user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }

            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {

                User existingUser = (from u in db.Users
                             where u.Email == User.Identity.Name
                             select u).FirstOrDefault();
                if (existingUser != null)
                {
                    for (int i = 0; i < 7; i++)
                    {
                        StoreHours hours = existingUser.Store.StoreHours.ElementAt(i);

                        hours.StartTime = user.Store.StoreHours.ElementAt(i).StartTime;
                        hours.EndTime = user.Store.StoreHours.ElementAt(i).EndTime;
                    }
                    db.SaveChanges();
                    TempData["resultMessage"] = "Payment successfully updated!";
                    return RedirectToAction("Index", "Store");
                }
            }
            return View();
        }

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //        db.Dispose();

        //    base.Dispose(disposing);
        //}

        public ActionResult SendFeedback()
        {
            return View();
        }
    }
}
