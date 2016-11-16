using System.Web;
using System.Web.Optimization;

namespace DigiStoreWithMVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/digistore").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/materialize.js",
                        "~/Scripts/init.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new StyleBundle("~/Content/digistore").Include(
                        "~/Content/materialize.min.css",
                        "~/Content/icon.css",
                        "~/Content/digistore.css",
                        "~/Content/dropify.css",
                         "~/Content/dropify.min.css",
                        "~/Content/theme.css"));
        }
    }
}
