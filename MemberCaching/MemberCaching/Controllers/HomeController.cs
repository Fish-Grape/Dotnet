using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MemberCaching.Models;
using Microsoft.Extensions.Caching.Memory;
using System.Threading;
using Microsoft.Extensions.Primitives;

namespace MemberCaching.Controllers
{
    public class HomeController : Controller
    {
        private IMemoryCache _memoryCache;

        public HomeController(IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
        }

        public IActionResult Index()
        {
            string cacheKey = "key";
            string result;
            if (!_memoryCache.TryGetValue(cacheKey,out result))
            {
                result = $"LineZero{DateTime.Now}";
                MemoryCacheEntryOptions options = new MemoryCacheEntryOptions();
                options.AbsoluteExpiration = DateTime.Now.AddMinutes(1);
                options.SlidingExpiration = TimeSpan.FromMinutes(1);
                options.RegisterPostEvictionCallback(MyCallback,this);
                _memoryCache.Set(cacheKey,result,options);
            }
            ViewBag.Cache = result;

            var cts = new CancellationTokenSource();
            _memoryCache.Set("cts",cts);

            MemoryCacheEntryOptions options2 = new MemoryCacheEntryOptions();
            options2.AddExpirationToken(new CancellationChangeToken(cts.Token));
            options2.RegisterPostEvictionCallback(MyCallback,this);
            _memoryCache.Set<string>("timestamp",DateTime.Now.ToString(),options2);
            _memoryCache.Set<string>("key1", "Hello World!",new CancellationChangeToken(cts.Token));
            _memoryCache.Set<string>("key2", "Hello Universe!", new CancellationChangeToken(cts.Token));

            return View();
        }

        private static void MyCallback(object key, object value, EvictionReason reason, object state)
        {
            var message = $"Cache entry was removed : {reason}";
            ((HomeController)state)._memoryCache.Set("callbackMessage", message);
        }

        public IActionResult About()
        {
            string timestamp = _memoryCache.Get<string>("key");
            ViewData["callbackMessage"] = _memoryCache.Get<string>("callbackMessage");

            return View("About",timestamp);
        }

        public IActionResult Contact()
        {
            CancellationTokenSource cts = _memoryCache.Get<CancellationTokenSource>("cts");
            cts.Cancel();
            return RedirectToAction("About");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
