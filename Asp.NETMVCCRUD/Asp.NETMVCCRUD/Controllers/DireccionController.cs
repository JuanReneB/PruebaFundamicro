using Asp.NETMVCCRUD.Models;
using Asp.NETMVCCRUD.Models.viewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Asp.NETMVCCRUD.Controllers
{
    [Authorize]
    public class DireccionController : Controller
    {

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

        [HttpGet]
        public ActionResult FormDirecciones(int id)
        {
            using (DBModel db = new DBModel())
            {
                // Buscar el cliente por su ID
                var cliente = db.Clientes1.FirstOrDefault(c => c.clienteId == id);
                if (cliente == null)
                {
                    return HttpNotFound("Cliente no encontrado.");
                }

                // Crear el ViewModel y llenarlo con los datos del cliente
                var model = new ClienteDireccionViewModel
                {
                    ClienteId = cliente.clienteId,
                    NombreCompleto = cliente.nombre,
                    DirecionPrincipal = cliente.direccion,
                };

                // Pasar el modelo a la vista
                return View(model);
            }
        }

        [HttpGet]
        public ActionResult GetData(int clienteId)
        {
            using (DBModel db = new DBModel())
            {
                // Obtener las direcciones filtradas por ClienteId
                var direccionesData = db.Direcciones1
                    .Where(d => d.ClienteId == clienteId) // Filtrar por ClienteId
                    .Select(d => new
                    {
                        d.DireccionId,
                        d.ClienteId,
                        d.Descripcion_direccion
                    })
                    .ToList();

                return Json(new { data = direccionesData }, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpGet]
        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
                return View(new Direcciones()); // Asumiendo que la clase es 'Direccion'
            else
            {
                using (DBModel db = new DBModel())
                {
                    // Buscar la dirección por ID
                    return View(db.Direcciones1.Where(x => x.DireccionId == id).FirstOrDefault<Direcciones>());
                }
            }
        }


        [HttpPost]
        public ActionResult AddOrEdit(Direcciones direccion)
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
                    if (direccion.DireccionId == 0)
                    {
                        // Nueva dirección
                        db.Direcciones1.Add(direccion);
                        db.SaveChanges();
                        return Json(new { success = true, message = "Guardado exitosamente" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        // Dirección existente: buscar dirección en la base de datos
                        var direccionExistente = db.Direcciones1.AsNoTracking().FirstOrDefault(d => d.DireccionId == direccion.DireccionId);
                        if (direccionExistente == null)
                        {
                            return Json(new { success = false, message = "Dirección no encontrada" }, JsonRequestBehavior.AllowGet);
                        }

                        // Guardar el ID del usuario desde la sesión
                        int usuarioId = Convert.ToInt32(Session["UserId"]);

                        // Verificar cambios campo por campo
                        if (direccionExistente.ClienteId != direccion.ClienteId)
                        {
                            RegistrarAuditoria(direccion.ClienteId, "ClienteId", direccionExistente.ClienteId.ToString(), direccion.ClienteId.ToString(), usuarioId);
                        }
                        if (direccionExistente.Descripcion_direccion != direccion.Descripcion_direccion)
                        {
                            RegistrarAuditoria(direccion.ClienteId, "Descripcion_direccion", direccionExistente.Descripcion_direccion, direccion.Descripcion_direccion, usuarioId);
                        }

                        // Actualizar dirección
                        db.Entry(direccion).State = EntityState.Modified;
                        db.SaveChanges();
                        return Json(new { success = true, message = "Actualizado exitosamente" }, JsonRequestBehavior.AllowGet);
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores: devolver mensaje de error
                    return Json(new { success = false, message = "Error al guardar los datos direccion: " + ex.Message }, JsonRequestBehavior.AllowGet);
                }
            }
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            using (DBModel db = new DBModel())
            {
                Direcciones emp = db.Direcciones1.Where(x => x.DireccionId == id).FirstOrDefault<Direcciones>();
                db.Direcciones1.Remove(emp);
                db.SaveChanges();
                return Json(new { success = true, message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);
            }
        }

    }


}