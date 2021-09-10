using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontV2.DATA.EF;

namespace StoreFrontV2.UI.MVC.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        [AllowAnonymous]
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.ProductStatu).Include(p => p.Supplier);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.StatusID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.StatusID = new SelectList(db.ProductStatus, "StatusID", "Status");
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "SupplierName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,CategoryID,StatusID,UnitPrice,UnitsInStock,UnitsOnOrder,SupplierID,Description,ProdImage")] Product product, HttpPostedFileBase prodImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload

                string imageName = "noImage.JPG";

                if (prodImage != null)
                {
                    imageName = prodImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpg", ".png", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        prodImage.SaveAs(Server.MapPath("~/Content/images/ProductImages/" + imageName));
                    }
                    else
                    {
                        imageName = "noImage.JPG";
                    }
                }

                product.ProdImage = imageName;
                #endregion


                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StatusID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.StatusID);
            ViewBag.StatusID = new SelectList(db.ProductStatus, "StatusID", "Status", product.StatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "SupplierName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.StatusID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.StatusID);
            ViewBag.StatusID = new SelectList(db.ProductStatus, "StatusID", "Status", product.StatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "SupplierName", product.SupplierID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,CategoryID,StatusID,UnitPrice,UnitsInStock,UnitsOnOrder,SupplierID,Description,ProdImage")] Product product, HttpPostedFileBase prodImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload

                if (prodImage != null)
                {
                    string imageName = prodImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpg", ".png", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        prodImage.SaveAs(Server.MapPath("~/Content/images/ProductImages/" + imageName));

                        if (product.ProdImage != "noImage.JPG" && product.ProdImage != null)
                        {
                            //delete old file
                            System.IO.File.Delete(Server.MapPath("~/Content/images/ProductImages/" + product.ProdImage));
                        }
                    }

                    product.ProdImage = imageName;
                }

                #endregion

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StatusID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.StatusID);
            ViewBag.StatusID = new SelectList(db.ProductStatus, "StatusID", "Status", product.StatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "SupplierName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
