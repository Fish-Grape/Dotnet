using System;
using System.Collections.Generic;
using System.Text;

namespace IDal.Aop.ICache
{
    public interface IQCachable
    {
        string CacheKey { get; }
    }
}