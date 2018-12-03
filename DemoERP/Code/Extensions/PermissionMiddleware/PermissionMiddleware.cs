using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Extensions.PermissionMiddleware
{
    /// <summary>
    /// 权限中间件
    /// </summary>
    public class PermissionMiddleware
    {
        /// <summary>
        /// 管道代理对象
        /// </summary>
        private readonly RequestDelegate _next;
        /// <summary>
        /// 权限中间件的配置选项
        /// </summary>
        private readonly PermissionMiddlewareOption _option;

        /// <summary>
        /// 用户权限集合
        /// </summary>
        internal static IList<UserPermission> _userPermissions;

        /// <summary>
        /// 权限中间件构造
        /// </summary>
        /// <param name="next">管道代理对象</param>
        /// <param name="permissionResitory">权限仓储对象</param>
        /// <param name="option">权限中间件配置选项</param>
        public PermissionMiddleware(RequestDelegate next, PermissionMiddlewareOption option)
        {
            _next = next;
            _option = option;
            _userPermissions = option.UserPerssions;
        }

        /// <summary>
        /// 调用管道
        /// </summary>
        /// <param name="context">请求上下文</param>
        /// <returns></returns>
        public Task Invoke(HttpContext context)
        {
            //请求Url
            string questUrl = context.Request.Path.Value.ToLower();

            //是否经过验证
            bool isAuthenticated = context.User.Identity.IsAuthenticated;
            if (isAuthenticated)
            {
                if(_userPermissions.GroupBy(g=>g.Url).Where(w=>w.Key.ToLower()==questUrl).Count()>0)
                {
                    //用户名
                    string userCode =context.User.Claims.SingleOrDefault(s => s.Type == ClaimTypes.Sid).Value;

                    if(_userPermissions.Where(w=>w.UserCode== userCode && w.Url.ToLower()==questUrl).Count()>0)
                    {
                        return _next(context);
                    }
                    else
                    {
                        //无权限跳转到拒绝页面
                        context.Response.Redirect(_option.NoPermissionAction);
                    }
                }
            }
            return _next(context);
        }
    }
}
