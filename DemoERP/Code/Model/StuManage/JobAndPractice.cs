using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Model.StuManage
{
    public class JobAndPractice
    {
        [Key,DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid JobAndPracticeGUID { get; set; }
        public Guid UserGUID { get; set; }
        public string Condition { get; set; }
    }
}
