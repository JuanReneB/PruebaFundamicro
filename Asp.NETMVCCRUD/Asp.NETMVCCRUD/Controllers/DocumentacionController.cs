using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Asp.NETMVCCRUD.Controllers
{
    public class DocumentacionController : Controller
    {
        // GET: Documentacion
        public ActionResult Index()
        {
            return View();
        }
    }
}