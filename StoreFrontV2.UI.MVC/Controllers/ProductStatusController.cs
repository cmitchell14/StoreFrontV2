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
    public class ProductStatusController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: ProductStatus
        public ActionResult Index()
        {
            return View(db.ProductStatus.ToList());
        }

        // GET: ProductStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductStatu productStatu = db.ProductStatus.Find(id);
            if (productStatu == null)
            {
                return HttpNotFound();
            }
            return View(productStatu);
        }

        // GET: ProductStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StatusID,Status")] ProductStatu productStatu)
        {
            if (ModelState.IsValid)
            {
                db.ProductStatus.Add(productStatu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productStatu);
        }

        // GET: ProductStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductStatu productStatu = db.ProductStatus.Find(id);
            if (productStatu == null)
            {
                return HttpNotFound();
            }
            return View(productStatu);
        }

        // POST: ProductStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StatusID,Status")] ProductStatu productStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productStatu);
        }

        // GET: ProductStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductStatu productStatu = db.ProductStatus.Find(id);
            if (productStatu == null)
            {
                return HttpNotFound();
            }
            return View(productStatu);
        }

        // POST: ProductStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductStatu productStatu = db.ProductStatus.Find(id);
            db.ProductStatus.Remove(productStatu);
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
