using System;
using System.Collections.Generic;
using System.Text;

namespace Aop.Cache
{
    [AttributeUsage(AttributeTargets.Method,Inherited =true)]
    public class QCachingAttribute:Attribute
    {
        public int AbsoluteExpiration { set; get; } = 1;

    }
}