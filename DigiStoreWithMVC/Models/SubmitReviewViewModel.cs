using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace DigiStoreWithMVC.Models
{
    public class SubmitReviewViewModel
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "ReviewText")]
        public string ReviewText { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Date")]
        public string ReviewDate { get; set; }

        [Required]
        [Display(Name = "Rating")]
        [Range(1, 5)]
        public int ReviewRating { get; set; }

        [DataType(DataType.Text)]
        public string StoreOwnerEmail { get; set; }

        public SubmitReviewViewModel() { }

        public SubmitReviewViewModel(string storeOwnerEmail) {
            StoreOwnerEmail = storeOwnerEmail;
        }
    }
}