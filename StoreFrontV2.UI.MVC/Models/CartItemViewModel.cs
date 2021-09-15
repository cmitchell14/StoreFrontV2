using StoreFrontV2.DATA.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFrontV2.UI.MVC.Models
{
    public class CartItemViewModel
    {

        public Product Product { get; set; }
        public int Qty { get; set; }

        //Fully Qualified CTOR
        public CartItemViewModel(int qty, Product product)
        {
            //Property      is assigned the value of      parameter
            Qty = qty;
            Product = product;
        }

    }
}