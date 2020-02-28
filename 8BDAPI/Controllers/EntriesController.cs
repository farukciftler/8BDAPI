using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _8BDAPI.Data;
using _8BDAPI.Models;

namespace _8BDAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EntriesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;
        private readonly Subject _subject;

        public EntriesController(_8BDAPIContext context)
        {
            _context = context;
        }
     


        
        // GET: api/Entries
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Entry>>> GetEntry()
        {
            return await _context.Entry.ToListAsync();
        }

        // GET: api/Entries/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Entry>> GetEntry(int id)
        {
            var entry = await _context.Entry.FindAsync(id);

            if (entry == null)
            {
                return NotFound();
            }

            return entry;
        }

        // PUT: api/Entries/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEntry(int id, Entry entry)
        {
            if (id != entry.id)
            {
                return BadRequest();
            }

            _context.Entry(entry).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntryExists(id))
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

        // POST: api/Entries
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Entry>> PostEntry(Entry entry)
        {

            /*
            var isExist =  _context.Subject.Where(b => b.subject == entry.subject).First();
            if (isExist == null)
            {
                var s = new Subject { author_id = entry.author_id, subject = entry.subject, isActive = 0, BSHIU = 0 };
                    
            }*/

            var list = _context.Subject
                .FromSqlRaw($"SELECT * FROM subject WHERE CONVERT(VARCHAR, subject)='{entry.subject}'")
                .ToList();
            

            _context.Entry.Add(entry);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEntry", new { id = entry.id }, entry);
        }

        // DELETE: api/Entries/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Entry>> DeleteEntry(int id)
        {
            var entry = await _context.Entry.FindAsync(id);
            if (entry == null)
            {
                return NotFound();
            }

            _context.Entry.Remove(entry);
            await _context.SaveChangesAsync();

            return entry;
        }

        private bool EntryExists(int id)
        {
            return _context.Entry.Any(e => e.id == id);
        }
       
    }
}
