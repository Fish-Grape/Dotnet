using IDal.User;
using System;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;

namespace Web.Helper
{
    public class ReflectionHelper
    {
        /// <summary>
        /// 反射获取IUserRightSer
        /// </summary>
        /// <returns></returns>
        public IUserRightSer GetUserRightSer()
        {
            Type userRight = GetAssembly("SqlServerDal").GetType("SqlServerDal.User.UserRightSer");
            Type SqlHelperSer = GetAssembly("HelperService").GetType("HelperService.Common.SqlHelperSer");
            Type CacheMngSer = GetAssembly("HelperService").GetType("HelperService.Common.CacheMngSer");
            Type Config = GetAssembly("HelperService").GetType("HelperService.Common.ConfigSer");
            object[] parameters = new object[1];
            parameters[0] = Activator.CreateInstance(Config);
            parameters[0] = Activator.CreateInstance(SqlHelperSer, parameters);
            return (IUserRightSer)Activator.CreateInstance(userRight, parameters);
        }
        /// <summary>
        /// 反射获取指定类型的对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="assemblyName">程序集</param>
        /// <param name="fullName">全类名</param>
        /// <param name="parameters">参数</param>
        /// <returns></returns>
        public object GetObjByReflect(string assemblyName,string fullName, object[] parameters=null)
        {
            Type type = GetAssembly(assemblyName).GetType(fullName);
            if (parameters == null || parameters.Count() == 0)
                return Activator.CreateInstance(type);
            else
                return Activator.CreateInstance(type, parameters);
            //userRight.CreateInstance("SqlServerDal.User.UserRightSer", true, BindingFlags.Default, null, parameters, null, null);
        }

        public Assembly GetAssembly(string assemblyName)
        {
            Assembly assembly = AssemblyLoadContext.Default.LoadFromAssemblyPath(AppContext.BaseDirectory + $"{assemblyName}.dll");
            return assembly;
        }
    }
}
