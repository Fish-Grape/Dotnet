using IDal.Common;
using IDal.System;
using Model.System;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SqlServerDal.System
{
    public class MenuSer : IMenuSer
    {
        public ISqlHelperSer _sqlHelper;

        public MenuSer(ISqlHelperSer sqlHelper)
        {
            _sqlHelper = sqlHelper;
        }

        public int Change(MenuModel moMenuModel)
        {
            throw new NotImplementedException();
        }

        public int Delete(Guid MenuGUID)
        {
            throw new NotImplementedException();
        }

        public IList<MenuModel> GetMenuList()
        {
            throw new NotImplementedException();
        }

        public IList<MenuModel> GetMenuListByRightGUID(Guid RightGUID)
        {
            throw new NotImplementedException();
        }

        public IList<MenuModel> GetMenuListByUserGUID(Guid UserGUID)
        {
            SqlParameter[] parameters = {
                new SqlParameter("@Options",SqlDbType.VarChar),
                new SqlParameter("@UserGUID",SqlDbType.UniqueIdentifier)
            };
            parameters[0].Value = "GetMenuListByUserGUID";
            parameters[1].Value = UserGUID;
            return _sqlHelper.ExecuteToList<MenuModel>("SpMenu", parameters);
        }

        public MenuModel GetMenuViewByGUID(Guid GUID)
        {
            throw new NotImplementedException();
        }

        public int Insert(MenuModel moMenuModel)
        {
            throw new NotImplementedException();
        }
    }
}
