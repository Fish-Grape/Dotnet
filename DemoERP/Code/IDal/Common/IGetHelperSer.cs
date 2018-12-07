using Model.User;
using NLog;
using System;
using System.Collections.Generic;

namespace IDal.Common
{
    public interface IGetHelperSer
    {
        Logger SingletonLogger { get; }
        /// <summary>
        /// DataSetToList
        /// </summary>
        /// <typeparam name="T">转换类型</typeparam>
        /// <param name="DataTable">数据源</param>
        /// <returns></returns>
        IList<T> ConvertToList<T>(string jsonString);
        T GetApplication<T>(string strApplicationName, T d);
        /// <summary>
        /// 系统自带缓存
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="strCacheName"></param>
        /// <param name="d"></param>
        /// <returns></returns>
        T GetCache<T>(string strCacheName, T d);
        String GetCookies(string strCookeName);
        T GetCookies<T>(string strCookeName, T d);
        T GetCookies<T>(string strCookeName, string strDoMain, T d);
        T GetRequest<T>(string strRequestName, T d);
        T GetSession<T>(string strSessionName);
        void SetSession<T>(string strSessionName, T d);
        void RemoveCookie(string strCookeName);
        void RemoveCookie(string strCookeName, string strDoMain);
        void RemoveSession(string strSessionName);
        /// <summary>
        /// 系统自带缓存
        /// </summary>
        /// <param name="strCacheName"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        bool SaveCache(string strCacheName, object obj);
        /// <summary>
        /// 系统自带缓存
        /// </summary>
        /// <param name="strCacheName"></param>
        /// <param name="obj"></param>
        /// <param name="datTimeOut"></param>
        /// <returns></returns>
        bool SaveCache(string strCacheName, object obj, DateTime datTimeOut);
        /// <summary>
        /// 系统自带缓存
        /// </summary>
        /// <param name="strCacheName"></param>
        /// <param name="obj"></param>
        /// <param name="datTimeOut"></param>
        /// <param name="strTableName"></param>
        /// <returns></returns>
        bool SaveCache(string strCacheName, object obj, DateTime datTimeOut, string strTableName);
        bool SaveCookie(object obobject, int intTimeDayOut);
        bool SaveCookie(string strCookeName, Myuser obobject, int intTimeDayOut);
        bool SaveCookie(string strCookeName, object obobject, int intTimeOut, string strDomain);
        /// <summary>
        /// 加密AES
        /// </summary>
        /// <param name="input"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        string AESEncrypt(string input, string key);
        /// <summary>
        /// 解密AES
        /// </summary>
        /// <param name="input"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        string AESDecrypt(string input, string key);
    }
}
