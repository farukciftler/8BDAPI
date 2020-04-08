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
using _8BDAPI.Helpers.Pagination;
using System.Security.Claims;

namespace _8BDAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubjectsController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public SubjectsController(_8BDAPIContext context)
        {
            _context = context;
        }
        
        // GET: api/Subjects
      
        [HttpGet]
        public virtual IPagedList<Subject> GetSubject(int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = _context.Subject.OrderByDescending(x => x.updateDate);

            var subject = new PagedList<Subject>(query, pageIndex, pageSize);
            
            return subject;
        }

        // GET: api/Subjects/5
        [Authorize(Roles = "developer")]
        [HttpGet("{id}")]
        public async Task<ActionResult<Subject>> GetSubject(int id)
        {
            var subject = await _context.Subject.FindAsync(id);

            if (subject == null)
            {
                return NotFound();
            }

            return subject;
        }
        
        [HttpGet("title/{subjecto}")]
        public ActionResult<Subject> GetSubjectByName(string subjecto)
        {
            var subject = _context.Subject.Where(s => s.subject == subjecto).FirstOrDefault();

            if (subject == null)
            {
                return NotFound();
            }

            return subject;
        }
        [HttpGet("id/{subjecto}")]
        public ActionResult<Subject> GetSubjectById(int subjecto)
        {
            var subject = _context.Subject.Where(s => s.id == subjecto).FirstOrDefault();

            if (subject == null)
            {
                return NotFound();
            }

            return subject;
        }

        // PUT: api/Subjects/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        //[Authorize(Roles = "developer")]
        [HttpGet("edit/{id}/{newsubject}")]
        public async Task<ActionResult<Subject>> edit(int id, string newsubject)
        {
            var subject = _context.Subject.Where(s => s.id == id).FirstOrDefault();
            subject.subject = newsubject;

            _context.Entry(subject).State = EntityState.Modified;
            

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SubjectExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return subject;
        }

        // POST: api/Subjects
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize(Roles = "developer")]
        [HttpPost]
        public async Task<ActionResult<Subject>> PostSubject(Subject subject)
        {
            string username = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var user = _context.User.Where(s => s.username == username).FirstOrDefault();
            subject.authorId = user.id;
            subject.isActive = 1;
            subject.BSHIU = "00000";
            subject.createDate = DateTime.Now;
            subject.updateDate = DateTime.Now;
            _context.Subject.Add(subject);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSubject", new { id = subject.id }, subject);
        }

        // DELETE: api/Subjects/5
       // [Authorize(Roles = "developer")]
        [HttpGet("delete/{id}")]
        public async Task<ActionResult<Subject>> DeleteSubject(int id)
        {
            var subject = await _context.Subject.FindAsync(id);
            if (subject == null)
            {
                return NotFound();
            }
            var c = _context.Entry.Where(s => s.subjectId == id).ToList();
            _context.Entry.RemoveRange(c);
            _context.Subject.Remove(subject);
            await _context.SaveChangesAsync();

            return subject;
        }

        private bool SubjectExists(int id)
        {
            return _context.Subject.Any(e => e.id == id);
        }
    }
}
