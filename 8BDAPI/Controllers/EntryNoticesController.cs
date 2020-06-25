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
    [Route("[controller]")]
    [ApiController]
    public class EntryNoticesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public EntryNoticesController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/EntryNotices
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EntryNotice>>> GetEntryNotice()
        {
            return await _context.EntryNotice.ToListAsync();
            
        }

        // GET: api/EntryNotices/5
        [HttpGet("{id}")]
        public async Task<ActionResult<EntryNotice>> GetEntryNotice(int id)
        {
            var entryNotice = await _context.EntryNotice.FindAsync(id);

            if (entryNotice == null)
            {
                return NotFound();
            }

            return entryNotice;
        }

        // PUT: api/EntryNotices/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEntryNotice(int id, EntryNotice entryNotice)
        {
            if (id != entryNotice.id)
            {
                return BadRequest();
            }

            _context.Entry(entryNotice).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntryNoticeExists(id))
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

        // POST: api/EntryNotices
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<EntryNotice>> PostEntryNotice(EntryNotice entryNotice)
        {
            _context.EntryNotice.Add(entryNotice);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEntryNotice", new { id = entryNotice.id }, entryNotice);
        }

        // DELETE: api/EntryNotices/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<EntryNotice>> DeleteEntryNotice(int id)
        {
            var entryNotice = await _context.EntryNotice.FindAsync(id);
            if (entryNotice == null)
            {
                return NotFound();
            }

            _context.EntryNotice.Remove(entryNotice);
            await _context.SaveChangesAsync();

            return entryNotice;
        }

        private bool EntryNoticeExists(int id)
        {
            return _context.EntryNotice.Any(e => e.id == id);
        }
    }
}
