using System;
using System.Collections.Generic;
using System.Text;

namespace IDal.Common
{
    public interface IConfigSer
    {
        string WebSiteName { get; }
        string UploadFilePath { get;}
        string UploadImagePath { get; }
        string ConnectionStrings { get; }
        T GetAppSettings<T>(string key) where T : class, new();
    }
}