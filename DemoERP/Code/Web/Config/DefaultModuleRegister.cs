using Autofac;
using Extensions.PermissionMiddleware;
using IDal.User;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using Microsoft.AspNetCore.Mvc.Controllers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using Module = Autofac.Module;

namespace Web.Config
{
    public class DefaultModuleRegister : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            ApplicationPartManager manager = new ApplicationPartManager();
            manager.ApplicationParts.Add(new AssemblyPart(GetAssembly("Web")));
            manager.FeatureProviders.Add(new ControllerFeatureProvider());//查找所有的Controller
            ControllerFeature feature = new ControllerFeature();
            manager.PopulateFeature(feature);

            builder.RegisterAssemblyTypes(GetAssembly("SqlServerDal")).
                Where(t => t.Name.EndsWith("Ser")).AsImplementedInterfaces().SingleInstance();
            builder.RegisterAssemblyTypes(GetAssembly("HelperService")).
                Where(t => t.Name.EndsWith("Ser")).AsImplementedInterfaces().SingleInstance();
            builder.RegisterTypes(feature.Controllers.Select(ti => ti.AsType()).ToArray()).PropertiesAutowired();
        }
        public static Assembly GetAssembly(string assemblyName)
        {
            Assembly assembly = AssemblyLoadContext.Default.LoadFromAssemblyPath(AppContext.BaseDirectory + $"{assemblyName}.dll");
            return assembly;
        }
    }
}