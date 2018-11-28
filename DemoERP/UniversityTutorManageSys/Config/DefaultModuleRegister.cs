using Autofac;

namespace UniversityTutorManageSys
{
    public class DefaultModuleRegister : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(System.Reflection.Assembly.GetExecutingAssembly()).
                Where(t => t.Name.EndsWith("Ser")).AsImplementedInterfaces().SingleInstance();


        }
    }
}