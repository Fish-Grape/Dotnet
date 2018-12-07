using Castle.DynamicProxy;
using IDal.Aop.ICache;
using IDal.Aop.ILog;
using System;

namespace Web.Aop
{
    public class AopInterceptor : IInterceptor
    {
        public IQCachingInterceptorSer _qCachingInterceptor;
        public ILoggingInterceptorSer _logging;

        public AopInterceptor(IQCachingInterceptorSer qCachingInterceptor, ILoggingInterceptorSer logging)
        {
            _qCachingInterceptor = qCachingInterceptor;
            _logging = logging;
        }

        public void Intercept(IInvocation invocation)
        {
            Type[] types=invocation.TargetType.GetInterfaces();
            foreach(Type t in types)
            {
                switch (t.Name)
                {
                    case "ILogging":
                        _logging.Intercept(invocation);
                        return;
                    case "IQCaching":
                        _qCachingInterceptor.Intercept(invocation);
                        return;
                }
            }
        }
    }
}