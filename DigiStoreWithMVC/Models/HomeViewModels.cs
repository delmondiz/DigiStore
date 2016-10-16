using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace DigiStoreWithMVC.Models
{
    public class HomeViewModels
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "ReviewText")]
        public string ReviewText { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Date")]
        public string ReviewDate { get; set; }

        [Display(Name = "Rating")]
        public int ReviewRating { get; set; }

    }
}