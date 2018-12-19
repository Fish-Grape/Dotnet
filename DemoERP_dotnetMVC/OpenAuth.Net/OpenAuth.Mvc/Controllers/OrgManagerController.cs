﻿using Infrastructure;
using OpenAuth.App;
using OpenAuth.Mvc.Models;
using System;
using System.Web.Mvc;
using OpenAuth.Repository.Domain;

namespace OpenAuth.Mvc.Controllers
{
    public class OrgManagerController : BaseController
    {
        public OrgManagerApp OrgApp { get; set; }

        //
        // GET: /OrgManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }
       
        public string LoadForUser(string firstId)
        {
            var orgs = OrgApp.LoadForUser(firstId);
            return JsonHelper.Instance.Serialize(orgs);
        }

        public string LoadForRole(string firstId)
        {
            var orgs = OrgApp.LoadForRole(firstId);
            return JsonHelper.Instance.Serialize(orgs);
        }


        //添加组织提交
        [HttpPost]
        public string Add(Org org)
        {
            try
            {
                OrgApp.Add(org);
            }
            catch (Exception ex)
            {
                  Result.Code = 500;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        //编辑
        [HttpPost]
        public string Update(Org org)
        {
            try
            {
                OrgApp.Update(org);
            }
            catch (Exception ex)
            {
                Result.Code = 500;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

       /// <summary>
        /// 删除指定ID的组织
        /// </summary>
        /// <returns>System.String.</returns>
        [HttpPost]
        public string Delete(string[] ids)
        {
            try
            {
                OrgApp.DelOrg(ids);
            }
            catch (Exception e)
            {
                  Result.Code = 500;
                Result.Message = e.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }
    }
}