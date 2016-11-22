using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DigiStoreWithMVC.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 8)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class ChangePaymentViewModel
    {
        public ChangePaymentViewModel() { }
        public ChangePaymentViewModel(PaymentMethod paymentMethod)
        {
            if (paymentMethod != null)
            {
                if (paymentMethod.PaymentType != null)
                    PaymentType = paymentMethod.PaymentType;
                if (paymentMethod.AccountNumber != null)
                    AccountNumber = paymentMethod.AccountNumber;
            }
        }
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Payment Method")]
        public string PaymentType { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Account Number")]
        public string AccountNumber { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class UserDetailsViewModel
    {

        public UserDetailsViewModel() { }
        public UserDetailsViewModel(User user)
        {
            Id = user.Id;
            if (user.FirstName != null)
                FirstName = user.FirstName;
            if (user.LastName != null)
                LastName = user.LastName;
            if (user.Email != null)
                Email = user.Email;
            if (user.PhoneNumber != null)
                PhoneNumber = user.PhoneNumber;
            if (user.Country != null)
                Country = user.Country;
            if (user.Address != null)
                Address = user.Address;
            if (user.City != null)
                City = user.City;
            if (user.StateProv != null)
                StateProv = user.StateProv;
            if (user.PostalCode != null)
                PostalCode = user.PostalCode;
        }

        [Required]
        [DataType(DataType.Text)]
        public int Id { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Country")]
        public string Country { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Address")]
        public string Address { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "City/Town")]
        public string City { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Province")]
        public string StateProv { get; set; }

        [DataType(DataType.PostalCode)]
        [Display(Name = "Postal Code")]
        public string PostalCode { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Username")]
        public string Username { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 8)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
  
        [DataType(DataType.Text)]
        [Display(Name = "Country")]
        public string Country { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Town/City")]
        public string City { get; set; }
 
        [DataType(DataType.Text)]
        [Display(Name = "Province/State")]
        public string Province { get; set; }
        
        [DataType(DataType.PostalCode)]
        [Display(Name = "Postal/Zip Code")]
        public string PostalCode { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Address")]
        public string Street { get; set; }

        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 8)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
