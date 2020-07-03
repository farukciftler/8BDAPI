using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class Announcement
    {
        public int id { get; set; }
        public int userId { get; set; }
        public string announcement  { get; set; }
        public DateTime createDate { get; set; }

        public Announcement()
        {
            announcement = "";
            createDate = DateTime.Now;
        }
     
    }
}
