using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using log4net;

public partial class _Default : System.Web.UI.Page
{

    protected string accessToken;
    protected string approvalUrl;
    protected string requestCsrf;
    protected string shippingFlowFlag;

    private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    protected void Page_Load(object sender, EventArgs e)
    {
        log4net.Config.XmlConfigurator.Configure();

        if (Session["csrf"] == null)
        {
            log.Info(
                "Session expired: force redirect back to Index."
            );

            Response.Redirect("Index.aspx");
        }

        accessToken = PayPalMethods.getAccessToken();
        Session["accessToken"] = accessToken;


        shippingFlowFlag = (Request.Form["shippingFlow"] != null) ? Request.Form["shippingFlow"].ToString() : "";

        requestCsrf = (Request.Form["csrf"] != null) ? Request.Form["csrf"].ToString() : "";


        if (requestCsrf == Session["csrf"].ToString())
        {

            // Proceed to Checkout flow
            if (shippingFlowFlag == "true")
            {
                // session jason string converted to ExpressCheckoutShippingPaymentData object
                PayPalObjects.ExpressCheckoutShippingPaymentData deserializedEcShipping = JsonConvert.DeserializeObject<PayPalObjects.ExpressCheckoutShippingPaymentData>(Session["expressCheckoutShippingPaymentData"].ToString());

                // update fields based on form selections
                deserializedEcShipping.transactions[0].amount.total = (
                    float.Parse(deserializedEcShipping.transactions[0].amount.total) +
                    float.Parse(Request.Form["shipping_method"]) -
                    float.Parse(deserializedEcShipping.transactions[0].amount.details.shipping)
                ).ToString();
                deserializedEcShipping.transactions[0].amount.details.shipping = Request.Form["shipping_method"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.recipient_name = Request.Form["recipient_name"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.line1 = Request.Form["line1"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.line2 = Request.Form["line2"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.city = Request.Form["city"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.country_code = Request.Form["country_code"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.postal_code = Request.Form["postal_code"].ToString();
                deserializedEcShipping.transactions[0].item_list.shipping_address.state = Request.Form["state"].ToString();
                
                // convert the modified Object back to JSON
                string expressCheckoutFlowPaymentDataJson = JsonConvert.SerializeObject(deserializedEcShipping, Formatting.Indented);
                Session["expressCheckoutFlowPaymentData"] = expressCheckoutFlowPaymentDataJson;

                approvalUrl = PayPalMethods.getApprovalUrl(accessToken, expressCheckoutFlowPaymentDataJson) + "&useraction=commit"; // "Pay Now" button label
                Session["approvalUrl"] = approvalUrl;
            }
            // Express checkout flow
            else {

                // session JSON string converted to ExpressCheckoutPaymentData object
                PayPalObjects.ExpressCheckoutPaymentData deserializedEc = JsonConvert.DeserializeObject<PayPalObjects.ExpressCheckoutPaymentData>(Session["expressCheckoutPaymentData"].ToString());
               
                deserializedEc.transactions[0].amount.total = (
                    float.Parse(Request.Form["camera_amount"]) +
                    float.Parse(Request.Form["estimated_shipping"]) +
                    float.Parse(Request.Form["tax"]) +
                    float.Parse(Request.Form["insurance"]) +
                    float.Parse(Request.Form["handling_fee"]) +
                    float.Parse(Request.Form["shipping_discount"])
                ).ToString();
                deserializedEc.transactions[0].amount.details.subtotal = Request.Form["camera_amount"].ToString();
                deserializedEc.transactions[0].item_list.items[0].price = Request.Form["camera_amount"].ToString();
                deserializedEc.transactions[0].item_list.items[0].currency = Request.Form["currencyCodeType"].ToString();
                deserializedEc.transactions[0].amount.details.tax = Request.Form["tax"].ToString();
                deserializedEc.transactions[0].amount.details.insurance = Request.Form["insurance"].ToString();
                deserializedEc.transactions[0].amount.details.shipping = Request.Form["estimated_shipping"].ToString();
                deserializedEc.transactions[0].amount.details.handling_fee = Request.Form["handling_fee"].ToString();
                deserializedEc.transactions[0].amount.details.shipping_discount = Request.Form["shipping_discount"].ToString();
                deserializedEc.transactions[0].amount.currency = Request.Form["currencyCodeType"].ToString();

                // convert the modified Object back to JSON
                string expressCheckoutPaymentDataJson = JsonConvert.SerializeObject(deserializedEc, Formatting.Indented);
                Session["expressCheckoutPaymentData"] = expressCheckoutPaymentDataJson;

                approvalUrl = PayPalMethods.getApprovalUrl(accessToken, expressCheckoutPaymentDataJson); // "Continue" button label
                Session["approvalUrl"] = approvalUrl;
            }

            Response.Redirect(approvalUrl, true);
        }

        // tampered data, return to home page
        log.Info(
            "Csrf Token failed validation: forced redirect back to Index."
        );

        Response.Redirect("Index.aspx", true);
    }

}