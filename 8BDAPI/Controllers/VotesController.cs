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
    public class VotesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public VotesController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/Votes
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vote>>> GetVote()
        {
            return await _context.Vote.ToListAsync();
        }

        // GET: api/Votes/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<Vote>> GetVote(int id)
        {
            var vote = await _context.Vote.FindAsync(id);

            if (vote == null)
            {
                return NotFound();
            }

            return vote;
        }

        // PUT: api/Votes/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVote(int id, Vote vote)
        {
            if (id != vote.id)
            {
                return BadRequest();
            }

            _context.Entry(vote).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VoteExists(id))
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

        // POST: api/Votes
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Vote>> PostVote(Vote vote)
        {
            vote.voteDate = DateTime.Now;
            _context.Vote.Add(vote);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVote", new { id = vote.id }, vote);
        }

        // DELETE: api/Votes/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<ActionResult<Vote>> DeleteVote(int id)
        {
            var vote = await _context.Vote.FindAsync(id);
            if (vote == null)
            {
                return NotFound();
            }

            _context.Vote.Remove(vote);
            await _context.SaveChangesAsync();

            return vote;
        }

        private bool VoteExists(int id)
        {
            return _context.Vote.Any(e => e.id == id);
        }
    }
}
