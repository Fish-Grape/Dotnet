using Castle.DynamicProxy;
using System;
using System.Collections.Generic;
using System.Text;

namespace IDal.Aop.ICache
{
    public interface IQCachingInterceptorSer
    {
        void Intercept(IInvocation invocation);
        T GetQCachingAttributeInfo<T>(IInvocation invocation) where T : class;
        void ProceedCaching<T>(IInvocation invocation, T attribute) where T : class;
        string GenerateCacheKey(IInvocation invocation);
        string GenerateCacheKey(string typeName, string methodName, IList<string> parameters);
        IList<string> FormatArgumentsToPartOfCacheKey(IList<object> methodArguments, int maxCount = 5);
        string GetArgumentValue(object arg);
    }
}