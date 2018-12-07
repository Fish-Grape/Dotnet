using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace IHelperService.Common
{
    public interface  ISqlHelperSer
    {
          List<T> ConvertToList<T>(DataTable dt) where T : new();
          DataSet ExecuteDataSet(string Sql, ConnctionType t = ConnctionType.ReadOnly);
          DataSet ExecuteDataSet(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly);
          DataTable ExecuteDataTable(string sql, ConnctionType t = ConnctionType.ReadOnly);
          DataTable ExecuteDataTable(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly);
          SqlDataReader ExecuteReader(string sql, ConnctionType t = ConnctionType.ReadOnly);
          SqlDataReader ExecuteReader(string storedProcName, SqlParameter[] commandParameters, ConnctionType t = ConnctionType.ReadOnly);
          int ExecuteReturnValue(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite);
          int ExecuteRowNumber(string strSql, ConnctionType t = ConnctionType.ReadWrite);
          int ExecuteRowNumber(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite);
          IList<T> ExecuteSqlToList<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new();
          T ExecuteSqlToModel<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new();
          IList<T> ExecuteToList<T>(SqlDataReader sqlDataReader) where T : new();
          IList<T> ExecuteToList<T>(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly) where T : new();
          T ExecuteToModel<T>(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly) where T : new();
         string GetConnectionString(ConnctionType t);
    }
    public enum ConnctionType
    {
        ReadOnly = 0,
        ReadWrite = 1,
        Log = 2,
    }
}
