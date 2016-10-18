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

        public ActionResult Index(string storeName)
        {
            if (storeName != null)
            {
                using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
                {
                    User checkUser = (from u in db.Users where u.UserName == storeName select u).FirstOrDefault();

                    if (checkUser != null)
                        return View(checkUser);
                    else
                        return View();
                }
            }
            else if (User.Identity.IsAuthenticated)
            {
                using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
                {
                    User currentUser = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();

                    if (currentUser != null)
                        return View(currentUser);
                    else
                        return View();    
                }
            }
            else
                return View();
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
                    return RedirectToAction("Index", "Home");
            }
            else
                return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StoreInventory(Item item)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (ModelState.IsValid)
                {
                    // Get our current user.
                    User user = (from u in db.Users where u.Email == User.Identity.Name select u).FirstOrDefault();
                    // Add the item to our current user.
                    user.Items.Add(item);
                    // Save the changes to the DB.
                    db.SaveChanges();
                    // Return the user to the Store Inventory
                    return View(user);
                }
                return View(item);
            }
            else
                return RedirectToAction("Index", "Home");
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
                    return View("StoreInventory", user);
                }
                return View("StoreInventory", user);
            }
            else
                return RedirectToAction("Index", "Home");
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
                return View("StoreInventory", user);
            }
            else
                return RedirectToAction("Index", "Home");
        }

        public ActionResult ShoppingCart()
        {
            if (User.Identity.IsAuthenticated)
                return View();
            else
                return RedirectToAction("Index", "Home");
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
