using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DigiStoreWithMVC.Models;
using System.Net;

namespace DigiStoreWithMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(int? id)
        {
            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {
                if (id == null)
                {
                    return View();
                }

                User user = db.Users.Find(id);
                if (user == null)
                {
                    return HttpNotFound();
                }

                return View(user);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(User user)
        {
            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {
                return View(user);
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Map()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}