using System;
using System.Collections.Generic;
using System.Text;

namespace IHelperService.Aop
{
    public interface IQCachable
    {
        string CacheKey { get; }
    }
}