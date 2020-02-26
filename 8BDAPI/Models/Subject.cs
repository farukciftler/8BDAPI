using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class Subject
    {
        public int id { get; set; }
        public int author_id { get; set; }
        public string subject { get; set; }
        public int isActive { get; set; }
        public DateTime createDate { get; set; }
        public DateTime updateDate { get; set; }
        public int BSHIU { get; set; } //BOLD STEADY HIDE ITALIC UNDERLINE


        /*
         CREATE TABLE subject(
         id   INT              NOT NULL,
         author_id   INT              NOT NULL,
         subject   string              NOT NULL,
         isActive int     NOT NULL,
         createDate  datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
         updateDate  datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
         BSHIU int NOT NULL,
         PRIMARY KEY (id)
         );
         
         
         */
    }
}
