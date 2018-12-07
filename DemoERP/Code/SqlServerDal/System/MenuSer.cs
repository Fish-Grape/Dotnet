using IDal.Aop.ILog;
using IDal.Common;
using IDal.System;
using Model.System;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace SqlServerDal.System
{
    public class MenuSer : IMenuSer, ILogging
    {
        public ISqlHelperSer _sqlHelper;
        public IGetHelperSer _getHelper;

        public MenuSer(ISqlHelperSer sqlHelper, IGetHelperSer getHelper)
        {
            _sqlHelper = sqlHelper;
            _getHelper = getHelper;
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
            string result=_sqlHelper.ExecuteToString("SpMenu", parameters);
            return _getHelper.ConvertToList<MenuModel>(result);
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
