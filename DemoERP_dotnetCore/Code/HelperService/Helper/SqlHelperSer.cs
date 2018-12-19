using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using DataContext.Cache;
using IHelperService.Aop;
using IHelperService.Config;
using IHelperService.Helper;
using Newtonsoft.Json;

namespace HelperService.Helper
{
    public class SqlHelperSer : ISqlHelperSer, IQCaching

    {
        private SqlConnection SqlDrConn = null;//连接对象

        public SqlHelperSer(IConfigSer config)
        {
            SqlDrConn = new SqlConnection(config.SQLConnectionStrings);//连接字符串
        }

        /// <summary>
        /// DataSetToList
        /// </summary>
        /// <typeparam name="T">转换类型</typeparam>
        /// <param name="DataTable">数据源</param>
        /// <returns></returns>
        public List<T> ConvertToList<T>(DataTable dt) where T : new()
        {
            //确认参数有效
            if (dt == null || dt.Rows.Count <= 0 )
                return null;

            List<T> list = new List<T>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //创建泛型对象
                T _t = Activator.CreateInstance<T>();
                //获取对象所有属性
                PropertyInfo[] propertyInfo = _t.GetType().GetProperties();
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    foreach (PropertyInfo info in propertyInfo)
                    {
                        //属性名称和列名相同时赋值
                        if (dt.Columns[j].ColumnName.ToUpper().Equals(info.Name.ToUpper()))
                        {
                            if (dt.Rows[i][j] != DBNull.Value)
                            {
                                info.SetValue(_t, dt.Rows[i][j], null);
                            }
                            else
                            {
                                info.SetValue(_t, null, null);
                            }
                            break;
                        }
                    }
                }
                list.Add(_t);
            }
            return list;
        }

        public DataSet ExecuteDataSet(string Sql, ConnctionType t = ConnctionType.ReadOnly)
        {
            return ExecuteDataSet(Sql, null, t);
        }

        public DataSet ExecuteDataSet(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            if (SqlDrConn.State == ConnectionState.Open)
                SqlDrConn.Close();
            try
            {
                SqlDrConn.Open();
                SqlCommand cmd = new SqlCommand(storedProcName, SqlDrConn);
                cmd.Parameters.Clear();
                foreach (IDataParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                if (parameters == null)
                    cmd.CommandType = CommandType.Text;
                else
                    cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                if (dataSet != null && dataSet.Tables.Count !=0)
                {
                    return dataSet;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                SqlDrConn.Close();
            }
        }
        public DataTable ExecuteDataTable(string sql, ConnctionType t = ConnctionType.ReadOnly)
        {
            return ExecuteDataTable(sql, t);
        }
        public DataTable ExecuteDataTable(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            DataSet data=ExecuteDataSet(storedProcName,parameters,t);
            if (data != null && data.Tables.Count != 0)
                return data.Tables[0];
            return null;
        }
        [QCaching(AbsoluteExpiration = 1)]
        public string ExecuteToString(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite)
        {
            DataTable dataTable = ExecuteDataTable(storedProcName, parameters, t);
            if (dataTable != null)
                return JsonConvert.SerializeObject(dataTable);
            return null;
        }
        [QCaching(AbsoluteExpiration = 1)]
        public string ExecuteToString(string storedProcName, ConnctionType t = ConnctionType.ReadWrite)
        {
            DataTable dataTable = ExecuteDataTable(storedProcName, null, t);
            if (dataTable != null)
                return JsonConvert.SerializeObject(dataTable);
            return null;
        }

        public SqlDataReader ExecuteReader(string sql, ConnctionType t = ConnctionType.ReadOnly)
        {
            return ExecuteReader(sql,null,t);
        }

        public SqlDataReader ExecuteReader(string storedProcName, SqlParameter[] commandParameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            if (SqlDrConn.State == ConnectionState.Open)
                SqlDrConn.Close();
            try
            {
                SqlDrConn.Open();
                SqlCommand cmd = new SqlCommand(storedProcName, SqlDrConn);
                cmd.Parameters.Clear();
                foreach (SqlParameter parameter in commandParameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                if (commandParameters == null)
                    cmd.CommandType = CommandType.Text;
                else
                    cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader=cmd.ExecuteReader();
                if (reader != null)
                {
                    return reader;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                SqlDrConn.Close();
            }
        }
        [QCaching(AbsoluteExpiration = 1)]
        public int ExecuteReturnValue(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite)
        {
           DataTable dataTable= ExecuteDataTable(storedProcName, parameters, t);
            if (dataTable != null)
                return (int)dataTable.Rows[0][0];
            return 0;
        }
        [QCaching(AbsoluteExpiration = 1)]
        public int ExecuteRowNumber(string strSql, ConnctionType t = ConnctionType.ReadWrite)
        {
            DataTable dataTable = ExecuteDataTable(strSql, t);
            if (dataTable != null)
                return dataTable.Rows.Count;
            return 0;
        }
        [QCaching(AbsoluteExpiration = 1)]
        public int ExecuteRowNumber(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite)
        {
            DataTable dataTable = ExecuteDataTable(storedProcName, parameters, t);
            if (dataTable != null)
                return dataTable.Rows.Count;
            return 0;
        }

        public IList<T> ExecuteSqlToList<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            return ExecuteToList<T>(sql, null, t);
        }

        public T ExecuteSqlToModel<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            return ExecuteToModel<T>(sql, null, t);
        }

        public IList<T> ExecuteToList<T>(SqlDataReader sqlDataReader) where T : new()
        {
            if (sqlDataReader != null)
                ConvertToList<T>(sqlDataReader.GetSchemaTable());
            return null;
        }

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <param name="t"></param>
        /// <returns></returns>
        public IList<T> ExecuteToList<T>(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            DataTable dt=ExecuteDataTable(storedProcName, parameters, t);
            if (dt != null)
            {
                return ConvertToList<T>(dt);
            }
            return null;
        }

        public T ExecuteToModel<T>(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            IList<T> result = ExecuteToList<T>(storedProcName, parameters, t);
            if (result != null)
                return result[0];
            else
                return default(T);
        }

        public string GetConnectionString(ConnctionType t)
        {
            throw new NotImplementedException();
        }

    }
}
