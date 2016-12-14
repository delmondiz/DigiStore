using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigiStoreWithMVC.Models
{
    public partial class ItemMetaData
    {
        [Required]
        [Display(Name = "Item Name")]
        public string Name { get; set; }

        [Display(Name = "Item Description")]
        public string Description { get; set; }

        [Required]
        [Display(Name = "Item Price")]
        public decimal Price { get; set; }

        [Display(Name = "Item Weight")]
        public Nullable<double> Weight { get; set; }

        [Required]
        [Display(Name = "Item Quantity")]
        public int Quantity { get; set; }

        [Required]
        [Display(Name = "Image Filepath")]
        public string ImagePath { get; set; }
    }

         
}