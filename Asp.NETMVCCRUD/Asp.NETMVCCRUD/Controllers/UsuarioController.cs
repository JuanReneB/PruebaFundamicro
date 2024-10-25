using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Asp.NETMVCCRUD.Models;


namespace Asp.NETMVCCRUD.Controllers
{
    using System.Data.Entity;
    using System.Security.Cryptography;
    using System.Text;

    public static class PasswordHelper
    {
        public static string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var bytes = Encoding.UTF8.GetBytes(password);
                var hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }
        public static bool VerifyPassword(string enteredPassword, string storedHash)
        {
            // Hash la contraseña ingresada
            var enteredHash = PasswordHelper.HashPassword(enteredPassword);

            // Comparar el hash ingresado con el hash almacenado
            return enteredHash == storedHash;
        }

    }

    [Authorize]
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetData()
        {
            using (DBModel db = new DBModel())
            {
                // Obtener la lista de clientes ordenada por clienteId de forma descendente y proyectar solo los campos que necesitas
                var usuariosData = db.usuarios1
                                     .OrderByDescending(c => c.usuarioId)
                                     .Select(c => new
                                     {
                                         c.usuarioId,
                                         c.nombre,
                                         c.correo,
                                         c.user_name,
                                         c.clave,
                               
                                     })
                                     .ToList();

                return Json(new { data = usuariosData }, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpGet]
        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
                return View(new usuarios());
            else
            {
                using (DBModel db = new DBModel())
                {
                    return View(db.usuarios1.Where(x => x.usuarioId == id).FirstOrDefault<usuarios>());
                }
            }
        }

        [HttpPost]
        public ActionResult AddOrEdit(usuarios emp)
        {
            using (DBModel db = new DBModel())
            {
                // Verificar si el modelo es válido
                if (!ModelState.IsValid)
                {
                    // Si el modelo no es válido, devolver un error con los mensajes de validación
                    return Json(new { success = false, message = "Datos no válidos", errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage) }, JsonRequestBehavior.AllowGet);
                }

                try
                {
                    if (emp.usuarioId == 0) // Si es un nuevo usuario
                    {
                        // Verificar si el usuario ya existe por nombre de usuario
                        var existingUser = db.usuarios1.FirstOrDefault(u => u.user_name == emp.user_name);
                        if (existingUser != null)
                        {
                            return Json(new { success = false, message = "El usuario ya existe." }, JsonRequestBehavior.AllowGet);
                        }

                        // Encriptar la contraseña antes de guardar
                        emp.clave = PasswordHelper.HashPassword(emp.clave);

                        db.usuarios1.Add(emp);
                        db.SaveChanges();
                        return Json(new { success = true, message = "Guardado exitosamente" }, JsonRequestBehavior.AllowGet);
                    }
                    else // Usuario existente
                    {
                        var existingUser = db.usuarios1.Find(emp.usuarioId);
                        if (existingUser == null)
                        {
                            return Json(new { success = false, message = "Usuario no encontrado." }, JsonRequestBehavior.AllowGet);
                        }

                        // Actualizar los campos que no cambian
                        existingUser.nombre = emp.nombre;
                        existingUser.correo = emp.correo;
                        existingUser.user_name = emp.user_name;

                        // Verificar si se ingresó una nueva contraseña
                        if (!string.IsNullOrEmpty(emp.clave))
                        {
                            // Encriptar la nueva contraseña y actualizar
                            existingUser.clave = PasswordHelper.HashPassword(emp.clave);
                        }

                        db.Entry(existingUser).State = EntityState.Modified;
                        db.SaveChanges();
                        return Json(new { success = true, message = "Actualizado exitosamente" }, JsonRequestBehavior.AllowGet);
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores: devolver mensaje de error
                    return Json(new { success = false, message = "Error al guardar los datos: " + ex.Message }, JsonRequestBehavior.AllowGet);
                }
            }
        }



        [HttpPost]
        public ActionResult Delete(int id)
        {
            using (DBModel db = new DBModel())
            {
                usuarios emp = db.usuarios1.Where(x => x.usuarioId == id).FirstOrDefault<usuarios>();
                db.usuarios1.Remove(emp);
                db.SaveChanges();
                return Json(new { success = true, message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
