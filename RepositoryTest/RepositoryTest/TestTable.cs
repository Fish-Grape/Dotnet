using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace RepositoryTest
{
    [Table(Name = "TestTable")]
    class TestTable 
    {

        public TestTable()
        {

        }

        public TestTable(Guid TestTableGUID, string TestTableName, string TestTableAddress)
        {
            this.TestTableGUID = TestTableGUID;
            this.TestTableName = TestTableName;
            this.TestTableAddress = TestTableAddress;
        }

        [Column(IsPrimaryKey=true)]
        public Guid ? TestTableGUID { set; get; }

        [Column]
        public string TestTableName { set; get; }
        [Column]
        public string TestTableAddress { set; get; }


    }
}
