using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.IDal
{
    public interface IMyuserBllSer
    {
        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="usr">用户名</param>
        /// <param name="pwd">密码</param>
        /// <param name="DoMain">域名或端口</param>
        /// <returns>会员资料实体</returns>
        Task<ResultModel> Login(string UserCode,string Password,Myuser user);
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        Task<ResultModel> ModifyPassword(Guid UserGUID, string OldPassword, string newPassword);
        /// <summary>
        /// 重置密码
        /// </summary>
        /// <param name="Id">用户id</param>
        /// <param name="Pwd">密码</param>
        /// <returns></returns>
        Task<ResultModel> ResetPassword(Guid UserGUID, string Password);
        /// <summary>
        /// 启用停用
        /// </summary>
        /// <param name="Id">用户ID</param>
        /// <returns></returns>
        Task<ResultModel> ActivateUser(Guid UserGUID);
    }
}
