using StoreFrontV2.DATA.EF;
using StoreFrontV2.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFrontV2.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities(); // added for access to the database.
        // GET: ShoppingCart
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            if (shoppingCart == null)
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            return View(shoppingCart);
        }

        //Shipping Cart - Step 3 - Create the Action to instantiate our cart, and store our info in session.
        //Also added private BookStorePlusEntities db object (above Index())
        public ActionResult AddToCart(int qty, int productId)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Product product = db.Products.Find(productId);

            CartItemViewModel item = new CartItemViewModel(qty, product);

            if (shoppingCart.ContainsKey(product.ProductID))
            {
                shoppingCart[product.ProductID].Qty += qty;
            }
            else
            {
                shoppingCart.Add(product.ProductID, item);
            }

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        //RemoveFromCart action and remove the cart item from the Dictionary by its' key.
        public ActionResult RemoveFromCart(int id)
        {
            //Retrieve our session variable and store it locally. 
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Remove the cart item.
            shoppingCart.Remove(id);

            //Update Session
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }


        //Replacing Delete functionality with AJAX



        //Shopping Cart - UpdateCart action that ccepts the ProductID & Quantity, and updates our Session variable
        public ActionResult UpdateCart(int productId, int qty)
        {
            //Retrieve the session and store it locally
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Update the quantity tied to the productID that was passed to this action
            shoppingCart[productId].Qty = qty;

            //If cart item quantity is 0, remove that item from the cart
            if (shoppingCart[productId].Qty == 0)
            {
                shoppingCart.Remove(productId);
            }

            //Update Session
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }



    }
}