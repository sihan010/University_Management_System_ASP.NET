using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(focus.Startup))]
namespace focus
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
