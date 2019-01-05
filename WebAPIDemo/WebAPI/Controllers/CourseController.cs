using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [RoutePrefix("api/Course")]
    public class CourseController : ApiController
    {
        [Route("")]
        [HttpGet]
        public string GetCourse()
        {
            return "GetCourse()调用成功!";
        }
        [Route("")]
        [HttpGet]
        public string GetCourseById(int ID)
        {
            return "GetCourseById(int ID)调用成功!";
        }

        [Route("PostCourse")]
        [HttpPost]
        public string PostCourse()
        {
            return "特性路由：PostCourse()调用成功!";
        }

        [Route("PostCourseByID/{id:int=0}")]//路由约束
        [HttpPost]
        public string PostCourseByID([FromBody]int id)//多个参数可以用实体参数或json传送
        {
            return "特性路由：PostCourseByID()调用成功!" + id;
        }

        [Route("PostCourseByModel")]
        [HttpPost]
        public string PostCourseByModel([FromBody]Course course)//多个参数可以用实体参数或json传送
        {
            return "特性路由：PostCourseByModel()调用成功!" + course.ID +"、"+course.CourseName;
        }
    }
}
