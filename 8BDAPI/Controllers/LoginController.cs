using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using _8BDAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace _8BDAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private IConfiguration _config;

        public LoginController(IConfiguration config)
        {
            _config = config;
        }

        public IActionResult Login(string username, string password)
        {
            User login = new User();
            login.username = username;
            login.password = password;
            IActionResult response = Unauthorized();

            var user = AuthenticateUser(login);

            if(user != null)
            {
                var tokenStr = GenerateJSONWebToken(user);
                response = Ok(new { token = tokenStr });
            }
            return response;
        }

        private User AuthenticateUser(User login)
        {
            User user = null;
            if (login.username == "asdsaasd" && login.password == "dsaadsdas")
            {
                user = new User
                {
                    id = 99,
                    username = "loquat",
                    password = "asdasd",
                    email = "loquat@reddoc.net",
                    userLevel = 6,
                    isApproved = 1,
                    isActive = 1,
                    registerIp = "0.0.0.0",
                    registerDate = DateTime.Now,
                    lastLoginDate = DateTime.Now
                };
            }
            return user;
        }
        private string GenerateJSONWebToken(User userinfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userinfo.username),
                new Claim(JwtRegisteredClaimNames.Email, userinfo.email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Issuer"],
                claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials);
            
            var encodetoken = new JwtSecurityTokenHandler().WriteToken(token);
            return encodetoken;
        }
        [Authorize]
        [HttpPost]
        public string Post()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            IList<Claim> claim = identity.Claims.ToList();
            var username = claim[0].Value;
            return "welcome to: " + username;
        }
        [Authorize]
        [HttpGet("GetValue")]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2", "value3" };
        }
    }
}