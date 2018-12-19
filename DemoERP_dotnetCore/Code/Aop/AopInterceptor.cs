using Castle.DynamicProxy;
using IDal.Aop.ICache;
using IDal.Aop.ILog;

namespace HelperService.Aop
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
            _qCachingInterceptor.Intercept(invocation);
            _logging.Intercept(invocation);
        }
    }
}