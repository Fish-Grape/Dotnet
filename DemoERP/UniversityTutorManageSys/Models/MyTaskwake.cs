using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace UniversityTutorManageSys.Models
{
    public class MyTaskwake
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid MyTaskwakeGUID { get; set; }
        public string TaskwakeDetail { get; set; } = string.Empty;
    }
}
