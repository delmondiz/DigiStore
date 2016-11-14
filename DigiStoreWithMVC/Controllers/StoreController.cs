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
                User currentUser = ModelHelpers.GetCurrentUser(db);

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
                User currentUser = ModelHelpers.GetCurrentUser(db);

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
                User currentUser = ModelHelpers.GetCurrentUser(db);

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
                User currentUser = ModelHelpers.GetCurrentUser(db);
                if (ModelState.IsValid)
                {
                    // Add the item to our current user.
                    currentUser.Items.Add(item);
                    // Save the changes to the DB.
                    db.SaveChanges();
                    // Return the user to the Store Inventory
                    return View(currentUser);
                }
                return View(currentUser);
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
                return View();
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult PaymentWithCreditCard()
        {
            //create and item for which you are taking payment
            //if you need to add more items in the list
            //Then you will need to create multiple item objects or use some loop to instantiate object
            Item item = new Item();
            item.name = "CupCake";
            item.currency = "CAN";
            item.price = "5";
            item.quantity = "1";
            item.sku = "CK6549819";

            //Now make a List of Item and add the above item to it
            //you can create as many items as you want and add to this list
            List<Item> itms = new List<Item>();
            itms.Add(item);
            ItemList itemList = new ItemList();
            itemList.items = itms;

            //Address for the payment
            Address billingAddress = new Address();
            billingAddress.city = "Brampton";
            billingAddress.country_code = "CAN";
            billingAddress.line1 = "123 I Love Street";
            billingAddress.postal_code = "L4Z3R3";
            billingAddress.provence = "ON";


            //Now Create an object of credit card and add above details to it
            CreditCard crdtCard = new CreditCard();
            crdtCard.billing_address = billingAddress;
            crdtCard.cvv2 = "874";
            crdtCard.expire_month = 1;
            crdtCard.expire_year = 2020;
            crdtCard.first_name = "John";
            crdtCard.last_name = "Doe";
            crdtCard.number = "1234567890123456";
            crdtCard.type = "VISA";

            // Specify details of your payment amount.
            Details details = new Details();
            details.shipping = "1";
            details.subtotal = "5";
            details.tax = "1";

            // Specify your total payment amount and assign the details object
            Amount amnt = new Amount();
            amnt.currency = "CAN";
            // Total = shipping tax + subtotal.
            amnt.total = "7";
            amnt.details = details;

            // Now make a trasaction object and assign the Amount object
            Transaction tran = new Transaction();
            tran.amount = amnt;
            tran.description = "SEXY AS CUPCAKE.";
            tran.item_list = itemList;
            tran.invoice_number = "Generated Invoice #";

            // Now, we have to make a list of trasaction and add the trasactions object
            // to this list. You can create one or more object as per your requirements

            List<Transaction> transactions = new List<Transaction>();
            transactions.Add(tran);

            // Now we need to specify the FundingInstrument of the Payer
            // for credit card payments, set the CreditCard which we made above

            FundingInstrument fundInstrument = new FundingInstrument();
            fundInstrument.credit_card = crdtCard;

            // The Payment creation API requires a list of FundingIntrument

            List<FundingInstrument> fundingInstrumentList = new List<FundingInstrument>();
            fundingInstrumentList.Add(fundInstrument);

            // Now create Payer object and assign the fundinginstrument list to the object
            Payer payr = new Payer();
            payr.funding_instruments = fundingInstrumentList;
            payr.payment_method = "credit_card";

            // finally create the payment object and assign the payer object & transaction list to it
            Payment pymnt = new Payment();
            pymnt.intent = "sale";
            pymnt.payer = payr;
            pymnt.transactions = transactions;

            try
            {
                //getting context from the paypal, basically we are sending the clientID and clientSecret key in this function 
                //to the get the context from the paypal API to make the payment for which we have created the object above.

                //Code for the configuration class is provided next

                // Basically, apiContext has a accesstoken which is sent by the paypal to authenticate the payment to facilitator account. An access token could be an alphanumeric string

                APIContext apiContext = Configuration.GetAPIContext();

                // Create is a Payment class function which actually sends the payment details to the paypal API for the payment. The function is passed with the ApiContext which we received above.

                Payment createdPayment = pymnt.Create(apiContext);

                //if the createdPayment.State is "approved" it means the payment was successfull else not

                if (createdPayment.state.ToLower() != "approved")
                {
                    return View("FailureView");
                }
            }
            catch (PayPal.PayPalException ex)
            {
                Logger.Log("Error: " + ex.Message);
                return View("FailureView");
            }

            return View("SuccessView");
        }

        public ActionResult PaymentWithPaypal()
        {
            //getting the apiContext as earlier
            APIContext apiContext = Configuration.GetAPIContext();

            try
            {
                string payerId = Request.Params["PayerID"];

                if (string.IsNullOrEmpty(payerId))
                {
                    //this section will be executed first because PayerID doesn't exist

                    //it is returned by the create function call of the payment class

                    // Creating a payment

                    // baseURL is the url on which paypal sendsback the data.

                    // So we have provided URL of this controller only

                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Paypal/PaymentWithPayPal?";

                    //guid we are generating for storing the paymentID received in session

                    //after calling the create function and it is used in the payment execution

                    var guid = Convert.ToString((new Random()).Next(100000));

                    //CreatePayment function gives us the payment approval url

                    //on which payer is redirected for paypal acccount payment

                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);

                    //get links returned from paypal in response to Create function call

                    var links = createdPayment.links.GetEnumerator();

                    string paypalRedirectUrl = null;

                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;

                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment
                            paypalRedirectUrl = lnk.href;
                        }
                    }

                    // saving the paymentID in the key guid
                    Session.Add(guid, createdPayment.id);

                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    // This section is executed when we have received all the payments parameters

                    // from the previous call to the function Create

                    // Executing a payment

                    var guid = Request.Params["guid"];

                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);

                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("FailureView");
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.Log("Error" + ex.Message);
                ModelState.AddModelError("", "adfdghdghgdhgdhdgda");
                return View("FailureView");
            }

            return View("SuccessView");
        }

        private PayPal.Api.Payment payment;

        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution() { payer_id = payerId };
            this.payment = new Payment() { id = paymentId };
            return this.payment.Execute(apiContext, paymentExecution);
        }

        private Payment CreatePayment(APIContext apiContext, string redirectUrl)    
        {

            //similar to credit card create itemlist and add item objects to it
            var itemList = new ItemList() { items = new List<Item>() };

            itemList.items.Add(new Item()
            {
                name = "CupCake",
                currency = "CAN",
                price = "5",
                quantity = "1",
                sku = "CK6549819"
            });

            var payer = new Payer() { payment_method = "paypal" };

            // Configure Redirect Urls here with RedirectUrls object
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };

            // similar as we did for credit card, do here and create details object
            var details = new Details()
            {
                tax = "1",
                shipping = "1",
                subtotal = "5"
            };

            // similar as we did for credit card, do here and create amount object
            var amount = new Amount()
            {
                currency = "CAN",
                total = "7", // Total must be equal to sum of shipping, tax and subtotal.
                details = details
            };

            var transactionList = new List<Transaction>();

            transactionList.Add(new Transaction()
            {
                description = "Transaction description.",
                invoice_number = "your invoice number",
                amount = amount,
                item_list = itemList
            });

            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            // Create a payment using a APIContext
            return this.payment.Create(apiContext);

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
            return View();
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

            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                db.Dispose();

            base.Dispose(disposing);
        }

        public ActionResult SendFeedback()
        {
            return View();
        }
    }
}
