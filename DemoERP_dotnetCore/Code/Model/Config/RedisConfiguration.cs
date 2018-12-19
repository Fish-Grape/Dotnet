using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Config
{
    public class RedisConfiguration
    {
        public bool IsUseRedis { get; set; }
        public string ConnectionString { get; set; }
        public string InstanceName { get; set; }
    }
}