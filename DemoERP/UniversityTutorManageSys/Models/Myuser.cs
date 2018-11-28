using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace UniversityTutorManageSys.Models
{
    public class Myuser
    {
        [Key,DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid UserGUID { get; set; }
        public int? IsAdmin { get; set; }
        public int? IsForbidden { get; set; }
        public string UserCode { get; set; }
        public string UserPassword { get; set; }
        public string Verifycode { get; set; }
        public Guid ? ClassGUID  { get; set; }
        public string UserName { get; set; }
        public string Sex { get; set; }
        public DateTime ? Birthday { get; set; }
        public int ? UserNo { get; set; }
        public string Hobby { get; set; }
        public bool ? Remember { get; set; }

        public ICollection<StuCourse> StuCourses { get; set; }
        public ICollection<StuScore> StuScores { get; set; }
        public ICollection<StudyCondition> StudyConditions { get; set; }
        public ICollection<PrizeCondition> PrizeConditions { get; set; }
        public ICollection<PartyCondition> PartyConditions { get; set; }
        public ICollection<JobAndPractice> JobAndPractices { get; set; }
    }
}
