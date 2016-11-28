using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace DigiStoreWithMVC.Models
{
    public class StoreListingViewModel
    {
        public User curUser = new User();

        public IEnumerable<Store> Stores { get; set; }
    }

    public class StoreViewModel
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Store Id")]
        public int Id { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Store Name")]
        public string Name { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Store Address")]
        public string Address { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "City")]
        public string City { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Country")]
        public string Country { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Postal Code")]
        public string PostalCode { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Store Phone Number")]
        public string PhoneNumber { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "State or Provence")]
        public string StateProv { get; set; }

        [DataType(DataType.Text)]
        [Display(Name = "Store Photo")]
        public string StorePicture { get; set; }
    }
}