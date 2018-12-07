using IDal.Common;
using IDal.User;
using Model;
using Model.User;
using System;
using System.Threading.Tasks;
using IDal.Aop;
using DataContext.Log;
using DataContext.Cache;
using System.Data.SqlClient;
using System.Data;
using IDal.Aop.ILog;
using DataContext;
using Microsoft.EntityFrameworkCore;
using IHelperService.Aop;
using IHelperService.Helper;

namespace SqlServerDal.User
{
    public class MyuserBllSer : IMyuserBllSer, ILogging
    {
        public ISqlHelperSer _sqlHelper;
        public IGetHelperSer _getHelper;
        public MyDataContext _dbContext;

        public MyuserBllSer(ISqlHelperSer sqlHelper, IGetHelperSer getHelper, MyDataContext dbContext)
        {
            _sqlHelper = sqlHelper;
            _getHelper = getHelper;
            _dbContext = dbContext;
        }

        public Task<ResultModel> ActivateUser(Guid UserGUID)
        {
            throw new NotImplementedException();
        }

        [Logging(CheckException =true)]
        public async Task<ResultModel> Login(string UserCode, string Password, Myuser myuser)
        {
            ResultModel result = new ResultModel();
            Myuser user = null;
            try
            {
                user = await _dbContext.Myusers
                .FirstOrDefaultAsync(m => m.UserCode == UserCode);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            if (user == null || user.UserGUID == Guid.Empty)
            {
                result.State = 1;
                result.Message = "该用户不存在!";
            }
            else if (user.IsForbidden == 1)
            {
                result.State = 1;
                result.Message = "该用户已被停用，请与管理员联系!";
            }
            else if (Password != _getHelper.AESDecrypt(user.UserPassword, user.UserGUID.ToString("N")))
            {
                result.State = 1;
                result.Message = "密码错误!";
            }
            else
            {
                result.State = 0;
                result.Message = "登录成功!";
                myuser.UserGUID = user.UserGUID;
                myuser.UserName = user.UserName;
            }
            return result;
        }

        public Task<ResultModel> ModifyPassword(Guid UserGUID, string OldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public Task<ResultModel> ResetPassword(Guid UserGUID, string Password)
        {
            throw new NotImplementedException();
        }

        public Myuser GetUserByUserCode(string UserCode)
        {
            SqlParameter[] parameters = {
                new SqlParameter("@Options",SqlDbType.VarChar),
                new SqlParameter("@UserCode",SqlDbType.VarChar),
            };
            parameters[0].Value = "GetUserByUserCode";
            parameters[1].Value = UserCode;
            return _sqlHelper.ExecuteToModel<Myuser>("Sp_User", parameters);
        }
    }
}
