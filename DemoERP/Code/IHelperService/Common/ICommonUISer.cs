using Model.User;
using System;

namespace IHelperService.Common
{
    public interface ICommonUISer
    {
        Myuser getMyuser();
        void removeUser();
        void SaveUser(Myuser user, bool remember = false);
    }
}
