using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class Subject
    {
        public int id { get; set; }
        public int authorId { get; set; }
        public string subject { get; set; }
        public int isActive { get; set; }
        public DateTime createDate { get; set; }
        public DateTime updateDate { get; set; }
        public string BSHIU { get; set; } //BOLD STEADY HIDE ITALIC UNDERLINED
        public int totalCount { get; set; }
    }
}
