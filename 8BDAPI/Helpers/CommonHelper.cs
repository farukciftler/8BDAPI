using _8BDAPI.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Helpers
{
    public class CommonHelper
    {
        private readonly _8BDAPIContext _context;

        public CommonHelper(_8BDAPIContext context)
        {
            _context = context;

        }

        public int GetUserIdByEntryId(int entryid)
        {
            var c = _context.Entry.Where(s => s.id == entryid).FirstOrDefault();
            var userid = c.authorId;
            return userid;
        }
    }
}
