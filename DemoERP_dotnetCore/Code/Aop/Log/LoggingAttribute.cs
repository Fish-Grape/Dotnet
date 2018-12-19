using System;

namespace Aop.Log
{
    [AttributeUsage(AttributeTargets.Method, Inherited = true)]
    public class LoggingAttribute : Attribute
    {

    }
}