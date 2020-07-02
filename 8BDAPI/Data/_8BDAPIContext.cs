using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using _8BDAPI.Models;

namespace _8BDAPI.Data
{
    public class _8BDAPIContext : DbContext
    {
        public _8BDAPIContext (DbContextOptions<_8BDAPIContext> options)
            : base(options)
        {
        }
        public new DbSet<_8BDAPI.Models.Entry> Entry { get; set; }

        public DbSet<_8BDAPI.Models.Subject> Subject { get; set; }

        public DbSet<_8BDAPI.Models.GarbageEntry> GarbageEntry { get; set; }

        public DbSet<_8BDAPI.Models.Vote> Vote { get; set; }

        public DbSet<_8BDAPI.Models.User> User { get; set; }

        public DbSet<_8BDAPI.Models.UserLevel> UserLevel { get; set; }

        public DbSet<_8BDAPI.Models.EntryNotice> EntryNotice { get; set; }
    }
}
