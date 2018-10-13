using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore_Demo.Models
{
    public class Enrollment
    {
        public int EnrollmentID { get; set; }
        public int classnameID { get; set; }
        public int StudentID { get; set; }
        public int CourseID { get; set; }
        public Grade Grade { get; set; }
    }

    public enum Grade
    {
        A,
        B,
        C,
        D,
        E,
        F
    }
}
