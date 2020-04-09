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
    public class UserLevelsController : ControllerBase
    {
        private readonly _8BDAPIContext _context;

        public UserLevelsController(_8BDAPIContext context)
        {
            _context = context;
        }

        // GET: api/UserLevels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserLevel>>> GetUserLevel()
        {
            return await _context.UserLevel.ToListAsync();
        }

        // GET: api/UserLevels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserLevel>> GetUserLevel(int id)
        {
            var userLevel = await _context.UserLevel.FindAsync(id);

            if (userLevel == null)
            {
                return NotFound();
            }

            return userLevel;
        }

        // PUT: api/UserLevels/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUserLevel(int id, UserLevel userLevel)
        {
            if (id != userLevel.id)
            {
                return BadRequest();
            }

            _context.Entry(userLevel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserLevelExists(id))
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

        // POST: api/UserLevels
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<UserLevel>> PostUserLevel(UserLevel userLevel)
        {
            _context.UserLevel.Add(userLevel);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUserLevel", new { id = userLevel.id }, userLevel);
        }

        // DELETE: api/UserLevels/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<UserLevel>> DeleteUserLevel(int id)
        {
            var userLevel = await _context.UserLevel.FindAsync(id);
            if (userLevel == null)
            {
                return NotFound();
            }

            _context.UserLevel.Remove(userLevel);
            await _context.SaveChangesAsync();

            return userLevel;
        }

        private bool UserLevelExists(int id)
        {
            return _context.UserLevel.Any(e => e.id == id);
        }
    }
}
