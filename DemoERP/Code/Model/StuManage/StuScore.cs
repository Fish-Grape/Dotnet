using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Model.StuManage
{
    public class StuScore
    {
        [Key,DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid StuScoreGUID { get; set; }
        public Guid UserGUID { get; set; }
        public Guid CourseGUID { get; set; }
        public decimal Score { get; set; }
    }
}
