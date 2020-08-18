using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _8BDAPI.Data;
using _8BDAPI.Models;
using System.Numerics;

namespace _8BDAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public MessagesController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/Messages
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Message>>> GetMessage()
        {
            return await _context.Message.ToListAsync();
        }

        // GET: api/Messages/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Message>> GetMessage(int id)
        {
            var message = await _context.Message.FindAsync(id);

            if (message == null)
            {
                return NotFound();
            }

            return message;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutMessage(int id, Message message)
        {
            if (id != message.id)
            {
                return BadRequest();
            }

            _context.Entry(message).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MessageExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Messages
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Message>> PostMessage(Message message)

        {
            if(_context.Message.Where(s => s.senderId == message.senderId && s.receiverId == message.receiverId).FirstOrDefault() != null)
            {
                message.chatId = _context.Message.Where(s => s.senderId == message.senderId && s.receiverId == message.receiverId).FirstOrDefault().chatId;
            }
            else
            {
                if(_context.Message.FirstOrDefault() != null)
                {
                    var d = _context.Message.OrderByDescending(s => s.chatId).FirstOrDefault().chatId;
                    message.chatId = d + 1;
                }
                else
                {
                    message.chatId = 1;
                }
            }

            _context.Message.Add(message);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMessage", new { id = message.id }, message);
        }

        // DELETE: api/Messages/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Message>> DeleteMessage(int id)
        {
            var message = await _context.Message.FindAsync(id);
            if (message == null)
            {
                return NotFound();
            }

            _context.Message.Remove(message);
            await _context.SaveChangesAsync();

            return message;
        }

        private bool MessageExists(int id)
        {
            return _context.Message.Any(e => e.id == id);
        }
    }
}
