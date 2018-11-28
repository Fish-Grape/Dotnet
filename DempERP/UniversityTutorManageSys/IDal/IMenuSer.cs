using System;
using System.Collections.Generic;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.IDal
{
    public interface IMenuSer
    {
        /// <summary>
        /// 根据菜单ID获取菜单资料
        /// </summary>
        /// <param name="GUID">菜单Id</param
        /// <returns></returns>
        MenuModel GetMenuViewByGUID(Guid GUID);

        /// <summary>
        /// 获取全部菜单接口
        /// </summary>
        /// <returns>IList<MenuModel></returns>
        IList<MenuModel> GetMenuList();

        /// <summary>
        /// 根据获取全部菜单并返回是否被权限选择
        /// </summary>
        /// <param name="RightGUID">权限ID</param>
        /// <returns>IList<MenuModel></returns>
        IList<MenuModel> GetMenuListByRightGUID(Guid RightGUID);

        /// <summary>
        /// 根据员工Id获得菜单
        /// </summary>
        /// <param name="UserGUID">用户Id</param>
        IList<MenuModel> GetMenuListByUserGUID(Guid UserGUID);

        /// <summary>
        /// 新增菜单
        /// </summary>
        /// <param name="moMenuModel">菜单属性</param>
        /// <returns>存储过程返回参数</returns>
        int Insert(MenuModel moMenuModel);

        /// <summary>
        /// 修改菜单
        /// </summary>
        /// <param name="moMenuModel">系统菜单属性</param>
        /// <returns>存储过程返回参数</returns>
        int Change(MenuModel moMenuModel);

        /// <summary>
        /// 修改菜单
        /// </summary>
        /// <param name="MenuId">菜单ID</param>
        /// <returns>存储过程返回参数</returns>
        int Delete(Guid MenuGUID);
    }
}
