using Asp.NETMVCCRUD.Models;
using System.Linq;
using System.Web.Http;

namespace Asp.NETMVCCRUD.Controllers
{
    public class ApiClienteController : ApiController
    {
        private DBModel db = new DBModel(); // Tu contexto de base de datos

        // GET: api/cliente
        [HttpGet]
        [Route("api/cliente")]
        public IHttpActionResult GetClientes()
        {
            var clientes = db.Clientes1
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

            return Ok(clientes);
        }

            // GET: api/cliente/{id}
            [HttpGet]
        [Route("api/cliente/{id:int}")]
        public IHttpActionResult GetCliente(int id)
        {
            var cliente = db.Clientes1
                      .Where(c => c.clienteId == id)
                      .Select(c => new
                      {
                          c.clienteId,
                          c.nombre,
                          c.correo,
                          c.telefono,
                          c.documento,
                          c.direccion
                      })
                      .FirstOrDefault();
            if (cliente == null)
            {
                return NotFound();
            }
            return Ok(cliente);
        }

        // POST: api/cliente
        [HttpPost]
        [Route("api/cliente")]
        public IHttpActionResult AddCliente([FromBody] Clientes nuevoCliente)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Clientes1.Add(nuevoCliente);
            db.SaveChanges();

            // Retornar el cliente con Ok
            return Ok(nuevoCliente); // Estado 200 y los datos del cliente
        }



        // PUT: api/cliente/{id}
        [HttpPut]
        [Route("api/cliente/{id:int}")]
        public IHttpActionResult UpdateCliente(int id, [FromBody] Clientes clienteActualizado)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var cliente = db.Clientes1.Find(id);
            if (cliente == null)
            {
                return NotFound();
            }

            cliente.nombre = clienteActualizado.nombre;
            cliente.correo = clienteActualizado.correo;
            cliente.telefono = clienteActualizado.telefono;
            cliente.documento = clienteActualizado.documento;
            cliente.direccion = clienteActualizado.direccion;

            db.SaveChanges();

            return Ok(cliente);
        }

        // DELETE: api/cliente/{id}
        [HttpDelete]
        [Route("api/cliente/{id:int}")]
        public IHttpActionResult DeleteCliente(int id)
        {
            var cliente = db.Clientes1.Find(id);
            if (cliente == null)
            {
                return NotFound();
            }

            db.Clientes1.Remove(cliente);
            db.SaveChanges();

            return Ok();
        }
    }
}
