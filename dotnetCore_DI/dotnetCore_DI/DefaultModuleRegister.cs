using Autofac;
using System;
using System.Runtime.Loader;

namespace dotnetCore_DI
{
    public class DefaultModuleRegister : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(System.Reflection.Assembly.GetExecutingAssembly()).Where(t => t.Name.EndsWith("st")).AsImplementedInterfaces().InstancePerLifetimeScope();
            builder.RegisterAssemblyTypes(System.Reflection.Assembly.GetExecutingAssembly()).Where(t => t.Name.EndsWith("Repository")).AsImplementedInterfaces().InstancePerLifetimeScope();
        }

        public static System.Reflection.Assembly GetAssembly(string assemblyName)
        {
            var assembly = AssemblyLoadContext.Default.LoadFromAssemblyPath(AppContext.BaseDirectory+ $"{assemblyName}.dll");
            return assembly;
        }
    }
}