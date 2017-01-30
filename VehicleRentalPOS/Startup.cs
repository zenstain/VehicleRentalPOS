using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VehicleRentalPOS.Startup))]
namespace VehicleRentalPOS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
