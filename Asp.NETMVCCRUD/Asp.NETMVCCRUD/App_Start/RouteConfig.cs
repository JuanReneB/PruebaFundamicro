using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Asp.NETMVCCRUD
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // Ruta para el controlador Home
            routes.MapRoute(
                name: "Home",
                url: "Home/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            // Ruta para el controlador Clientes
            routes.MapRoute(
                name: "Clientes",
                url: "Clientes/{action}/{id}",
                defaults: new { controller = "Clientes", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
         name: "Usuarios",
         url: "Usuarios/{action}/{id}",
         defaults: new { controller = "Usuario", action = "Index", id = UrlParameter.Optional }
             );

            routes.MapRoute(
       name: "Auditoria",
       url: "Auditoria/{action}/{id}",
       defaults: new { controller = "Auditoria", action = "Index", id = UrlParameter.Optional }
           );



            // Ruta por defecto
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
