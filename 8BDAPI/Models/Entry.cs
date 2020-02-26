using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
namespace _8BDAPI.Models
{
    public class Entry
    {

        public int id { get; set; }
        public int author_id { get; set; }
        public int subject_id { get; set; }
        public string entry { get; set; }
        public DateTime CreateDate { get; set; }

   

    }
}
