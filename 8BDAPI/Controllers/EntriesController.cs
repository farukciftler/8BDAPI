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
    public class EntriesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;
        

        public EntriesController(_8BDAPIContext context)
        {
            _context = context;
        }
     


       [Authorize]//authorize eklendi
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


           
            Subject newsubject = new Subject();
            var list = _context.Subject
               .FromSqlRaw($"SELECT * FROM subject WHERE CONVERT(VARCHAR, subject)='{entry.subject}'")
               .FirstOrDefault();
            
         
            if (list == null)
            {
                newsubject.authorId = entry.authorId;
                newsubject.subject = entry.subject;
                newsubject.isActive = 1;
                newsubject.BSHIU = "00000";
                newsubject.createDate = DateTime.Now;
                newsubject.updateDate = DateTime.Now;
                _context.Subject.Add(newsubject);
                await _context.SaveChangesAsync();
            }
            var list2 = _context.Subject
               .FromSqlRaw($"SELECT * FROM subject WHERE CONVERT(VARCHAR, subject)='{entry.subject}'")
               .FirstOrDefault();

            //eski başlığa yeni tanım girildiğnde updateDate güncellemesi
            list2.updateDate = DateTime.Now;
            _context.Subject.Update(list2);
            entry.createDate = DateTime.Now;
            entry.lastUpdateDate = DateTime.Now;
            entry.subjectId = list2.id;
            _context.Entry.Add(entry);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetEntry", new { id = entry.id }, entry);
        }

        // DELETE: api/Entries/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Entry>> DeleteEntry(int id)
        {
            var entry = await _context.Entry.FindAsync(id);

            //deleted entries to garbage
            GarbageEntry garbage = new GarbageEntry();
            garbage.entryId = entry.id;
            garbage.authorId = entry.authorId;
            garbage.subjectId = entry.subjectId;
            garbage.subject = entry.subject;
            garbage.entry = entry.entry;
            garbage.createDate = entry.createDate;
            garbage.lastUpdateDate = entry.lastUpdateDate;
            garbage.deletedDate = DateTime.Now;
            _context.GarbageEntry.Add(garbage);

            if (entry == null)
            {
                return NotFound();
            }
            _context.Entry.Remove(entry);
            await _context.SaveChangesAsync();
            //delete yapılınca başlıktaki updatedate'i tekrar eski tarihe çek yapıldı
            if (_context.Entry.Where(s => (s.subjectId == entry.subjectId))
            .OrderByDescending(e => e.createDate).FirstOrDefault() != null)
            {
                var list = _context.Entry.Where(s => (s.subjectId == entry.subjectId))
            .OrderByDescending(e => e.createDate).FirstOrDefault();
                var list2 = _context.Subject
           .FromSqlRaw($"SELECT * FROM subject WHERE id={entry.subjectId}")
           .FirstOrDefault();
                list2.updateDate = list.createDate;
                _context.Subject.Update(list2);
            }
            else
            {
                var subject = await _context.Subject.FindAsync(entry.subjectId);
                _context.Subject.Remove(subject);
                
            }
            
           
            await _context.SaveChangesAsync();

 
       
           


            return entry;
        }

        private bool EntryExists(int id)
        {
            return _context.Entry.Any(e => e.id == id);
        }
       
    }
}
