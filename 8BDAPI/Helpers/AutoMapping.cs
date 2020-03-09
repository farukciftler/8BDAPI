using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _8BDAPI.Models;
namespace _8BDAPI
{
    public class AutoMapping : Profile
    {
        public AutoMapping()
        {
            CreateMap<Entry, GarbageEntry>()
                .ForMember(dest => dest.id, mo => mo.Ignore());
        }
    }
}
