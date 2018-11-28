using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UniversityTutorManageSys.Factory
{
    public abstract class Creator<T> where T: class
    {
        public abstract T CreateInstanceFactory();
    }
}
