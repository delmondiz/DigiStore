using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DigiStoreWithMVC.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        public ActionResult Index()
        {
            return View();       
        }

        public ActionResult StorePage()
        {
            return View();
        }

        public ActionResult StoreInventory()
        {
            return View();
        }

        public ActionResult ShoppingCart()
        {
            return View();
        }

        public ActionResult Browse(string userId)
        {
            return Content("Coming soon! User ID: " + userId);
            //return View();
        }

        public ActionResult S(string storeName)
        {
            if (storeName != null)
            {
                if (storeName.ToLower().Equals("mystore"))
                { 
                    // Check if User is logged in
                    // If loggedIn(), 
                    return View("Index");
                    // If !loggedIn(),
                    // return Login();
                }
                else
                {
                    return Content("Hey: " + storeName);
                }
            }
            else
            {
                return new HttpStatusCodeResult(403);
            }
        }

    }
}
