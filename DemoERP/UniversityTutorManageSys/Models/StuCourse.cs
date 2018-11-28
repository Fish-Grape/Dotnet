using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace UniversityTutorManageSys.Models
{
    public class StuCourse
    {
        [Key,DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid StuCourseGUID { get; set; }
        public Guid UserGUID { get; set; }
        public Guid CourseGUID { get; set; }
    }
}
