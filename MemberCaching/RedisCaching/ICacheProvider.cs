using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RedisCaching
{
    public interface ICacheProvider
    {
        T GetAppSettings<T>(string key) where T : class, new();
        bool _isUseRedis();
        string _connectionString();
        string _instanceName();
    }
}
