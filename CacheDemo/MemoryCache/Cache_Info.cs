using System;
using System.Data;
using System.Web;
using Memcached.ClientLibrary;

public class Cache_Info
{
    private readonly static string CacheKey = "Info_key";

    /// <summary>
    /// 缓存是否存在
    /// </summary>
    /// <param name="pMC"></param>
    /// <param name="pKey"></param>
    /// <returns></returns>
    private static bool IsCache(MemcachedClient pMC, string pKey)
    {
        if (pMC.KeyExists(pKey))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 覆盖缓存
    /// </summary>
    /// <param name="pKey"></param>
    /// <param name="pObject"></param>
    /// <returns></returns>
    private static bool StoreCache(string pKey, object pObject)
    {
        MemcachedClient mc = new MemcachedClient();
        mc.EnableCompression = true;
        bool _result = false;
        if (IsCache(mc, pKey))
        {
            if (mc.Get(pKey) == null)
            {
                mc.Set(pKey, pObject);//缓存存在，强行覆盖
            }
            else
            {
                mc.Replace(pKey, pObject);//缓存存在，强行覆盖
            }
            _result = true;
        }
        else
        {
            mc.Add(pKey, pObject);//第一次加载缓存
            _result = true;
        }
        return _result;
    }

    /// <summary>
    /// 清除缓存
    /// </summary>
    /// <param name="pKey"></param>
    /// <returns></returns>
    public static bool RemoveCache(string pKey)
    {
        MemcachedClient mc = new MemcachedClient();
        mc.EnableCompression = true;
        return mc.Delete(pKey);
    }

    /// <summary>
    /// 获取数据
    /// </summary>
    /// <returns></returns>
    public static DataTable GetInfo()
    {
        #region 通过缓存来获取DataTable的数据
        MemcachedClient mc = new MemcachedClient();
        mc.EnableCompression = true;
        if (mc.Get(CacheKey) != null)
        {
            return mc.Get(CacheKey) as DataTable; //直接从缓存取数据
        }
        else
        {
            DataTable dt = new DataTable(); //DB_Info.GetInfo();  //第一次加载将数据存入缓存中
            if (StoreCache(CacheKey, dt))
            {
                return mc.Get(CacheKey) as DataTable;
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region 直接从数据库获取DataTable
        //return DB_Info.GetInfo();
        #endregion

    }

}