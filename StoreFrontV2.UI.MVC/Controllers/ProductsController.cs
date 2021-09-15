using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using StoreFrontV2.DATA.EF;
using StoreFrontV2.UI.MVC.Utilities;
using PagedList.Mvc;

namespace StoreFrontV2.UI.MVC.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        [AllowAnonymous]
        public ActionResult Index(string searchString, string categoryFilter, int page = 1)
        {
            ViewBag.CategoryFilter = new SelectList(db.Categories.Select(x => x.CategoryName));
            int pageSize = 6;
            var products = db.Products.OrderBy(x => x.ProductName).Include(p => p.Category).Include(p => p.ProductStatu).Include(p => p.Supplier).ToList(); 

            if (String.IsNullOrEmpty(searchString) && String.IsNullOrEmpty(categoryFilter))
            {
                return View(products.ToPagedList(page, pageSize));
            }
            else if (String.IsNullOrEmpty(searchString) && !String.IsNullOrEmpty(categoryFilter))
            {
                products = products.Where(x => x.Category.CategoryName.ToLower() == categoryFilter.ToLower()).ToList();
                return View(products.ToPagedList(page, pageSize));
            }
            else if (!String.IsNullOrEmpty(searchString) && String.IsNullOrEmpty(categoryFilter))
            {
                products = products.Where(x => x.ProductName.ToLower().Contains(searchString.ToLower())).ToList();
                return View(products.ToPagedList(page, pageSize));
            }
            else
            {
                products = products.Where(x => x.Category.CategoryName == categoryFilter && x.ProductName.ToLower().Contains(searchString.ToLower())).ToList();
                return View(products.ToPagedList(page, pageSize));
            }
            ViewBag.SearchString = searchString;

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

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
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
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;

                        #region Resize Image

                        //params for the Image Utility
                        //What we need:  Filepath, Image File, maximum image size (full size), maximum thumb size (thumbnail)

                        //filepath
                        string savePath = Server.MapPath("~/Content/images/ProductImages/");

                        //image file
                        Image convertedImage = Image.FromStream(prodImage.InputStream);

                        //Max image size
                        int maxImageSize = 500; //value in pixels

                        //Max Thumb size
                        int maxThumbSize = 100;

                        //Call the ImageUtility to do work
                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);

                        #endregion
                    }

                    else
                    {
                        imageName = "NoImage.JPG";
                    }

                }

                product.ProdImage = imageName;
                #endregion


                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
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
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
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

                string imageName = "";

                if (prodImage != null)
                {
                    imageName = prodImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpg", ".png", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        //file path
                        string savePath = Server.MapPath("~/Content/images/ProductImages/");

                        //image file
                        Image convertedImage = Image.FromStream(prodImage.InputStream);

                        //Max image size
                        int maxImageSize = 500; //value in pixels

                        //Max Thumb size
                        int maxThumbSize = 100;

                        //Call the ImageUtility to do work
                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);

                        if (product.ProdImage != "noImage.JPG" && product.ProdImage != null)
                        {
                            //delete old file
                            string path = Server.MapPath("~/Content/images/ProductImages/");

                            //Call Delete Method with path and filename
                            ImageUtility.Delete(path, product.ProdImage);
                        }
                    }

                    else
                    {
                        imageName = "NoImage.JPG";
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

            string path = "~/Content/images/ProductImages/";
            ImageUtility.Delete(path, product.ProdImage);

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
