using Extensions.SessionExtensions;
using IDal.Common;
using IHelperService.Helper;
using Microsoft.AspNetCore.Authentication.Cookies;
using Model.User;
using System;
using System.Linq;
using System.Security.Claims;


namespace SqlServerDal.Common
{
    public class CommonUISer : ICommonUISer
    {
        public IGetHelperSer _helperSer;

        public CommonUISer(IGetHelperSer helperSer)
        {
            _helperSer = helperSer;
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

        public void removeUser()
        {
            _helperSer.RemoveSession("login_code");
            _helperSer.RemoveCookie(CookieAuthenticationDefaults.AuthenticationScheme);
        }
    }
}
