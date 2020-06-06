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
using _8BDAPI.Helpers;
using System.Security.Claims;
using AutoMapper;
using _8BDAPI.Helpers.Pagination;

namespace _8BDAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class EntriesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;
        private readonly AuthHelper _auth;
        private readonly IMapper _mapper;
        

        public EntriesController(_8BDAPIContext context, AuthHelper auth, IMapper mapper)
        {
            _context = context;
            _auth = auth;
            _mapper = mapper;
        }
     


       //[Authorize(Roles ="developer")]//aut}orize eklendi
        // GET: api/Entries
    
        public  virtual IPagedList<Entry> Index(int subjectId = 1,int pageIndex = 0, int pageSize = 10)
        {
            
            var query = _context.Entry
                   .Where(i => i.subjectId == subjectId);
            
            var entry = new PagedList<Entry>(query, pageIndex, pageSize);
            return  entry;
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
            [HttpGet("rownumber/{id}")]
            public async Task<ActionResult<int>> GetRowNumberByEntryId(int id)
        {
            var entry = await _context.Entry.FindAsync(id);
            var query =$"SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY createDate ASC) AS Row, * FROM entry where subjectId={entry.subjectId}  ) AS Faruk where id={entry.id} ";
            var blogs =  _context.Entry
            .FromSqlRaw(query)
            .ToList();
            var myResult = _context.Entry.Select((r, i) => new { Row = r, Index = i })
            .Where(y => y.Row.id == entry.id)
            .OrderByDescending(x => x.Row.createDate);
            
            return 0; 
        }
       
        //başlıktaki tanım sayısının kaç sayfa oluşturacağı pagination için
        [HttpGet("entrypage/{subjectId}")]
        public int EntryPage(int subjectId)
        {
            var entryPage = _context.Entry.Where(x => x.subjectId == subjectId).Count();
            entryPage = (entryPage / 10) + 1; 
            

            return entryPage;
        }
        [HttpPost("edit")]
        public async Task<ActionResult<Entry>> edit(Entry entry)
        {
            var oldentry = _context.Entry.Where(s => s.id == entry.id).FirstOrDefault();
            oldentry.entry = entry.entry;

            _context.Entry(oldentry).State = EntityState.Modified;


            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntryExists(entry.id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return oldentry;
        }

        //başlıktaki tanım sayısı
        [HttpGet("entrynumber/{subjectId}")]
        public int EntryNumber(int subjectId)
        {
            var entryPage = _context.Entry.Where(x => x.subjectId == subjectId).Count();
           


            return entryPage;
        }

        // PUT: api/Entries/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize(Roles = "developer")]
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
        [Authorize(Roles ="author, moderator, administrator, developer")]
        [HttpPost]
        public async Task<ActionResult<Entry>> PostEntry(Entry entry)
        {
            string username = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var user =_context.User.Where(s => s.username == username).FirstOrDefault();
            entry.authorId = user.id;

            var list2 = _context.Subject.Where(s => s.id == entry.subjectId).FirstOrDefault();
            //eski başlığa yeni tanım girildiğnde updateDate güncellemesi
                list2.updateDate = DateTime.Now;
            list2.totalCount = list2.totalCount + 1;
            _context.Subject.Update(list2);
            entry.createDate = DateTime.Now;
            entry.lastUpdateDate = DateTime.Now;
            entry.subjectId = list2.id;
            entry.authorId = user.id;
            _context.Entry.Add(entry);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetEntry", new { id = entry.id }, entry);
        }

        // DELETE: api/Entries/5
        //[Authorize(Roles ="developer")]
        [HttpGet("delete/{id}/{reason}")]
        public async Task<ActionResult<Entry>> DeleteEntry(int id, string reason="test")
        {

            var entry = await _context.Entry.FindAsync(id);
        

            
            if (entry == null)
            {
                return NotFound();
            }

            //deleted entries to garbage
            GarbageEntry garbage = new GarbageEntry();
            garbage = _mapper.Map<GarbageEntry>(entry);
            garbage.deletedFor = reason;
            garbage.deletedDate = DateTime.Now;
            _context.GarbageEntry.Add(garbage);

            //entry delete
            _context.Entry.Remove(entry);


           
            
            //delete yapılınca başlıktaki updatedate'i tekrar eski tarihe çek yapıldı
            if (_context.Entry.Where(s => (s.subjectId == entry.subjectId))
            .OrderByDescending(e => e.createDate).FirstOrDefault() != null)
            {
                var list = _context.Entry.Where(s => (s.subjectId == entry.subjectId))
            .OrderByDescending(e => e.createDate).FirstOrDefault();
                var list2 = _context.Subject.Where(s => s.id == entry.subjectId).FirstOrDefault();
                list2.updateDate = list.createDate;
                list2.totalCount = list2.totalCount - 1;
                _context.Subject.Update(list2);
            }
            else
            {
                var subject = await _context.Subject.FindAsync(entry.subjectId);
                _context.Subject.Remove(subject);
                
            }
            _context.SaveChanges();
            return entry;
        }

        private bool EntryExists(int id)
        {
            return _context.Entry.Any(e => e.id == id);
        }
       
    }
}
