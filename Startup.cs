using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebApplication06_eVisa.Startup))]
namespace WebApplication06_eVisa
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
