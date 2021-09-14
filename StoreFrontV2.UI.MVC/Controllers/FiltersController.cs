using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity; //Added for the .Include() Method
using StoreFrontV2.DATA.EF;

namespace StoreFrontV2.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Clientside()
        {
            var products = db.Products.Include(p => p.Supplier);

            return View(products.ToList());
        }
    }
}