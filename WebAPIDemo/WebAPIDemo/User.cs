using ProtoBuf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPIDemo
{
    [ProtoContract]
    public class User
    {
        [ProtoMember(1)]
        public int Id { set; get; }
        [ProtoMember(2)]
        public string Name { set; get; }
        [ProtoMember(3)]
        public int Age { set; get; }

    }
}
