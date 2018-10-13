using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RedisCaching
{
    public class CacheProvider : ICacheProvider
    {
        public T GetAppSettings<T>(string key) where T: class,new()
        {
            IConfiguration config = new ConfigurationBuilder().
                Add(new JsonConfigurationSource { Path= "siteconfig.json", ReloadOnChange=true}).
                Build();
            var appconfig = new ServiceCollection().
                AddOptions()
                .Configure<T>(config.GetSection(key))
                .BuildServiceProvider()
                .GetService<IOptions<T>>()
                .Value;
            return appconfig;
        }

        public bool _isUseRedis()
        {
            return GetAppSettings<RedisConfiguration>("CacheProvider").IsUseRedis;
        }

        public string _connectionString()
        {
            return GetAppSettings<RedisConfiguration>("CacheProvider").ConnectionString;
        }
        public string _instanceName()
        {
            return GetAppSettings<RedisConfiguration>("CacheProvider").InstanceName;
        }
    }
}
