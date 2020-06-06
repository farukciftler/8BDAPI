using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class GarbageEntry
    {
        public int id { get; set; }
        public int entryId { get; set; }
        public int authorId { get; set; }
        public int subjectId { get; set; }
        public string subject { get; set; }
        public string entry { get; set; }
        public DateTime createDate { get; set; }
        public DateTime lastUpdateDate { get; set; }
        public DateTime deletedDate { get; set; }
        public string deletedFor { get; set; }

    }
}
