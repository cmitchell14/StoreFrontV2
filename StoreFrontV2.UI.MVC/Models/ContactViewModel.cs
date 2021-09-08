using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontV2.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "This is a required field")]
        public string Name { get; set; }

        [Required(ErrorMessage = "This is a required field")]
        [EmailAddress(ErrorMessage = "Please use a valid email address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "This is a required field")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "This is a required field")]
        [UIHint("MultilineText")]
        public string Body { get; set; }
    }
}