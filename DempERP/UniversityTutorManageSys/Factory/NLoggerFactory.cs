using Microsoft.Extensions.Logging;
using NLog;
using System.Threading;

namespace UniversityTutorManageSys.Factory
{
    public class NLoggerFactory
    {
        private NLoggerFactory()
        {

        }
        private static Logger _logger;
        /// <summary>
        /// 获取单例Logger
        /// </summary>
        public static Logger SingletonLogger
        {
            get{
                if(_logger==null)
                    Interlocked.CompareExchange(ref _logger, LogManager.GetCurrentClassLogger(), null);
                return _logger;
            }
        }
    }
}
