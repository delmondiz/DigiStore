using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DigiStoreWithMVC.Startup))]
namespace DigiStoreWithMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
