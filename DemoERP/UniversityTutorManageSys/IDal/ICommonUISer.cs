using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.IDal
{
    public interface ICommonUISer
    {
        String WebSiteName();
        Myuser getMyuser();
        void removeUser();
        void SaveUser(Myuser user, bool remember = false);
    }
}
