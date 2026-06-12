using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopEase.Models
{
    public class UserModel
    {
        public int UserID { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Mobile { get; set; }

        public string Address { get; set; }
    }
}