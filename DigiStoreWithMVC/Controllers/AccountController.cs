using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using DigiStoreWithMVC.Models;
using System.Data.Entity;
using System.Net;

namespace DigiStoreWithMVC.Controllers
{
    // When there's internet, Check Me
    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private DigiStoreDBModelContainer db = new DigiStoreDBModelContainer();

        //
        // GET: /Account/Index
        public ActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);

                // Failsafes are always good.
                if (currentUser != null)
                    return View("Index", currentUser);
                else
                    return RedirectToAction("Login", "Account");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        //
        // POST: /Account/Index
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(UserDetailsViewModel model)
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);
                if (ModelState.IsValid)
                {
                    if (currentUser != null)
                    {
                        if (model.FirstName != null)
                            currentUser.FirstName = model.FirstName;
                        if (model.LastName != null)
                            currentUser.LastName = model.LastName;
                        if (model.Address != null)
                            currentUser.Address = model.Address;
                        if (model.City != null)
                            currentUser.City = model.City;
                        if (model.StateProv != null)
                            currentUser.StateProv = model.StateProv;
                        if (model.PostalCode != null)
                            currentUser.PostalCode = model.PostalCode;
                        if (model.Country != null)
                            currentUser.Country = model.Country;
                        if (model.PhoneNumber != null)
                            currentUser.PhoneNumber = model.PhoneNumber;
                        db.SaveChanges();
                        TempData["resultMessage"] = "General Information successfully updated!";
                        return View("Index", currentUser);
                    }
                }
                else
                {
                    return View("Index", currentUser);
                }
                return RedirectToAction("Login", "Account");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // Check if the user exists in the database.
            User currentUser = ModelHelpers.GetUserByEmail(db, model.Email);

            PasswordHasher hash = new PasswordHasher();
            // If the user does exist, we check that the password is correct.
            if (currentUser != null)
            {
                // If the password is not correct, we return them to the login page.
                if (hash.VerifyHashedPassword(currentUser.Password, model.Password) == PasswordVerificationResult.Failed)
                {
                    ModelState.AddModelError("", "Invalid Username/Password.");
                    return View("Login", model);
                }
            }
            else
            {
                ModelState.AddModelError("", "Invalid Username/Password.");
                return View(model);
            }

            // If we reach here, the user is able to log in.
            // TODO: Users that login and do not have a store will have a store created for them. Remove this later.
            // All users that register from this point on will have a Store created for them upon registeration.
            // This is for legacy accounts.
            ModelHelpers.CreateUserStoreIfNotExisting(db, currentUser);

            // This doesn't count login failures towards account lockout
            // To enable password failures to trigger account lockout, change to shouldLockout: true
            var result = await SignInManager.PasswordSignInAsync(model.Email, currentUser.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToAction("Index", "Home");
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid Username/Password.");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Check if user already exists with that email
                User currentUser = ModelHelpers.GetCurrentUser(db);

                // If a user is not found
                if (currentUser == null)
                {
                    PasswordHasher hash = new PasswordHasher();

                    User newUser = db.Users.Create();

                    newUser.UserName = model.Username;
                    newUser.Email = model.Email;
                    newUser.Password = hash.HashPassword(model.Password);
                    newUser.FirstName = model.FirstName;
                    newUser.LastName = model.LastName;
                    if (model.Street != null)
                        newUser.Address = model.Street;
                    if (model.Country != null)
                        newUser.Country = model.Country;
                    if (model.City != null)
                        newUser.City = model.City;
                    if (model.Province != null)
                        newUser.StateProv = model.Province;
                    if (model.PostalCode != null)
                        newUser.PostalCode = model.PostalCode;
                    if (model.PhoneNumber != null)
                        newUser.PhoneNumber = model.PhoneNumber;
                    db.Users.Add(newUser);
                    db.SaveChanges();
                    ModelHelpers.CreateUserStoreIfNotExisting(db, newUser);
                    ModelHelpers.CreateUserPaymentMethodIfNotExisting(db, newUser);

                    // MVC will create a User seperate from the Digistore's User. 
                    var user = new ApplicationUser { UserName = model.Email, Email = model.Email, DigistoreUserId = newUser.Id };
                    var result = await UserManager.CreateAsync(user, newUser.Password);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToAction("Index", "Home");
                    }
                    AddErrors(result);
                }
                else
                {
                    ViewBag.EmailInUse = "That e-mail is already in use!";
                    return View(model);
                }
            }
            // If we got this far, something failed, redisplay form.
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

        //
        // POST: /Account/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            // Retrieve the logged in user from the database.
            User currentUser = ModelHelpers.GetCurrentUser(db);

            // Check if the user is not null.
            if (currentUser != null)
            {
                if (!ModelState.IsValid)
                {
                    return View("Index", currentUser);
                }

                PasswordHasher hash = new PasswordHasher();
                if (hash.VerifyHashedPassword(currentUser.Password, model.OldPassword) == PasswordVerificationResult.Success)
                {
                    string hashedPassword = hash.HashPassword(model.NewPassword);
                    var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), currentUser.Password, hashedPassword);
                    if (result.Succeeded)
                    {
                        currentUser.Password = hashedPassword;
                        db.SaveChanges();
                        var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                        if (user != null)
                        {
                            await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        }
                        TempData["resultMessage"] = "Password successfully updated!";
                        return View("Index", currentUser);
                    }
                    AddErrors(result);
                    return View("Index", currentUser);
                }
                else
                {
                    TempData["resultPassword"] = "Old password was incorrect.";
                    return View("Index", currentUser);
                }
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }

        //
        // POST: /Manage/ChangePayment
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePayment(ChangePaymentViewModel model)
        {
            User currentUser = ModelHelpers.GetCurrentUser(db);
            if (currentUser != null)
            {
                if (!ModelState.IsValid)
                {
                    return View("Index", currentUser);
                }
                ModelHelpers.CreateUserPaymentMethodIfNotExisting(db, currentUser);
                PaymentMethod payment = currentUser.PaymentMethods.FirstOrDefault();

                if (model.PaymentType != null)
                    payment.PaymentType = model.PaymentType;
                else
                    payment.PaymentType = "";

                if (model.AccountNumber != null)
                    payment.AccountNumber = model.AccountNumber;
                else
                    payment.AccountNumber = "";
                payment.UserId = currentUser.Id;
                currentUser.PaymentMethods.Add(payment);
                db.SaveChanges();
                TempData["resultMessage"] = "Payment successfully updated!";
                return View("Index", currentUser);
            }
            return View("Index", currentUser);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
                db.Dispose();
            }

            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Login", "Account");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}