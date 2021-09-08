using StoreFrontV2.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace StoreFrontV2.UI.MVC.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        // POST: Contact
        [HttpPost]
        public ActionResult Index(ContactViewModel cvm)
        {
            //Email String
            string body = $"StoreFront message received from {cvm.Name} - {cvm.Email}<br />Subject: {cvm.Subject}<br />Message: {cvm.Body}";

            //Added these after setting up the AppSecretKeys.config to hide sensitive information from the controller.
            //Be sure to also add /Configs to the .gitignor file.  
            string emailUser = WebConfigurationManager.AppSettings["EmailUser"];
            string emailToAddress = WebConfigurationManager.AppSettings["EmailToAddress"];
            string emailServer = WebConfigurationManager.AppSettings["EmailServer"];
            string emailPassword = WebConfigurationManager.AppSettings["EmailPassword"];

            //Creation of MailMessage
            MailMessage mm = new MailMessage(emailUser, emailToAddress, "Message from contact form", body);

            mm.IsBodyHtml = true;

            //Creation of Smtp Client object
            SmtpClient client = new SmtpClient(emailServer);
            client.Credentials = new NetworkCredential(emailUser, emailPassword);
            client.Port = 8889; //For select network providers  (AT&T)

            //Mail Send
            try
            {
                client.Send(mm);
                return View("EmailConfirmation", cvm);
            }
            catch (Exception)
            {
                ViewBag.ErrorMessage = "Cannot send mail at this time.  Please try again later.";
                return View(cvm);

            }

            return View();
        }



    }
}