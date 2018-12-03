using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RedisCaching
{
    public class RedisConfiguration
    {
        public bool IsUseRedis { get; set; }
        public string ConnectionString { get; set; }
        public string InstanceName { get; set; }
    }
}
