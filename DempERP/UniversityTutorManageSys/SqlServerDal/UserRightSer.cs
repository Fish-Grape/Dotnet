using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UniversityTutorManageSys.IDal;
using UniversityTutorManageSys.PermissionMiddleware;

namespace UniversityTutorManageSys.SqlServerDal
{
    public class UserRightSer : IUserRightSer
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
            return _sqlHelper.ExecuteToList<UserPermission>("Sp_UserRight", parameters);
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
