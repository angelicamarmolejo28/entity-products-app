using ProductsStore.Back.Maestros;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProductStore.Web.Utils
{
    public class SessionManager
    {
        public static Usuarios usuario
        {
            get { return (Usuarios)(HttpContext.Current.Session["Usuario"] ?? null); }
            set { HttpContext.Current.Session["Usuario"] = value; }
        }
    }
}