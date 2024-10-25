using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Asp.NETMVCCRUD.Models;
using System.Data.Entity;

namespace Asp.NETMVCCRUD.Controllers
{
    [Authorize]
    public class AuditoriaClienteController : Controller
    {
        // GET: AuditoriaCliente
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetData()
        {
            using (DBModel db = new DBModel())
            {
                // Obtener la lista de registros de auditoría ordenada por FechaModificacion de forma descendente y proyectar solo los campos que necesitas
                var auditoriaData = db.AuditoriaClientes
                                      .OrderByDescending(a => a.FechaModificacion)
                                      .Select(a => new
                                      {
                                          a.AuditoriaId,
                                          a.ClienteId,
                                          ClienteNombre = db.Clientes1.Where(c => c.clienteId == a.ClienteId).Select(c => c.nombre).FirstOrDefault(), // Obtener nombre del cliente
                                          a.CampoModificado,
                                          a.ValorAnterior,
                                          a.ValorNuevo,
                                          a.FechaModificacion,
                                          UsuarioNombre = db.usuarios1.Where(u => u.usuarioId == a.UsuarioId).Select(u => u.user_name).FirstOrDefault() // Obtener nombre del usuario
                                      })
                                      .ToList();

                return Json(new { data = auditoriaData }, JsonRequestBehavior.AllowGet);
            }
        }




    }
}