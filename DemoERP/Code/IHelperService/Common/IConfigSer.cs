using System;
using System.Collections.Generic;
using System.Text;

namespace IHelperService.Common
{
    public interface IConfigSer
    {
        string WebSiteName { get; }
        string UploadFilePath { get;}
        string UploadImagePath { get; }
        string SQLConnectionStrings { get; }
        string PoolName { get; }
        string ServerList { get; }
        string IsUseRedis { get; }
        string RedisConnectionString { get; }
        string InstanceName { get; }
        T GetAppSettings<T>(string key) where T : class, new();
    }
}