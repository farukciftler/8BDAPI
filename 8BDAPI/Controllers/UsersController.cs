﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _8BDAPI.Data;
using _8BDAPI.Models;
using _8BDAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using _8BDAPI.Services;


namespace _8BDAPI.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly _8BDAPIContext _context;
        private readonly UserLevelHelper _usr;
        private readonly AuthHelper _auth;
        private IEmailSender _emailSender;
        private StringHelper _stringHelper;
        public UsersController(_8BDAPIContext context, UserLevelHelper usr, AuthHelper auth, IEmailSender emailSender, StringHelper stringHelper)
        {
            _context = context;
            _usr = usr;
            _auth = auth;
            _emailSender = emailSender;
            _stringHelper = stringHelper;
        }

            
        // GET: api/Users
        
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUser()
        {
            
            

            return await _context.User.ToListAsync();
        }

        // GET: api/Users/5
        [Authorize(Roles = "developer")]
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
           
            var user = await _context.User.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }


        // PUT: api/Users/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [Authorize(Roles ="developer")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.id)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
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

        // POST: api/Users
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {

            StringHelper _helper = new StringHelper();
            user.activationToken = _stringHelper.RandomString(8);
            user.activationTokenValidTime = DateTime.Now.AddHours(2);
            user.password = _helper.CalculateMD5Hash(user.password);
            user.lastLoginDate = DateTime.Now;
            user.registerDate = DateTime.Now;
            user.userLevel = 8; //now everyone developer
            user.isActive = 0;
            user.isApproved = 0;
            user.registerIp = "0000";
            _context.User.Add(user);
            await _context.SaveChangesAsync();
            _emailSender.Send(user.email, "kayit oldunuz", "tenkyubaby");
            return CreatedAtAction("GetUser", new { id = user.id }, user);
        }

        // DELETE: api/Users/5
        
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> DeleteUser(int id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.User.Remove(user);
            await _context.SaveChangesAsync();

            return user;
        }

        private bool UserExists(int id)
        {
            return _context.User.Any(e => e.id == id);
        }

        [HttpGet("userid/{id}")]
        public async Task<ActionResult<String>> GetUsernameById(int id)
        {

            var user = await _context.User.FindAsync(id);
            

            if (user == null)
            {
                return NotFound();
            }

            return user.username;
        }
    }
}
