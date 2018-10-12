using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace dotnetCore_DI
{
    public interface ITest
    {
        Guid Guid { get; }
        string Name { get; set; }

        string getName(string str);
    }
}
