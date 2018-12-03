using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Extensions.PermissionMiddleware
{
    /// <summary>
    /// 用户权限
    /// </summary>
    public class UserPermission
    {
        /// <summary>
        /// 用户名
        /// </summary>
        public string UserCode
        { get; set; }
        /// <summary>
        /// 请求Url
        /// </summary>
        public string Url
        { get; set; }
    }
}
