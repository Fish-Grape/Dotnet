using Autofac;
using Autofac.Extras.DynamicProxy;
using IDal.Aop.ICache;
using IDal.Aop.ILog;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using Microsoft.AspNetCore.Mvc.Controllers;
using System;
using System.Linq;
using System.Reflection;
using Web.Aop;
using Web.Helper;
using Module = Autofac.Module;

namespace Web.Config
{
    public class DefaultModuleRegister : Module
    {
        ReflectionHelper reflection=null;
        protected override void Load(ContainerBuilder builder)
        {
            reflection = new ReflectionHelper();
            ApplicationPartManager manager = new ApplicationPartManager();
            manager.ApplicationParts.Add(new AssemblyPart(reflection.GetAssembly("Web")));
            manager.FeatureProviders.Add(new ControllerFeatureProvider());//查找所有的Controller
            ControllerFeature feature = new ControllerFeature();
            manager.PopulateFeature(feature);

            //所有以Ser结尾的接口均通过构造器注入
            builder.RegisterAssemblyTypes(reflection.GetAssembly("SqlServerDal")).
                Where(t => t.Name.EndsWith("Ser")).AsImplementedInterfaces().SingleInstance(); 
            builder.RegisterAssemblyTypes(reflection.GetAssembly("HelperService")).
                Where(t => t.Name.EndsWith("Ser")).AsImplementedInterfaces().SingleInstance();
            //控制器属性注入
            builder.RegisterTypes(feature.Controllers.Select(ti => ti.AsType()).ToArray()).PropertiesAutowired();

            //反射获取AopInterceptorSer
            builder.RegisterType<AopInterceptor>();
            //添加AOP支持
            //面向接口使用AOP
            SetMultiInterceptor(builder, "SqlServerDal", typeof(ILogging), typeof(AopInterceptor));//记录错误日志
            SetMultiInterceptor(builder, "HelperService", typeof(IQCaching), typeof(AopInterceptor));//启用缓存
        }

        private void SetMultiInterceptor(ContainerBuilder builder,string assemblyName,Type It,Type ImpT)
        {
            builder.RegisterAssemblyTypes(reflection.GetAssembly(assemblyName))
             .Where(type => It.IsAssignableFrom(type) && !type.GetTypeInfo().IsAbstract)
             .AsImplementedInterfaces()
             .InstancePerLifetimeScope()
             .EnableInterfaceInterceptors()
             .InterceptedBy(ImpT);
        }
    }
}