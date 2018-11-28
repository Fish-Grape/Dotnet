using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UniversityTutorManageSys.Models
{
    /// <summary>
    /// 系统菜单属性
    /// </summary>
    [Serializable]
    public class MenuModel
    {
        private Guid _SystemMenuGUID = Guid.Empty;
        private string _SystemMenuCode = "";
        private string _MenuName = "";
        private string _NavigateUrl = "";
        private string _Target = "";
        private int _Sort = 0;
        private string _ParentMenuCode = "";
        private String _CssClass = "";
        private Guid _RightMenuGUID = Guid.Empty;

        public Guid SystemMenuGUID { get => _SystemMenuGUID; set => _SystemMenuGUID = value; }
        public string SystemMenuCode { get => _SystemMenuCode; set => _SystemMenuCode = value; }
        public string MenuName { get => _MenuName; set => _MenuName = value; }
        public string NavigateUrl { get => _NavigateUrl; set => _NavigateUrl = value; }
        public string Target { get => _Target; set => _Target = value; }
        public int Sort { get => _Sort; set => _Sort = value; }
        public string ParentMenuCode { get => _ParentMenuCode; set => _ParentMenuCode = value; }
        public string CssClass { get => _CssClass; set => _CssClass = value; }
        public Guid RightMenuGUID { get => _RightMenuGUID; set => _RightMenuGUID = value; }
    }
}
