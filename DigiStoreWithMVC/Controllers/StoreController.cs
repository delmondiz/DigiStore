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

    }
}
