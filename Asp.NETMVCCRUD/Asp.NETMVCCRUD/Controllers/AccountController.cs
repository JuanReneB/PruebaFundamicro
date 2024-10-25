using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Asp.NETMVCCRUD.Models;
using System.Data.Entity;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

namespace Asp.NETMVCCRUD.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl; // Guarda la URL de retorno
            return View();
        }

        // GET: Account/Login
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl; // Guarda la URL de retorno
            return View("Index"); // Cargar la vista de inicio de sesión
        }

        [HttpPost]
        public ActionResult Login(string username, string password, string returnUrl)
        {
            using (DBModel db = new DBModel())
            {
                var user = db.usuarios1.FirstOrDefault(u => u.user_name == username);

                if (user != null && PasswordHelper.VerifyPassword(password, user.clave))
                {
                    Session["UserId"] = user.usuarioId;
                    Session["UserName"] = user.user_name;
                    Session["FullName"] = user.nombre;
                    FormsAuthentication.SetAuthCookie(user.user_name, false);
                    return RedirectToLocal(returnUrl);
                }

                ViewBag.Message = "Usuario o contraseña incorrectos.";
                return View("Index");
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Logout()
        {
            // Limpiar la sesión del usuario
            Session.Clear(); // Limpiar todas las variables de sesión
            FormsAuthentication.SignOut(); // Cerrar la sesión del usuario

            // Redirigir al usuario a la página de inicio de sesión
            return RedirectToAction("Index", "Account");
        }

    }
}