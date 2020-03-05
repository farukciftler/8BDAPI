using _8BDAPI.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
namespace _8BDAPI.Helpers
{
    public class UserLevelHelper
    {
        private readonly _8BDAPIContext _context;
        
        public UserLevelHelper(_8BDAPIContext context)
        {
            _context = context;

        }
       
        public string GetUpperRoles(int startLevel)
        {
            var getroles = _context.UserLevel.Where(s => (s.userLevel >= startLevel)).Select(u => u.userLevelInfo).ToList();
            string roles =getroles[0];
            if (roles.Count()>1)
            {
                for (int i = 1; i < getroles.Count(); i++)
                {
                    roles += ",";
                    roles += getroles[i];
                }
            }
            return roles;
        }
       
    }
}
