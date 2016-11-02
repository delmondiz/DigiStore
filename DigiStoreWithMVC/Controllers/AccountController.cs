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
                    return View(currentUser);
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
        public ActionResult Index(User model)
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);
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
                    return View(currentUser);
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
            ModelHelpers.CreateUserStore(db, currentUser);

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
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // Require that the user has already logged in via username/password or external login
            if (!await SignInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            // The following code protects for brute force attacks against the two factor codes. 
            // If a user enters incorrect codes for a specified amount of time then the user account 
            // will be locked out for a specified amount of time. 
            // You can configure the account lockout settings in IdentityConfig


            var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid code.");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {

            // Clearing the ASP.NET Users.
            // DO NOT UNCOMMENT BELOW UNLESS YOU LITERALLY, WISH TO BRING ABOUT RUIN IN THE WORLD.

            //////////////foreach (var user in UserManager.Users.ToList())
            //////////////{
            //////////////    if (UserManager.DeleteAsync(user).Result.Succeeded)
            //////////////    {
            //////////////        // Do Nothing
            //////////////    }
            //////////////}

            //ViewData["count"] = UserManager.Users.Count();
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
                    ModelHelpers.CreateUserStore(db, newUser);
                    // ASP.NET Will create a User seperate from the database. 
                    var user = new ApplicationUser { UserName = model.Email, Email = model.Email, DigistoreUserId = newUser.Id };
                    var result = await UserManager.CreateAsync(user, newUser.Password);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        //user.DigistoreUserId = newUser.Id;
                        // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                        // Send an email with this link
                        // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                        // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                        // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");
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
            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        //
        // GET: /Account/ForgotPassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByNameAsync(model.Email);
                if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
                {
                    // Don't reveal that the user does not exist or is not confirmed
                    return View("ForgotPasswordConfirmation");
                }

                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                // Send an email with this link
                // string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                // var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);		
                // await UserManager.SendEmailAsync(user.Id, "Reset Password", "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>");
                // return RedirectToAction("ForgotPasswordConfirmation", "Account");
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ForgotPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await SignInManager.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // Generate the token and send it
            if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
                case SignInStatus.Failure:
                default:
                    // If the user does not have an account, then prompt the user to create an account
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
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
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // Retrieve the logged in user from the database.
            User currentUser = ModelHelpers.GetCurrentUser(db);

            // Check if the user is not null.
            if (currentUser != null)
            {
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
                        return RedirectToAction("Index", "Account");
                    }
                    AddErrors(result);
                    return View(model);
                }
                else
                    return View();
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }

        //
        // GET: /Manage/ChangePayment
        public ActionResult ChangePayment()
        {
            if (User.Identity.IsAuthenticated)
            {
                User currentUser = ModelHelpers.GetCurrentUser(db);
                if (currentUser != null)
                {
                    PaymentMethod model = currentUser.PaymentMethods.FirstOrDefault();

                    if (model != null)
                    {
                        return View(model);
                    }
                    return View(new PaymentMethod());
                }
                else
                    return RedirectToAction("Login", "Account");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        //
        // POST: /Manage/ChangePayment
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePayment(PaymentMethod model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            User currentUser = ModelHelpers.GetCurrentUser(db);
            if (currentUser != null)
            {
                PaymentMethod payment = currentUser.PaymentMethods.FirstOrDefault();
                if (payment == null)
                    payment = db.PaymentMethods.Create();

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
                return RedirectToAction("Index", "Account");
            }
            return View();
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