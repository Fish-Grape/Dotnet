using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Autofac;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using UniversityTutorManageSys.Data;
using UniversityTutorManageSys.HelperService;
using UniversityTutorManageSys.IDal;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.Controllers
{
    public class HomeController : BaseController
    {
        public ICommonUISer _commonUI;
        public IVerifyCodeSer _verifyCode;
        public IMyuserBllSer _myuserBll;
        public IGetHelperSer _getHelper;
        public IMenuSer _menuSer;

        public HomeController(ICommonUISer commonUI, IVerifyCodeSer verifyCode, IMyuserBllSer myuserBll, IGetHelperSer getHelper, IMenuSer menuSer)
        {
            _commonUI = commonUI;
            _verifyCode = verifyCode;
            _myuserBll = myuserBll;
            _getHelper = getHelper;
            _menuSer = menuSer;
        }

        #region 页面

        #region 首页

        public ViewResult Index()
        {
            using (var scope = Startup.AutofacContainer.BeginLifetimeScope())
            {
                IConfiguration config = scope.Resolve<IConfiguration>();
                IHostingEnvironment env = scope.Resolve<IHostingEnvironment>();
            }

            ViewBag.Title = CommonUISer.Config.WebSiteName;
            ViewBag.Myuser = _commonUI.getMyuser();

            IList<MenuModel> litMenu = _menuSer.GetMenuListByUserGUID(_commonUI.getMyuser().UserGUID);

            String outMenuHtml = "";
            BandingMenu(litMenu, "0", ref outMenuHtml);
            ViewBag.Menu = outMenuHtml;

            //计算搜索随机搜索背景图
            Random ran = new Random();
            ViewBag.RandKey = ran.Next(1, 4);

            return View();
        }


        #region 绑定菜单
        private void BandingMenu(IList<MenuModel> litMenuModel, string strParentMenuCode, ref String outMenuHtml)
        {
            IList<MenuModel> litMenuModelParent = litMenuModel.Where(n => n.ParentMenuCode == strParentMenuCode).ToList<MenuModel>();
            if (litMenuModelParent.Count() < 1) return;

            foreach (MenuModel mo in litMenuModelParent)
            {
                outMenuHtml += " <li " + ( string.IsNullOrEmpty(mo.ParentMenuCode) ? "class='dropdown '" : "") + ">";
                outMenuHtml += "<a href=\"" + mo.NavigateUrl + "\" " + (string.IsNullOrEmpty(mo.ParentMenuCode) ? "class='dropdown-toggle " + mo.CssClass + "' data-toggle='dropdown'" : "") + ">" + mo.MenuName + "</a>";

                if (litMenuModel.Where(n => n.ParentMenuCode == mo.SystemMenuCode).Count() > 0)
                {
                    outMenuHtml += "<ul class=\"dropdown-menu\" aria-labelledby=\"drop" + mo.SystemMenuCode + "\">";
                    BandingMenu(litMenuModel, mo.SystemMenuCode, ref outMenuHtml);
                    outMenuHtml += "</ul>";
                }
                outMenuHtml += "</li>";
            }
        }
        #endregion


        #endregion

        #region 登陆口

        [AllowAnonymous]
        [HttpGet("login")]
        public ViewResult Login()
        {
            ViewBag.Title = _commonUI.WebSiteName();

            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("/", false);
            }
            return View();
        }
        #endregion

        //#region 退出
        //public ContentResult Quit()
        //{
        //    CommonUI.removeEmployee();
        //    Response.Redirect("/login", false);
        //    return Content("");
        //}
        //#endregion

        #region 登陆验证码
        [AllowAnonymous]
        public IActionResult doVerifyCode()
        {
            string code = "";
            System.IO.MemoryStream ms = _verifyCode.Create(out code, 4);
            HttpContext.Session.SetString("LoginValidateCode", code);
            Response.Body.Dispose();
            return File(ms.ToArray(), @"image/png");
        }
        #endregion

        #endregion


        #region 事件
        [AllowAnonymous]
        [HttpPost]
        public JsonResult dologin(Myuser myuser)
        {
            ResultModel result = new ResultModel();
            int i = (HttpContext.Session.GetInt32("ErrorCount") ?? 0);
            if (i>= 3)
            {
                string code = HttpContext.Session.GetString("LoginValidateCode").ToLower();
                if (code != myuser.Verifycode.ToLower().Trim())
                {
                    result.State = 2;
                    result.Message = "验证码输入错误!";
                    result.IfValidate = true;
                    return Json(result);
                }
            }

            result = _myuserBll.Login(myuser.UserCode, myuser.UserPassword,myuser).Result;
            if (result.State==1)
            {
                HttpContext.Session.SetInt32("ErrorCount", ++i);
                if (i > 2)
                    result.IfValidate = true;
                else
                    result.IfValidate = false;
            }

            if (result.State == 0)
            {
                HttpContext.Session.Remove("LoginValidateCode");
                HttpContext.Session.Remove("ErrorCount");
                _commonUI.SaveUser(myuser, myuser.Remember==null ? false: true);
                string returnUrl = TempData["returnUrl"]?.ToString();
                if (returnUrl != null)
                {
                    Redirect(returnUrl);
                }
                else
                {
                    RedirectToAction(nameof(HomeController.Index), "Home");
                }
            }
            return Json(result);
        }

        #endregion

        [HttpGet("denied")]
        public IActionResult Denied()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
