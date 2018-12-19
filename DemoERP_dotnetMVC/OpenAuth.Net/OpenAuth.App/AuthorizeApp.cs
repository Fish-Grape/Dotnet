using System.Linq;
using Infrastructure;
using OpenAuth.App.Response;
using OpenAuth.Repository.Domain;
using OpenAuth.Repository.Interface;

namespace OpenAuth.App
{
    /// <summary>
    ///  加载用户所有可访问的资源/机构/模块
    /// </summary>
    public class AuthorizeApp
    {
        public SystemAuthService AuthService { get; set; }
        public  AuthoriseService AuthoriseService { get; set; }

        public IUnitWork _unitWork { get; set; }
        public AuthoriseService Create(string loginuser)
        {
            if (loginuser == "System")
            {
                return AuthService;
            }
            else
            {
                AuthoriseService.User = _unitWork.FindSingle<User>(u => u.Account == loginuser);
                return AuthoriseService;
            }
        }

        public UserWithAccessedCtrls GetAccessedControls(string username)
        {
            var service = Create(username);
            var user = new UserWithAccessedCtrls
            {
                User = service.User,
                Orgs = service.Orgs,
                Modules = service.Modules.OrderBy(u => u.SortNo).ToList().MapToList<ModuleView>(),
                Resources = service.Resources,
                Roles = service.Roles
            };

            foreach (var moduleView in user.Modules)
            {
                moduleView.Elements =
                    service.ModuleElements.Where(u => u.ModuleId == moduleView.Id).OrderBy(u => u.Sort).ToList();
            }
            
            return user;
        }
    }
}