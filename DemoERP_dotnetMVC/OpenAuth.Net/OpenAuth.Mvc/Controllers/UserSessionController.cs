﻿using System;
using System.Linq;
using Infrastructure;
using OpenAuth.App.Response;
using OpenAuth.App.SSO;

namespace OpenAuth.Mvc.Controllers
{
    /// <summary>
    /// 获取登录用户的全部信息
    /// <para>所有和当前登录用户相关的操作都在这里</para>
    /// </summary>
    public class UserSessionController : BaseController
    {
        UserWithAccessedCtrls user = AuthUtil.GetCurrentUser();
        /// <summary>
        /// 获取登录用户可访问的所有模块，及模块的操作菜单
        /// </summary>
        public string GetModulesTree()
        {
            var moduleTree = user.Modules.GenerateTree(u => u.Id, u => u.ParentId);
            return JsonHelper.Instance.Serialize(moduleTree);
        }

        /// <summary>
        /// datatable结构的模块列表
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public string GetModules(string pId)
        {
            string cascadeId = ".0.";
            if (!string.IsNullOrEmpty(pId))
            {
                var obj = user.Modules.SingleOrDefault(u => u.Id == pId);
                if (obj == null)
                    throw new Exception("未能找到指定对象信息");
                cascadeId = obj.CascadeId;
            }

            var query = user.Modules.Where(u => u.CascadeId.Contains(cascadeId));

            return JsonHelper.Instance.Serialize(new TableData
            {
                data = query.ToList(),
                count = query.Count(),
            });

        }

        /// <summary>
        /// 获取用户可访问的模块列表
        /// </summary>
        public string QueryModuleList()
        {
            var orgs = user.Modules.MapToList<ModuleView>();
            return JsonHelper.Instance.Serialize(orgs);
        }

        /// <summary>
        /// 获取登录用户可访问的所有部门
        /// <para>用于树状结构</para>
        /// </summary>
        public string GetOrgs()
        {
            return JsonHelper.Instance.Serialize(user.Orgs);
        }

        /// <summary>
        /// 加载机构的全部下级机构
        /// </summary>
        /// <param name="orgId">机构ID</param>
        /// <returns></returns>
        public string GetSubOrgs(string orgId)
        {
            string cascadeId = ".0.";
            if (!string.IsNullOrEmpty(orgId))
            {
                var org = user.Orgs.SingleOrDefault(u => u.Id == orgId);
                if (org == null)
                {
                    return JsonHelper.Instance.Serialize(new TableData
                    {
                        msg ="未找到指定的节点",
                        code = 500,
                    });
                }
                cascadeId = org.CascadeId;
            }

            var query = user.Orgs.Where(u => u.CascadeId.Contains(cascadeId));

            return JsonHelper.Instance.Serialize(new TableData
            {
                data = query.ToList(),
                count = query.Count(),
            });
        }

        //获取当前页面菜单
        public string GetButtonns()
        {
            var module = user.Modules.Single(u => u.Name.Contains(""));
            return JsonHelper.Instance.Serialize(module.Elements);
        }
    }
}