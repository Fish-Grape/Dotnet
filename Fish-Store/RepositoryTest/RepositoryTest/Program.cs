using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq;
using System.Data.SqlClient;

namespace RepositoryTest
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionStr = "server=172.1.1.216;database=chefenqi;uid=sa;pwd=sa";

            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = connectionStr;

            DataContext db = new DataContext(sqlConnection);

            SqlRepository<TestTable> TestTableRepository = new SqlRepository<TestTable>(db);

            var Tc=TestTableRepository.Query.Where(x => x.TestTableName =="Fish" ).Single();

            //TestTableRepository.Delete(Tc);

            //TestTableRepository.Add(new TestTable(Guid.NewGuid(),"Kristen","苏东坡奥时代佛奥神佛爱上"));
            //TestTableRepository.Save();

            //Console.WriteLine(Tc.TestTableName);

        }
    }
}
