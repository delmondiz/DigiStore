using DigiStoreWithMVC.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DigiStoreWithMVC.Controllers
{
    public class PaypalController : Controller
    {
        //
        // GET: /Paypal/
        private DigiStoreDBModelContainer db = new DigiStoreDBModelContainer();
        public ActionResult Index()
        {
            return View();
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

                    //string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Paypal/PaymentWithPayPal?";
                    string baseURI = "http://kt.digilife.me/Paypal/PaymentWithPayPal?";

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
                        Session["cartError"] = "Your Payment Cannot be Processed. Please Try Again";
                        return RedirectToAction("Cart", "Store");
                    }

                }
            }
            catch (Exception ex)
            {
                Session["cartError"] = "Your Payment Cannot be Processed. Please Try Again";
                Logger.Log("Error" + ex.Message);
                return RedirectToAction("Cart", "Store");
            }

            // If we reach here, the payment was successful.
            // Creating a Order for the User
            User currentUser = ModelHelpers.GetCurrentUser(db);
            Models.Order order = new Models.Order();
            order.Id = db.Orders.Count() + 8;
            order.Tax = 0;
            order.TotalPrice = 0;
            foreach (nItem item in (List<nItem>)Session["cart"])
            {
                item.Ite.Quantity = item.Quantity;
                order.Items.Add(item.Ite);
                order.Tax += item.Ite.Price * item.Ite.Quantity * 0.13M;
                order.TotalPrice += item.Ite.Price * item.Ite.Quantity;
                // Modifying the current Items' Quantities
                db.Items.Where(i => i.Id == item.Ite.Id).First().Quantity -= item.Quantity;
            }
            order.TotalPrice += order.Tax;
            currentUser.Orders.Add(order);
            
            // Lest we forgetti, Save the Spaghetti
            db.SaveChanges();
            // Empty the current cart.
            Session["cart"] = new List<nItem>();

            return View("SuccessView", currentUser );
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
            var itemList = new ItemList() { items = new List<PayPal.Api.Item>() };
            List<PayPal.Api.Item> items = new List<PayPal.Api.Item>();

            decimal calculatetax = 0;
            decimal calculatesub = 0;
            decimal calculatetotal = 0;

            foreach (var cartitem in (List<nItem>)Session["cart"])
            {

                itemList.items.Add(new PayPal.Api.Item()
                {
                    name = cartitem.Ite.Name,
                    currency = "USD",
                    price = cartitem.Ite.Price.ToString(),
                    quantity = cartitem.Quantity.ToString(),
                    sku = cartitem.Ite.Id.ToString()

                });
                calculatetax += Convert.ToDecimal(cartitem.Ite.Price * cartitem.Quantity * (decimal)0.13);
                calculatesub += Convert.ToDecimal(cartitem.Ite.Price * cartitem.Quantity);
            }

            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = "0"
            };
            calculatetotal = calculatetax + calculatesub;
            details.tax = calculatetax.ToString();
            details.subtotal = calculatesub.ToString();

            var amount = new Amount()
            {
                currency = "USD",
                total = "0", // Total must be equal to sum of shipping, tax and subtotal.
                details = details
            };
            amount.total = calculatetotal.ToString();


            var payer = new Payer() { payment_method = "paypal" };

            // Configure Redirect Urls here with RedirectUrls object
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };

            var transactionList = new List<Transaction>();

            transactionList.Add(new Transaction()
            {
                description = "DigiStore Purchase",
                invoice_number = (db.Orders.Count() + 8).ToString(),
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
    }
}
