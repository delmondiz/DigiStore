using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DigiStoreWithMVC.Models;
using System.Data.Entity;


namespace DigiStoreWithMVC.Models
{
    public class nItem
    {
        private Item ite = new Item();
        private int quantity;

        public nItem() {
        }

        public nItem(Item item, int quantity)
        {
            this.ite = item;
            this.quantity = quantity;
        }

        public Item Ite
        {
            get
            {
                return ite;
            }

            set
            {
                ite = value;
            }
        }

        public int Quantity
        {
            get
            {
                return quantity;
            }

            set
            {
                quantity = value;
            }
        }
    }
}