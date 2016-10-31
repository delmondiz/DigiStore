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
        private DigiStoreDBModelContainer db = new DigiStoreDBModelContainer();

        public ActionResult Index()
        {
            User currentUser = ModelHelpers.GetCurrentUser(db);

            if (currentUser == null)
            {
                return View();
            }

            return View(currentUser);
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
                Review newReview = db.Reviews.Create();
                newReview.Id = db.Reviews.Count();
                if (model.ReviewText != null)
                    newReview.ReviewText = model.ReviewText;
                if (model.ReviewRating != 0)
                    newReview.Rating = model.ReviewRating;
                newReview.Date = DateTime.Now;
                db.Reviews.Add(newReview);
                db.SaveChanges();
                ViewBag.Message = "Thanks!";
                return View();
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

        [HttpPost]
        public ActionResult Map(string inputSearch)
        {
            List<User> users = (from u in db.Users
                                where u.UserName.ToLower().Contains(inputSearch.ToLower())
                                select u).ToList();
            if (users != null)
            {
                ViewData["users"] = users;
            }

            return PartialView("_MapResults");
        }

        [HttpPost]
        public ActionResult GoogleSearch(string searchQuery)
        {
            List<Store> stores = (from s in db.Stores
                                  where s.Name.ToLower().Contains(searchQuery.ToLower())
                                  select s).ToList();

            return PartialView("_GoogleResults", stores);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                db.Dispose();

            base.Dispose(disposing);
        }
    }
}