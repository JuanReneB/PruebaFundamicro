using System.Web.Http;

namespace Asp.NETMVCCRUD
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuración para permitir rutas por atributos en los controladores
            config.MapHttpAttributeRoutes();

            // Definir una ruta por defecto para la API
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

        }
    }
}
