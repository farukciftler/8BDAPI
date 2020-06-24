using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class EntryNotice
    {
        public int id { get; set; }
        public int entryId { get; set; }
        public int noticedById { get; set; }
        public string notice { get; set; }
        public DateTime createdOnUtc { get; set; }
    }
}
