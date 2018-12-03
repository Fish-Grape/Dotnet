using Model.User;
using System;

namespace IDal.Common
{
    public interface IGetHelperSer
    {
        T GetApplication<T>(string strApplicationName, T d);
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
        bool SaveCache(string strCacheName, object obj);
        bool SaveCache(string strCacheName, object obj, DateTime datTimeOut);
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
