﻿using System;
using System.Data.Entity.Core;
using System.Web.Http;
using Infrastructure;
using Infrastructure.Cache;
using OpenAuth.App;
using OpenAuth.App.SSO;
using OpenAuth.App.Response;

namespace OpenAuth.WebApi.Areas.SSO.Controllers
{
    /// <summary>
    ///  sso验证
    /// <para>其他站点通过后台Post来认证</para>
    /// <para>或使用静态类OpenAuth.App.SSO.AuthUtil访问</para>
    /// </summary>
    public class CheckController : ApiController
    {
        public AuthorizeApp _app { get; set; }
        private ObjCacheProvider<UserAuthSession> _objCacheProvider = new ObjCacheProvider<UserAuthSession>();

        /// <summary>
        /// 检验token是否有效
        /// </summary>
        /// <param name="token">The token.</param>
        /// <param name="requestid">备用参数.</param>
        [System.Web.Mvc.HttpGet]
        public Response<bool> GetStatus(string token, string requestid = "")
        {
            var result = new Response<bool>();
            try
            {
                result.Result = _objCacheProvider.GetCache(token) != null;
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 根据token获取用户及用户可访问的所有资源
        /// </summary>
        /// <param name="token"></param>
        /// <param name="requestid">备用参数.</param>
        [System.Web.Mvc.HttpGet]
        public Response<UserWithAccessedCtrls> GetUser(string token, string requestid = "")
        {
            var result = new Response<UserWithAccessedCtrls>();
            try
            {
                var user = _objCacheProvider.GetCache(token);
                if (user != null)
                {
                    result.Result = _app.GetAccessedControls(user.Account);
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException != null
                    ? "OpenAuth.WebAPI数据库访问失败:" + ex.InnerException.Message
                    : "OpenAuth.WebAPI数据库访问失败:" + ex.Message;
            }

            return result;

        }

        /// <summary>
        /// 根据token获取用户名称
        /// </summary>
        /// <param name="token"></param>
        /// <param name="requestid">备用参数.</param>
        [System.Web.Mvc.HttpGet]
        public Response<string> GetUserName(string token, string requestid = "")
        {
            var result = new Response<string>();
            try
            {
                var user = _objCacheProvider.GetCache(token);
                if (user != null)
                {
                    result.Result = user.Account;
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 登录接口
        /// </summary>
        /// <param name="request">登录参数</param>
        /// <returns></returns>
        [System.Web.Mvc.HttpPost]
        public LoginResult Login(PassportLoginRequest request)
        {
            var result = new LoginResult();
            try
            {
                result = SSOAuthUtil.Parse(request);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 注销登录
        /// </summary>
        /// <param name="token"></param>
        /// <param name="requestid">备用参数.</param>
        [System.Web.Mvc.HttpPost]
        public bool Logout(string token, string requestid = "")
        {
            try
            {
                _objCacheProvider.Remove(token);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}