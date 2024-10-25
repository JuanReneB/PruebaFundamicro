using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Asp.NETMVCCRUD.Models.viewModels
{
    public class ClienteDocumentoViewModel
    {

            public int ClienteId { get; set; }
            public string NombreCompleto { get; set; }
            public string TipoDocumento { get; set; }
            public string NumeroDocumento { get; set; }
    }
}