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
        public int authorId { get; set; }
        public int subjectId { get; set; }
        public string subject { get; set; }
        public string entry { get; set; }
        public DateTime createDate { get; set; }
        public DateTime lastUpdateDate { get; set; }

        //update date eklenecek
        /*
         
         CREATE TABLE entry(
         id   INT              NOT NULL,
         author_id   INT              NOT NULL,
         subject_id   INT              NOT NULL,
         entry TEXT     NOT NULL,
         createDate  datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,       
         PRIMARY KEY (id)
           );
         
         
         */



    }
}
