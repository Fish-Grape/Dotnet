using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniversityTutorManageSys.PermissionMiddleware;

namespace UniversityTutorManageSys.IDal
{
    public interface IUserRightSer
    {
        IList<UserPermission> GetAllUserRight();
        IList<UserPermission> GetUserRightByUserGUID(Guid UserGUID);
        IList<UserPermission> GetUserRightByUserCode(string code);
    }
}
