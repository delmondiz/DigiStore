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

namespace DigiStoreWithMVC.Controllers
{
    public class StoreController : Controller
    {
        private DigiStoreDBModelContainer db = new DigiStoreDBModelContainer();

        public ActionResult Index(string storeName)
        {
            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {
                User checkUser = (from u in db.Users where u.UserName == storeName select u).FirstOrDefault();
                
                if (checkUser != null)
                {
                    return View(checkUser);
                }
            }
            return View();
        }

        public ActionResult StoreInventory()
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = (from u in db.Users
                                    where u.Email == User.Identity.Name
                                    select u).FirstOrDefault();

                if (currentUser != null)
                {
                    return View(currentUser);
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            else
                return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StoreInventory([Bind(Include = "Id")] Item item)
        {
            if (ModelState.IsValid)
            {
                db.Items.Add(item);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(item);
        }

        public ActionResult ShoppingCart()
        {
            if (User.Identity.IsAuthenticated)
            {
                return View();
            }
            else
                return RedirectToAction("Index", "Home");
        }

        //public ActionResult Browse(string userId)
        //{
        //    return Content("Coming soon! User ID: " + userId);
        //    //return View();
        //}

        //public async Task<ActionResult> S(string storeName)
        //{
        //    if (storeName != null)
        //    {
        //        if (storeName.ToLower().Equals("mystore"))
        //        {
        //            // Check if User is logged in
        //            // If loggedIn(), 

        //            return View("Index");

        //            // If !loggedIn(),

        //            // return View("Login()");
        //        }
        //        else
        //        {
        //            // Require that the user has already logged in via username/password or external login
        //            //if (!await account.SignInManager.HasBeenVerifiedAsync())
        //            //{
        //            //    return View("Home");
        //            //}
        //            //User user = new User();
        //            //var u = from user in 
        //            var user = from users in db.Users
        //                       where users.UserName == storeName
        //                       select users;
        //            if (user != null)
        //                return View("Index", user);

        //            //return View("Index");
        //            return Content("Hey: " + storeName + ".\n User Status: " + user.GetType());
        //        }
        //    }
        //    else
        //    {
        //        return new HttpStatusCodeResult(403);
        //    }
        //}

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
