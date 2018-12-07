using Castle.DynamicProxy;
using DataContext.Log;
using IDal.Aop.ILog;
using NLog;
using System;
using System.Linq;
using System.Reflection;
using System.Threading;

namespace HelperService.Aop.Log
{
    public class LoggingInterceptorSer : ILoggingInterceptorSer
    {
        private Logger _logger;

        /// <summary>
        /// 获取单例Logger
        /// </summary>
        public Logger SingletonLogger
        {
            get
            {
                if (_logger == null)
                    Interlocked.CompareExchange(ref _logger, LogManager.GetCurrentClassLogger(), null);
                return _logger;
            }
        }

        public void Intercept(IInvocation invocation)
        {
            LoggingAttribute loggingAttribute = GetLoggingAttributeInfo<LoggingAttribute>(invocation);
            if (loggingAttribute==null || loggingAttribute.CheckException)
            {
                ProceedCaching(invocation, loggingAttribute);
            }
            else
            {
                invocation.Proceed();
            }
        }

        public T GetLoggingAttributeInfo<T>(IInvocation invocation) where T : class
        {
            MethodInfo method = invocation.MethodInvocationTarget ?? invocation.Method;
            return method.GetCustomAttributes(true).FirstOrDefault(x => x.GetType() == typeof(T)) as T;
        }

        public void ProceedCaching<T>(IInvocation invocation, T attribute) where T : class
        {
            try
            {
                invocation.Proceed();
            }
            catch (Exception ex)
            {
                invocation.ReturnValue = GetDefaultValue(invocation.Method.ReturnType);
                SingletonLogger.Error(string.Format("你正在调用方法 \"{0}\"  参数是 {1}...",
       invocation.Method.Name, invocation.Arguments.Select(a => (a ?? "").ToString()).ToArray()));
                SingletonLogger.Error("[Begin]========================出现异常，请及时处理!=====================================");
                SingletonLogger.Error(ex.Message);
                SingletonLogger.Error("[End]========================出现异常，请及时处理!=======================================");
                SingletonLogger.Error(string.Format("方法执行完毕，返回结果：{0}",
    invocation.ReturnValue));
                SingletonLogger.Error("\n");
                SingletonLogger.Error("\n");
                SingletonLogger.Error("\n");
            }
        }

        /// <summary>
        /// 获取变量的默认值
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public object GetDefaultValue(Type type)
        {
            return type.IsValueType ? Activator.CreateInstance(type) : null;
        }
    }
}