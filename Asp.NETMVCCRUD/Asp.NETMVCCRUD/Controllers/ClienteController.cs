using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Asp.NETMVCCRUD.Models;
using System.Data.Entity;
using System.Text;

namespace Asp.NETMVCCRUD.Controllers
{
    [Authorize]
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/
        public ActionResult Index()
        {
            return View();
        }

        private void RegistrarAuditoria(int clienteId, string campoModificado, string valorAnterior, string valorNuevo, int usuarioId)
        {
            using (DBModel db = new DBModel())
            {
                var auditoria = new AuditoriaCliente
                {
                    ClienteId = clienteId,
                    CampoModificado = campoModificado,
                    ValorAnterior = valorAnterior,
                    ValorNuevo = valorNuevo,
                    FechaModificacion = DateTime.Now,
                    UsuarioId = usuarioId // Relacionado con el ID del usuario que realizó el cambio
                };

                db.AuditoriaClientes.Add(auditoria);
                db.SaveChanges();
            }
        }


        // Acción para exportar clientes a CSV
        [HttpGet]
        public ActionResult ExportarCSV()
        {

            using (DBModel db = new DBModel())
            {
                var clientes = db.Clientes1.ToList();

                // Crear el StringBuilder para almacenar las líneas del CSV
                var csv = new StringBuilder();
                // Encabezados del CSV
                csv.AppendLine("ClienteId,Nombre,Correo,Teléfono,Dirección");

                // Agregar los datos de los clientes al CSV
                foreach (var cliente in clientes)
                {
                    csv.AppendLine($"{cliente.clienteId},{cliente.nombre},{cliente.correo},{cliente.telefono},{cliente.direccion}");
                }

                // Convertir el CSV a un array de bytes
                var bytes = Encoding.UTF8.GetBytes(csv.ToString());

                // Devolver el archivo CSV
                return File(bytes, "text/csv", "Clientes.csv");
            }
        }


        // Acción para exportar clientes a TXT
        [HttpGet]
        public ActionResult ExportarTXT()
        {
            using (DBModel db = new DBModel())
            {
                var clientes = db.Clientes1.ToList();

                // Crear el StringBuilder para almacenar las líneas del archivo TXT
                var txt = new StringBuilder();
                // Encabezado del archivo TXT
                txt.AppendLine("ClienteId | Nombre | Correo | Teléfono | Dirección");
                txt.AppendLine("---------------------------------------------");

                // Agregar los datos de los clientes al archivo TXT
                foreach (var cliente in clientes)
                {
                    txt.AppendLine($"{cliente.clienteId} | {cliente.nombre} | {cliente.correo} | {cliente.telefono} | {cliente.direccion}");
                }

                // Convertir el contenido a un array de bytes
                var bytes = Encoding.UTF8.GetBytes(txt.ToString());

                // Devolver el archivo TXT
                return File(bytes, "text/plain", "Clientes.txt");
            }
        }


        public ActionResult GetData()
        {
            using (DBModel db = new DBModel())
            {
                // Obtener la lista de clientes ordenada por clienteId de forma descendente y proyectar solo los campos que necesitas
                var clientesData = db.Clientes1
                                     .OrderByDescending(c => c.clienteId)
                                     .Select(c => new
                                     {
                                         c.clienteId,
                                         c.nombre,
                                         c.correo,
                                         c.telefono,
                                         c.documento,
                                         c.direccion
                                     })
                                     .ToList();

                return Json(new { data = clientesData }, JsonRequestBehavior.AllowGet);
            }
        }



        [HttpGet]
        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
                return View(new Clientes());
            else
            {
                using (DBModel db = new DBModel())
                {
                    return View(db.Clientes1.Where(x => x.clienteId==id).FirstOrDefault<Clientes>());
                }
            }
        }

        [HttpPost]
        public ActionResult AddOrEdit(Clientes emp)
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
                    if (emp.clienteId == 0)
                    {
                        // Nuevo cliente
                        db.Clientes1.Add(emp);
                        db.SaveChanges();
                        return Json(new { success = true, message = "Guardado exitosamente" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        // Cliente existente: buscar cliente en la base de datos
                        var clienteExistente = db.Clientes1.AsNoTracking().FirstOrDefault(c => c.clienteId == emp.clienteId);
                        if (clienteExistente == null)
                        {
                            return Json(new { success = false, message = "Cliente no encontrado" }, JsonRequestBehavior.AllowGet);
                        }

                        // Guardar el ID del usuario desde la sesión
                        int usuarioId = Convert.ToInt32(Session["UserId"]);

                        // Verificar cambios campo por campo
                        if (clienteExistente.nombre != emp.nombre)
                        {
                            RegistrarAuditoria(emp.clienteId, "nombre", clienteExistente.nombre, emp.nombre, usuarioId);
                        }
                        if (clienteExistente.correo != emp.correo)
                        {
                            RegistrarAuditoria(emp.clienteId, "correo", clienteExistente.correo, emp.correo, usuarioId);
                        }
                        if (clienteExistente.telefono != emp.telefono)
                        {
                            RegistrarAuditoria(emp.clienteId, "telefono", clienteExistente.telefono, emp.telefono, usuarioId);
                        }
                        if (clienteExistente.direccion != emp.direccion)
                        {
                            RegistrarAuditoria(emp.clienteId, "direccion", clienteExistente.direccion, emp.direccion, usuarioId);
                        }

                        // Actualizar cliente
                        db.Entry(emp).State = EntityState.Modified;
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
                Clientes emp = db.Clientes1.Where(x => x.clienteId == id).FirstOrDefault<Clientes>();
                db.Clientes1.Remove(emp);
                db.SaveChanges();
                return Json(new { success = true, message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}