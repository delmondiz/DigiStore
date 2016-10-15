using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DigiStoreWithMVC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    name: "BrowseStoresByName",
            //    url: "S/{storeName}",
            //    defaults: new { controller = "Store", action = "S", storeName = UrlParameter.Optional }
            //);

            //routes.MapRoute(
            //    name: "StoreOptions",
            //    url: "Store/{storeName}/{action}",
            //    defaults: new { controller = "Store", action = "Index", storeName = UrlParameter.Optional }
            //);
            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Store",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Store", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Account",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Index", id = UrlParameter.Optional }
            );


        }
    }
}
