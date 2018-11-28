using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using UniversityTutorManageSys.Data;
using UniversityTutorManageSys.IDal;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.SqlServerDal
{
    public class MyuserBllSer : IMyuserBllSer
    {
        public DataContext _dbContext;
        public IGetHelperSer _getHelper;
        private readonly ILogger<MyuserBllSer> _logger;

        public MyuserBllSer(DataContext dbContext, IGetHelperSer getHelper, ILogger<MyuserBllSer> logger)
        {
            _dbContext = dbContext;
            _getHelper = getHelper;
            _logger = logger;
        }

        public Task<ResultModel> ActivateUser(Guid UserGUID)
        {
            throw new NotImplementedException();
        }

        public async Task<ResultModel> Login(string UserCode, string Password,Myuser myuser)
        {
            ResultModel result = new ResultModel();
            try
            {
                var user = await _dbContext.Myusers
                .FirstOrDefaultAsync(m => m.UserCode == UserCode);
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
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
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
    }
}
