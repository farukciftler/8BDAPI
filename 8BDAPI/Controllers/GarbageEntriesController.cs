using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _8BDAPI.Data;
using _8BDAPI.Models;
using Microsoft.AspNetCore.Authorization;

namespace _8BDAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GarbageEntriesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public GarbageEntriesController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/GarbageEntries
        [Authorize(Roles ="developer")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GarbageEntry>>> GetGarbageEntry()
        {
            return await _context.GarbageEntry.ToListAsync();
        }

        // GET: api/GarbageEntries/5
        [Authorize(Roles ="developer")]
        [HttpGet("{id}")]
        public async Task<ActionResult<GarbageEntry>> GetGarbageEntry(int id)
        {
            var garbageEntry = await _context.GarbageEntry.FindAsync(id);

            if (garbageEntry == null)
            {
                return NotFound();
            }

            return garbageEntry;
        }

        // PUT: api/GarbageEntries/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize(Roles ="developer")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutGarbageEntry(int id, GarbageEntry garbageEntry)
        {
            if (id != garbageEntry.id)
            {
                return BadRequest();
            }

            _context.Entry(garbageEntry).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GarbageEntryExists(id))
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

        // POST: api/GarbageEntries
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize(Roles ="developer")]
        [HttpPost]
        public async Task<ActionResult<GarbageEntry>> PostGarbageEntry(GarbageEntry garbageEntry)
        {
            garbageEntry.deletedDate = DateTime.Now;
            _context.GarbageEntry.Add(garbageEntry);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetGarbageEntry", new { id = garbageEntry.id }, garbageEntry);
        }

        // DELETE: api/GarbageEntries/5
        [Authorize(Roles ="developer")]
        [HttpDelete("{id}")]
        public async Task<ActionResult<GarbageEntry>> DeleteGarbageEntry(int id)
        {
            var garbageEntry = await _context.GarbageEntry.FindAsync(id);
            if (garbageEntry == null)
            {
                return NotFound();
            }

            _context.GarbageEntry.Remove(garbageEntry);
            await _context.SaveChangesAsync();

            return garbageEntry;
        }

        private bool GarbageEntryExists(int id)
        {
            return _context.GarbageEntry.Any(e => e.id == id);
        }
    }
}
