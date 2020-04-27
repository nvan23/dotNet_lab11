using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SinhVien.Startup))]
namespace SinhVien
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
