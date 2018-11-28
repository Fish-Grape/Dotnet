using System;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NLog.Extensions.Logging;
using NLog.Web;
using UniversityTutorManageSys.Data;
using UniversityTutorManageSys.Extensions;
using UniversityTutorManageSys.Factory;
using UniversityTutorManageSys.PermissionMiddleware;

namespace UniversityTutorManageSys
{
    public class Startup
    {
        public static IContainer AutofacContainer;

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            //扩展HttpContext
            services.AddHttpContextAccessor();

            //添加EF支持，数据库变更到appsetting.json中修改
            services.AddDbContext<DataContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            //添加Session
            services.AddSession();

            //添加cookie
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(options =>
                {
                    options.AccessDeniedPath = new PathString("/denied");
                    options.LoginPath = new PathString("/login");
                });

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            //添加DI
            ContainerBuilder builder = new ContainerBuilder();
            builder.Populate(services);
            builder.RegisterModule<DefaultModuleRegister>();
            AutofacContainer = builder.Build();

            return new AutofacServiceProvider(AutofacContainer);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env,ILoggerFactory loggerFactory,
            IApplicationLifetime appLifetime)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            //扩展HttpContext
            app.UseStaticHttpContext();

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            //app.UseCookiePolicy();
            app.UseSession();
            //验证中间件
            app.UseAuthentication();
            //创建用户权限工厂类
            UserRightFactory rightFactory = new UserRightFactory();
            ////添加权限中间件, 一定要放在app.UseAuthentication后
            app.UsePermission(new PermissionMiddlewareOption()
            {
                LoginAction = @"/login",
                NoPermissionAction = @"/denied",
                //这个集合从数据库中查出所有用户的全部权限
                UserPerssions = rightFactory.CreateInstanceFactory().GetAllUserRight()
            });
            //添加日志记录
            loggerFactory.AddNLog();
            env.ConfigureNLog(env.ContentRootPath+ "/Config/nlog.config");

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
            appLifetime.ApplicationStopped.Register(() => { AutofacContainer.Dispose(); });
        }
    }
}
