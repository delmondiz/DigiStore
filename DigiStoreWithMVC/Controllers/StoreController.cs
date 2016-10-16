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

        // GET: Store
        public ActionResult Index()
        {
            return View();       
        }

        //public ActionResult StorePage()
        //{
        //    return View();
        //}

        public ActionResult StoreInventory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View();
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
            return View();
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
