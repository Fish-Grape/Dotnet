using Microsoft.Extensions.Logging;
using NLog;
using UniversityTutorManageSys.HelperService;
using UniversityTutorManageSys.IDal;
using UniversityTutorManageSys.SqlServerDal;

namespace UniversityTutorManageSys.Factory
{
    public class UserRightFactory : Creator<IUserRightSer>
    {
        public override IUserRightSer CreateInstanceFactory()
        {
            return new UserRightSer(new SqlHelperSer());
        }
    }
}
