using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DigiStoreWithMVC.Models;
using System.Data.Entity;
using System.Net;

namespace DigiStoreWithMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
            {
                User user = (from u in db.Users
                             where u.Email == User.Identity.Name
                             select u).FirstOrDefault();

                if (user == null)
                {
                    return View();
                }

                return View(user);
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Index(User user)
        //{
        //    using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
        //    {
        //        return View(user);
        //    }
        //}

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Contact(HomeViewModels model)
        {
            if (ModelState.IsValid)
            {
                using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
                {
                    Review newReview = db.Reviews.Create();
                    newReview.Id = db.Reviews.Count();
                    if(model.ReviewText != null)
                        newReview.ReviewText = model.ReviewText;
                    newReview.Rating = 1;
                    newReview.Date = DateTime.Now;
                    db.Reviews.Add(newReview);
                    db.SaveChanges();
                    ViewBag.Message = "Thanks!";
                    return View();
                }
            }
            else
            {
                return View(model);
            }
        }
        public ActionResult Map()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}