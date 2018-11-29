using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Linq;
using System.Security.Claims;
using UniversityTutorManageSys.Extensions;
using UniversityTutorManageSys.IDal;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.HelperService
{
    public class CommonUISer : ICommonUISer
    {
        public IGetHelperSer _helperSer;

        public CommonUISer(IGetHelperSer helperSer)
        {
            _helperSer = helperSer;
        }

        public class Config {
            #region Properties
            public static string WebSiteName => GetAppSettings<ConfigPara>("WebSiteName").WebSiteName;
            public static string UploadFilePath => GetAppSettings<ConfigPara>("UpFilesPath").UploadFilePath;
            public static string UploadImagePath => GetAppSettings<ConfigPara>("UpFilesPath").UploadImagePath;
            public static string ConnectionStrings => GetAppSettings<ConfigPara>("ConnectionStrings").DefaultConnection;
            #endregion


            public static T GetAppSettings<T>(string key) where T : class, new()
            {
                IConfiguration config = new ConfigurationBuilder().
                    Add(new JsonConfigurationSource { Path = "appsettings.json", ReloadOnChange = true }).
                    Build();
                var appconfig = new ServiceCollection().
                    AddOptions()
                    .Configure<T>(config.GetSection(key))
                    .BuildServiceProvider()
                    .GetService<IOptions<T>>()
                    .Value;
                return appconfig;
            }
        }


        public Myuser getMyuser()
        {
            Myuser myuser = _helperSer.GetSession<Myuser>("login_code");
            if (myuser == null)
            {
                myuser = new Myuser();
                myuser.UserGUID =new Guid(MyHttpContext.Current.User.Claims.SingleOrDefault(s => s.Type == ClaimTypes.NameIdentifier).Value);
                myuser.UserCode=MyHttpContext.Current.User.Claims.SingleOrDefault(s=>s.Type== ClaimTypes.Sid).Value;
                myuser.UserName= MyHttpContext.Current.User.Claims.SingleOrDefault(s => s.Type == ClaimTypes.Name).Value;
            }
            return myuser;
        }

        public void SaveUser(Myuser user,bool remember)
        {
            _helperSer.SetSession("login_code", user);
            _helperSer.SaveCookie(CookieAuthenticationDefaults.AuthenticationScheme, user, 20);
        }

        public string WebSiteName()
        {
            return Config.GetAppSettings<ConfigPara>("WebSiteName").WebSiteName;
        }

        public void removeUser()
        {
            _helperSer.RemoveSession("login_code");
            _helperSer.RemoveCookie(CookieAuthenticationDefaults.AuthenticationScheme);
        }
    }
}
