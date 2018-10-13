using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RedisCaching.Models;

namespace RedisCaching.Controllers
{
    public class HomeController : Controller
    {
        private ICacheService _cacheService;

        public HomeController(ICacheService cacheService)
        {
            _cacheService = cacheService;
        }

        public IActionResult Index()
        {
            string cacheKey = "key";
            string result;
            if (!_cacheService.Exists(cacheKey))
            {
                result = $"LineZero{DateTime.Now}";
                _cacheService.Add(cacheKey, result, TimeSpan.FromMinutes(1), true);
            }
            result = _cacheService.Get(cacheKey).ToString();
            ViewBag.Cache = result;

            if (!_cacheService.Exists("ss"))
            {
                _cacheService.Add("ss", "Hello World!", TimeSpan.FromMinutes(1), true);
            }
            if (!_cacheService.Exists("xx"))
            {
                _cacheService.Add("xx", "Hello Universe!", TimeSpan.FromMinutes(1), true);
            }

            var values=_cacheService.GetAll(new string[] { "ss", "xx" });
            ViewBag.keys = values;
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
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
