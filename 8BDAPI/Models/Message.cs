using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _8BDAPI.Models
{
    public class Message
    {
        public int id { get; set; }
        public int chatId { get; set; }
        public int senderId { get; set; }
        public int receiverId { get; set; }
        public string message { get; set; }
        public DateTime createDate { get; set; }
        public Message()
        {
            message = "";
            createDate = DateTime.Now;
        }
    }
}
