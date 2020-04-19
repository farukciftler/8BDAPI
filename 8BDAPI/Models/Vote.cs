using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class Vote
    {
        public int id { get; set; }
        public int userId { get; set; }
        public int entryId { get; set; }
        public DateTime date { get; set; }
        public int type { get; set; }

    }
}
