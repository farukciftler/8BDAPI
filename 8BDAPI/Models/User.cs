using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class User
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        [EmailAddress]
        public string email { get; set; }
        public string activationToken { get; set; }
        public DateTime activationTokenValidTime { get; set; }
        public int userLevel { get; set; }
        public int isApproved { get; set; }
        public int isActive { get; set; }
        public string registerIp { get; set; }
        public DateTime registerDate { get; set; }
        public DateTime lastLoginDate { get; set; }

    }
}
