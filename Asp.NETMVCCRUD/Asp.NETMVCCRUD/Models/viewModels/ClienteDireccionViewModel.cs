using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Asp.NETMVCCRUD.Models.viewModels
{
    public class ClienteDireccionViewModel
    {

            public int ClienteId { get; set; }
            public string NombreCompleto { get; set; }
            public string DirecionPrincipal { get; set; }
    }
}