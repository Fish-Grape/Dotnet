using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace dotnetCore_DI
{
    public class Test : ITest
    {
        public Test()
        {
            this.Guid = Guid.NewGuid();
        }
        public Guid Guid { get; }
        public string Name { get; set; }

        public string getName(string str)
        {
            return "autofa创建对象成功:" + str;
        }
    }
}
