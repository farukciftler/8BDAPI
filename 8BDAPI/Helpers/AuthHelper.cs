using _8BDAPI.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _8BDAPI.Models;
using System.Security.Claims;

namespace _8BDAPI.Helpers
{
    public class AuthHelper
    {
        private readonly _8BDAPIContext _context;

        public AuthHelper(_8BDAPIContext context)
        {
            _context = context;

        }
        
        public User UserDataByUsername(string username)
        {
            var a = _context.User.Where(s => (s.username == username))
            .FirstOrDefault();
            return a;
            
        }
    }
}
