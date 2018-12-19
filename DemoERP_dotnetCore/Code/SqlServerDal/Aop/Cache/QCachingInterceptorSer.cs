using Castle.DynamicProxy;
using DataContext.Cache;
using IDal.Aop.ICache;
using IDal.Common;
using IHelperService.Aop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace SqlServerDal.Aop.Cache
{
    public class QCachingInterceptorSer : IQCachingInterceptorSer
    {
        private ICacheMngSer _cacheMng;
        private char _linkChar = ':';

        public QCachingInterceptorSer(ICacheMngSer cacheMng)
        {
            _cacheMng = cacheMng;
        }

        public void Intercept(IInvocation invocation)
        {
            QCachingAttribute qCachingAttribute = GetQCachingAttributeInfo<QCachingAttribute>(invocation);
            if (qCachingAttribute != null)
            {
                ProceedCaching(invocation, qCachingAttribute);
            }
            else
            {
                invocation.Proceed();
            }
        }

        public T GetQCachingAttributeInfo<T>(IInvocation invocation) where T : class
        {
            MethodInfo method = invocation.MethodInvocationTarget ?? invocation.Method;
            return method.GetCustomAttributes(true).FirstOrDefault(x => x.GetType() == typeof(T)) as T;
        }
        public void ProceedCaching<T>(IInvocation invocation, T attribute) where T : class
        {
            QCachingAttribute attr = attribute as QCachingAttribute;
            string cacheKey = GenerateCacheKey(invocation);
            //从缓存中取出的值一律转换成Json字符串
            string cacheValue = _cacheMng.Get<string>(cacheKey);
            if (cacheValue != null)
            {
                invocation.ReturnValue = cacheValue;
                return;
            }
            invocation.Proceed();
            if (!string.IsNullOrWhiteSpace(cacheKey))
            {
                _cacheMng.Add(cacheKey, invocation.ReturnValue, TimeSpan.FromDays(attr.AbsoluteExpiration), true);
            }
        }
        public string GenerateCacheKey(IInvocation invocation)
        {
            string typeName = invocation.TargetType.Name;
            string methodName = invocation.Method.Name;
            IList<string> methodArguments = FormatArgumentsToPartOfCacheKey(invocation.Arguments);
            return GenerateCacheKey(typeName, methodName, methodArguments);
        }

        public string GenerateCacheKey(string typeName, string methodName, IList<string> parameters)
        {
            var builder = new StringBuilder();
            builder.Append(typeName);
            builder.Append(_linkChar);
            builder.Append(methodName);
            builder.Append(_linkChar);

            foreach (var param in parameters)
            {
                builder.Append(param);
                builder.Append(_linkChar);
            }
            return builder.ToString().TrimEnd(_linkChar);
        }

        public IList<string> FormatArgumentsToPartOfCacheKey(IList<object> methodArguments, int maxCount = 5)
        {
            return methodArguments.Select(GetArgumentValue).Take(maxCount).ToList();
        }

        public string GetArgumentValue(object arg)
        {
            if (arg is int || arg is long || arg is string)
                return arg.ToString();
            if (arg is DateTime)
                return ((DateTime)arg).ToString("yyyy-MM-dd");
            if (arg is IQCachable)
                return ((IQCachable)arg).CacheKey;
            return null;
        }
    }
}