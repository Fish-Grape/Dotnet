using System;

namespace DataContext.Log
{
    [AttributeUsage(AttributeTargets.Method, Inherited = true)]
    public class LoggingAttribute : Attribute
    {
        /// <summary>
        /// 是否检查异常，false则不记录
        /// </summary>
        public bool CheckException { set; get; } = true;
    }
}