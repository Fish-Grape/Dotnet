using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Model.Taskwake
{
    public class MyTaskwake
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid MyTaskwakeGUID { get; set; }
        public string TaskwakeDetail { get; set; } = string.Empty;
    }
}
