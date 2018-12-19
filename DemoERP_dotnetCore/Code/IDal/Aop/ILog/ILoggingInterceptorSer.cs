using Castle.DynamicProxy;
using NLog;
using System;
using System.Collections.Generic;
using System.Text;

namespace IDal.Aop.ILog
{
    public interface ILoggingInterceptorSer
    {
        Logger SingletonLogger { get; }
        void Intercept(IInvocation invocation);
        T GetLoggingAttributeInfo<T>(IInvocation invocation) where T : class;
        void ProceedCaching<T>(IInvocation invocation, T attribute) where T : class;
    }
}