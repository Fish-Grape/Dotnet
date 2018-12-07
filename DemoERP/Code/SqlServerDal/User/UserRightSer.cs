using Extensions.PermissionMiddleware;
using IDal.Aop.ILog;
using IDal.Common;
using IDal.User;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace SqlServerDal.User
{
    public class UserRightSer : IUserRightSer,ILogging
    {
        public ISqlHelperSer _sqlHelper;

        public UserRightSer(ISqlHelperSer sqlHelper)
        {
            _sqlHelper = sqlHelper;
        }
        public IList<UserPermission> GetAllUserRight()
        {
            SqlParameter[] parameters = {
                new SqlParameter("@Options",SqlDbType.VarChar)
            };
            parameters[0].Value = "GetAllUserRight";
            return _sqlHelper.ExecuteToList<UserPermission>("Sp_User", parameters);
        }

        public IList<UserPermission> GetUserRightByUserCode(string code)
        {
            throw new NotImplementedException();
        }

        public IList<UserPermission> GetUserRightByUserGUID(Guid UserGUID)
        {
            throw new NotImplementedException();
        }
    }
}
