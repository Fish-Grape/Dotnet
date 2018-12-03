using Extensions.PermissionMiddleware;
using System;
using System.Collections.Generic;

namespace IDal.User
{
    public interface IUserRightSer
    {
        IList<UserPermission> GetAllUserRight();
        IList<UserPermission> GetUserRightByUserGUID(Guid UserGUID);
        IList<UserPermission> GetUserRightByUserCode(string code);
    }
}
