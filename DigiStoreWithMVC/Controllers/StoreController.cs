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
                User checkUser = ModelHelpers.GetUserByStorename(db, storeName);
                ModelHelpers.CreateUserStoreIfNotExisting(db, checkUser);

                if (checkUser != null)
                {
                    return View("Index", checkUser);
                }
                else
                    return View("Index");
            }
            else if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);

                if (currentUser != null)
                {
                    ModelHelpers.CreateUserStoreIfNotExisting(db, currentUser);

                    return View("Index", currentUser);
                }
                else
                    return View("Index");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        public ActionResult Index(Store store)
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);

                if (currentUser != null)
                    return View("Index", currentUser);
                else
                    return View("Index");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult SubmitReview()
        {
            return View("Index");
        }

        [HttpPost]
        public ActionResult SubmitReview(Review model)
        {
            if (ModelState.IsValid)
            {
                using (DigiStoreDBModelContainer db = new DigiStoreDBModelContainer())
                {
                    Review newReview = db.Reviews.Create();
                    newReview.Id = db.Reviews.Count();
                    if (model.ReviewText != null)
                        newReview.ReviewText = model.ReviewText;
                    //if (model.ReviewRating != 0)
                    //newReview.Rating = model.ReviewRating;
                    newReview.Rating = 5;
                    newReview.Date = DateTime.Now;
                    db.Reviews.Add(newReview);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Store");
                }


            }
            else
            {
                return RedirectToAction("Index", "Store");
            }
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
                              where (u.Id == randUserNum && u.Items.Count > 0 && u.Email != User.Identity.Name)
                              select u).FirstOrDefault();
                if (randomUser != null)
                    ModelHelpers.CreateUserStoreIfNotExisting(db, randomUser);
                if (count > 1000)
                    randomUser = new User();
                count++;
                randUserNum = rand.Next(0, (max - 1));
            } while (randomUser == null);

            // This won't be reached any time soon.
            if (count > 1000)
                return RedirectToActionPermanent("Index", "Home", new { controller = "Home", action = "Index" });

            return RedirectToAction("Index", "Store", new { storeName = randomUser.Store.Name });
        }

        public ActionResult StoreInventory()
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);

                if (currentUser != null)
                    return View("StoreInventory", currentUser);
                else
                    return RedirectToAction("Login", "Account");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StoreInventory(Item item, HttpPostedFileBase picture)
        {
            if (User.Identity.IsAuthenticated)
            {
                // Get our current user.
                User currentUser = ModelHelpers.GetCurrentUser(db);
                if (picture != null && picture.ContentLength > 0)
                {   
                    string path = Server.MapPath("~/img/sub/pic" + db.Items.Last().Id + "." + picture.FileName.Split('.').Last());
                    string modelPath = "/KTDigistore/img/sub/pic" + db.Items.Last().Id + "." + picture.FileName.Split('.').Last();
                    picture.SaveAs(path);
                    item.ImagePath = modelPath;
                    ModelState.SetModelValue("ImagePath", new ValueProviderResult(modelPath, modelPath, System.Globalization.CultureInfo.CurrentCulture));
                }
                else
                {
                    item.ImagePath = "";
                }
                ModelState.Remove("ImagePath");
                if (ModelState.IsValid)
                {
                    // Add the item to our current user.
                    currentUser.Items.Add(item);
                    // Save the changes to the DB.
                    db.SaveChanges();
                    // Return the user to the Store Inventory
                    return View("StoreInventory", currentUser);
                }
                return View("StoreInventory", currentUser);
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
                User currentUser = ModelHelpers.GetCurrentUser(db);
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
                User currentUser = ModelHelpers.GetCurrentUser(db);
                Item dbItem = ModelHelpers.GetItemById(db, item.Id);
                currentUser.Items.Remove(dbItem);
                db.SaveChanges();
                return RedirectToAction("StoreInventory", "Store");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult ShoppingCart()
        {
            if (User.Identity.IsAuthenticated)
                return View("ShoppingCart");
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
                return View("EditStoreInfo", model);
            }
            
            User currentUser = ModelHelpers.GetCurrentUser(db);
            if (currentUser != null)
            {
                if (model.Store.Name != null)
                    currentUser.Store.Name = model.Store.Name;

                if (model.Store.Address != null)
                    currentUser.Store.Address = model.Store.Address;

                if (model.Store.City != null)
                    currentUser.Store.City = model.Store.City;

                if (model.Store.StateProv != null)
                    currentUser.Store.StateProv = model.Store.StateProv;

                if (model.Store.PostalCode != null)
                    currentUser.Store.PostalCode = model.Store.PostalCode;

                if (model.Store.Country != null)
                    currentUser.Store.Country = model.Store.Country;

                if (model.Store.PhoneNumber != null)
                    currentUser.Store.PhoneNumber = model.Store.PhoneNumber;
                db.SaveChanges();
                TempData["storeInfoResultMessage"] = "Contact Info Successfully Updated!";
                return RedirectToAction("Index", "Store");

            }
            return View("EditStoreInfo");
        }


        //
        // POST: /Store/Index
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditStoreHours(FormCollection formResults)
        {
            User currentUser = ModelHelpers.GetCurrentUser(db);
            if (currentUser != null)
            {
                //StoreHours[] hours = new StoreHours[7];
                for (int i = 0; i < 7; i++)
                {
                    StoreHours hours = currentUser.Store.StoreHours.ElementAt(i);
                    string startTime = formResults.GetValues("StartTime").ElementAt(i).ToString();
                    string endTime = formResults.GetValues("EndTime").ElementAt(i).ToString();

                    int startHour = int.Parse(startTime.Split(':')[0]);
                    int startMinute = int.Parse(startTime.Split(':')[1].Split(' ')[0]);
                    hours.StartTime = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, startHour, startMinute, 0);

                    int endHour = int.Parse(endTime.Split(':')[0]);
                    int endMinute = int.Parse(endTime.Split(':')[1].Split(' ')[0]);
                    hours.EndTime = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, endHour, endMinute, 0);
                }
                db.SaveChanges();
                TempData["storeHoursResultMessage"] = "Hours successfully updated!";
                return RedirectToAction("Index", "Store");
            }

            return View("EditStoreHours");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                db.Dispose();

            base.Dispose(disposing);
        }

        public ActionResult SendFeedback()
        {
            return View("SendFeedback");
        }

        // On the view, the user will not see the add to cart button unless authenticated

        public ContentResult AddToCart(Item item)
        {
            // We double check anyways, because no sneaking around.
            if (!User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);
                currentUser.Cart.Items.Add(item);
                db.SaveChanges();
            }

            return Content("Good");
        }
    }
}
