using Microsoft.AspNetCore.Authentication;
using System;
using System.Security.Claims;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Linq;
using Newtonsoft.Json;
using IDal.Common;
using Extensions.SessionExtensions;
using Model.User;
using System.Threading;
using NLog;

namespace HelperService.Common
{
    public class GetHelperSer : IGetHelperSer
    {
        private static Logger _logger;
        /// <summary>
        /// 获取单例Logger
        /// </summary>
        public static Logger SingletonLogger
        {
            get
            {
                if (_logger == null)
                    Interlocked.CompareExchange(ref _logger, LogManager.GetCurrentClassLogger(), null);
                return _logger;
            }
        }

        public T GetApplication<T>(string strApplicationName, T d)
        {
            throw new NotImplementedException();
        }

        public T GetCache<T>(string strCacheName, T d)
        {
            throw new NotImplementedException();
        }

        public T GetCookies<T>(string strCookeName, T d)
        {
            try
            {
                Type type = typeof(T);
                var Properties = type.GetProperties();
                string value = string.Empty;
                foreach (var pro in Properties)
                {
                    MyHttpContext.Current.Request.Cookies.TryGetValue(pro.Name, out value);
                    if (!string.IsNullOrEmpty(value))
                        pro.SetValue(d, value);
                }
            }catch(ArgumentNullException ex)
            {
                SingletonLogger.Info(ex.Message);
            }
            return d;
        }

        public T GetCookies<T>(string strCookeName, string strDoMain, T d)
        {
            throw new NotImplementedException();
        }

        public string GetCookies(string strCookeName)
        {
            string value = string.Empty;
                MyHttpContext.Current.Request.Cookies.TryGetValue(strCookeName, out value);
            return value;
        }

        public T GetRequest<T>(string strRequestName, T d)
        {
            String val=MyHttpContext.Current.Request.Query[strRequestName].FirstOrDefault();
            if (string.IsNullOrEmpty(val))
                return default(T);
            else
                return JsonConvert.DeserializeObject<T>(val);
        }

        public T GetSession<T>(string strSessionName)
        {
            T t=MyHttpContext.Current.Session.GetObject<T>(strSessionName);
            if (t == null)
                return default(T);
            else
                return t;
        }

        public void SetSession<T>(string strSessionName, T d)
        {
            //保存session
            MyHttpContext.Current.Session.SetObject(strSessionName, d);
        }

        public void RemoveCookie(string strCookeName)
        {
            MyHttpContext.Current.SignOutAsync();
        }

        public void RemoveCookie(string strCookeName, string strDoMain)
        {
            throw new NotImplementedException();
        }

        public void RemoveSession(string strSessionName)
        {
            MyHttpContext.Current.Session.Remove(strSessionName);
        }

        public bool SaveCache(string strCacheName, object obj)
        {
            throw new NotImplementedException();
        }

        public bool SaveCache(string strCacheName, object obj, DateTime datTimeOut)
        {
            throw new NotImplementedException();
        }

        public bool SaveCache(string strCacheName, object obj, DateTime datTimeOut, string strTableName)
        {
            throw new NotImplementedException();
        }

        public bool SaveCookie(string strCookeName, Myuser myuser, int intTimeDayOut)
        {
            if (myuser == null)
                return false;
            ClaimsIdentity identity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme);
            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, myuser.UserGUID.ToString()));
            identity.AddClaim(new Claim(ClaimTypes.Sid,myuser.UserCode));
            identity.AddClaim(new Claim(ClaimTypes.Name, myuser.UserName));
            ClaimsPrincipal principal = new ClaimsPrincipal(identity);
            MyHttpContext.Current.SignInAsync(
                  strCookeName,
                  principal,
                  new AuthenticationProperties
                  {
                      ExpiresUtc = DateTime.UtcNow.AddMinutes(intTimeDayOut)
                  });
            return true;
        }

        public bool SaveCookie(string strCookeName, object obobject, int intTimeOut, string strDomain)
        {
            throw new NotImplementedException();
        }

        public bool SaveCookie(object obobject, int intTimeDayOut)
        {
            throw new NotImplementedException();
        }

        public string AESEncrypt(string input, string key)
        {
            var encryptKey = Encoding.UTF8.GetBytes(key);

            using (var aesAlg = Aes.Create())
            {
                using (var encryptor = aesAlg.CreateEncryptor(encryptKey, aesAlg.IV))
                {
                    using (var msEncrypt = new MemoryStream())
                    {
                        using (var csEncrypt = new CryptoStream(msEncrypt, encryptor,
                            CryptoStreamMode.Write))

                        using (var swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(input);
                        }

                        var iv = aesAlg.IV;

                        var decryptedContent = msEncrypt.ToArray();

                        var result = new byte[iv.Length + decryptedContent.Length];

                        Buffer.BlockCopy(iv, 0, result, 0, iv.Length);
                        Buffer.BlockCopy(decryptedContent, 0, result,
                            iv.Length, decryptedContent.Length);

                        return Convert.ToBase64String(result);
                    }
                }
            }
        }

        public string AESDecrypt(string input, string key)
        {
            var fullCipher = Convert.FromBase64String(input);

            var iv = new byte[16];
            var cipher = new byte[16];

            Buffer.BlockCopy(fullCipher, 0, iv, 0, iv.Length);
            Buffer.BlockCopy(fullCipher, iv.Length, cipher, 0, iv.Length);
            var decryptKey = Encoding.UTF8.GetBytes(key);

            using (var aesAlg = Aes.Create())
            {
                using (var decryptor = aesAlg.CreateDecryptor(decryptKey, iv))
                {
                    string result;
                    using (var msDecrypt = new MemoryStream(cipher))
                    {
                        using (var csDecrypt = new CryptoStream(msDecrypt,
                            decryptor, CryptoStreamMode.Read))
                        {
                            using (var srDecrypt = new StreamReader(csDecrypt))
                            {
                                result = srDecrypt.ReadToEnd();
                            }
                        }
                    }

                    return result;
                }
            }
        }
    }
}
