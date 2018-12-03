using IDal.Common;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Model.Config;

namespace HelperService.Common
{
    public class ConfigSer : IConfigSer
    {
        #region Properties
        public string WebSiteName => GetAppSettings<ConfigPara>("WebSiteName").WebSiteName;
        public string UploadFilePath => GetAppSettings<ConfigPara>("UpFilesPath").UploadFilePath;
        public string UploadImagePath => GetAppSettings<ConfigPara>("UpFilesPath").UploadImagePath;
        public string ConnectionStrings => GetAppSettings<ConfigPara>("ConnectionStrings").DefaultConnection;
        #endregion

        public T GetAppSettings<T>(string key) where T : class, new()
        {
            IConfiguration config = new ConfigurationBuilder().
                Add(new JsonConfigurationSource { Path = "appsettings.json", ReloadOnChange = true }).
                Build();
            var appconfig = new ServiceCollection().
                AddOptions()
                .Configure<T>(config.GetSection(key))
                .BuildServiceProvider()
                .GetService<IOptions<T>>()
                .Value;
            return appconfig;
        }
    }
}