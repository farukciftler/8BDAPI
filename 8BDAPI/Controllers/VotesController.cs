﻿using System;
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
    public class VotesController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public VotesController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/Votes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vote>>> GetVote()
        {
            return await _context.Vote.ToListAsync();
        }

        // GET: api/Votes/5
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
        [HttpPost]
        public async Task<ActionResult<Vote>> PostVote(Vote vote)
        {
            _context.Vote.Add(vote);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVote", new { id = vote.id }, vote);
        }

        [HttpPost("likevote")]
        public async Task<ActionResult<int>> LikeVote(Vote vote)
        {
            
            var likesame = _context.Vote.Where(s => s.type == 1 && s.userId == vote.userId && vote.entryId == s.entryId).Count();
            if(likesame == 0 )
            {
            var unlikesame = _context.Vote.Where(s => s.type == 0 && s.userId == vote.userId && vote.entryId == s.entryId).Count();
            if(unlikesame>0)
                {
                    var c = _context.Vote.Where(s => s.type == 0 && s.userId == vote.userId && vote.entryId == s.entryId).ToList();
                    _context.Vote.RemoveRange(c);

                    
                }
                _context.Vote.Add(vote);
                await _context.SaveChangesAsync();
            }

            var count = _context.Vote.Where(s => s.type == 1 && vote.entryId == s.entryId).Count();

            return count;
        }

        [HttpPost("unlikevote")]
        public async Task<ActionResult<int>> UnLikeVote(Vote vote)
        {
            var unlikesame = _context.Vote.Where(s => s.type == 0 && s.userId == vote.userId && vote.entryId == s.entryId).Count();
            if (unlikesame == 0)
            {
                var likesame = _context.Vote.Where(s => s.type == 1 && s.userId == vote.userId && vote.entryId ==s.entryId).Count();
                if (likesame > 0)
                {
                    var c = _context.Vote.Where(s => s.type == 1 && s.userId == vote.userId && vote.entryId == s.entryId).ToList();
                    _context.Vote.RemoveRange(c);

                }
                _context.Vote.Add(vote);

                await _context.SaveChangesAsync();
            }

            var count = _context.Vote.Where(s => s.type == 0 && vote.entryId == s.entryId).Count();

            return count;
        }
        [HttpGet("countlike/{id}")]
        public ActionResult<int> CountLike(int id)
        {
            var count = _context.Vote.Where(s => s.type == 1 && s.entryId == id).Count();

            return count;
        }

        [HttpGet("countunlike/{id}")]
        public  ActionResult<int> CountUnlike(int id)
        {
            var count =  _context.Vote.Where(s => s.type == 0 && s.entryId == id).Count();

            return count;
        }

        // DELETE: api/Votes/5
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
