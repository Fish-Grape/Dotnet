using System;
using System.Collections.Generic;
using System.Text;

namespace DataContext.Cache
{
    [AttributeUsage(AttributeTargets.Method,Inherited =true)]
    public class QCachingAttribute:Attribute
    {
        //绝对过期时间（天）
        public int AbsoluteExpiration { set; get; } = 1;

    }
}