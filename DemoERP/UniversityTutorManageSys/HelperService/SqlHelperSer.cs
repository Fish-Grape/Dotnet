using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using UniversityTutorManageSys.Factory;
using UniversityTutorManageSys.IDal;

namespace UniversityTutorManageSys.HelperService
{
    public class SqlHelperSer : ISqlHelperSer
    {
        private SqlConnection SqlDrConn = null;//连接对象
        public SqlHelperSer()
        {
            SqlDrConn = new SqlConnection(CommonUISer.Config.ConnectionStrings);//连接字符串
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
            throw new NotImplementedException();
        }

        public DataSet ExecuteDataSet(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            throw new NotImplementedException();
        }

        public DataTable ExecuteDataTable(string sql, ConnctionType t = ConnctionType.ReadOnly)
        {
            throw new NotImplementedException();
        }

        public DataTable ExecuteDataTable(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            throw new NotImplementedException();
        }

        public SqlDataReader ExecuteReader(string sql, ConnctionType t = ConnctionType.ReadOnly)
        {
            throw new NotImplementedException();
        }

        public SqlDataReader ExecuteReader(string storedProcName, SqlParameter[] commandParameters, ConnctionType t = ConnctionType.ReadOnly)
        {
            throw new NotImplementedException();
        }

        public int ExecuteReturnValue(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite)
        {
            throw new NotImplementedException();
        }

        public int ExecuteRowNumber(string strSql, ConnctionType t = ConnctionType.ReadWrite)
        {
            throw new NotImplementedException();
        }

        public int ExecuteRowNumber(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadWrite)
        {
            throw new NotImplementedException();
        }

        public IList<T> ExecuteSqlToList<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            if (SqlDrConn.State == ConnectionState.Open)
                SqlDrConn.Close();
            try
            {
                SqlDrConn.Open();
                SqlCommand cmd = new SqlCommand(sql, SqlDrConn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader != null)
                {
                    return ConvertToList<T>(reader.GetSchemaTable());
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

        public T ExecuteSqlToModel<T>(string sql, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            if (SqlDrConn.State == ConnectionState.Open)
                SqlDrConn.Close();
            try
            {
                SqlDrConn.Open();
                SqlCommand cmd = new SqlCommand(sql, SqlDrConn);
                var result = cmd.ExecuteScalar();
                if (result != null)
                    return (T)result;
                return default(T);
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

        public IList<T> ExecuteToList<T>(SqlDataReader sqlDataReader) where T : new()
        {
            throw new NotImplementedException();
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
            if (SqlDrConn.State == ConnectionState.Open)
                SqlDrConn.Close();
            try
            {
                SqlDrConn.Open();
                SqlCommand cmd = new SqlCommand(storedProcName, SqlDrConn);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach(SqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt != null)
                {
                    return ConvertToList<T>(dt);
                }
                return null;
            }
            catch (Exception ex)
            {
                NLoggerFactory.SingletonLogger.Info(ex.Message);
                throw ex;
            }
            finally
            {
                SqlDrConn.Close();
            }
        }

        public T ExecuteToModel<T>(string storedProcName, IDataParameter[] parameters, ConnctionType t = ConnctionType.ReadOnly) where T : new()
        {
            throw new NotImplementedException();
        }

        public string GetConnectionString(ConnctionType t)
        {
            throw new NotImplementedException();
        }

    }
}
