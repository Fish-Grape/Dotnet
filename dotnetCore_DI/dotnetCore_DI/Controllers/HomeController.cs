using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using dotnetCore_DI.Models;
using Microsoft.Extensions.Configuration;
using Autofac;
using Microsoft.AspNetCore.Hosting;

namespace dotnetCore_DI.Controllers
{
    public class HomeController : Controller
    {
        private ITest _test1;
        private ITest _test2;

        public HomeController(ITest test1, ITest test2)
        {
            _test1 = test1;
            _test2 = test2;
        }
        public IActionResult Index()
        {
            using (var scope = Startup.AutofacContainer.BeginLifetimeScope())
            {
                IConfiguration config = scope.Resolve<IConfiguration>();
                IHostingEnvironment env = scope.Resolve<IHostingEnvironment>();
            }
            ViewBag.Test1 = this._test1.getName(_test1.GetType().Name);
            ViewBag.Test2 = this._test2.getName(_test1.GetType().Name);

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
