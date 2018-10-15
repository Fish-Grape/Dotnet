using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace WebAPIDemo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private IEnumerable<User> Users;

        public ValuesController()
        {
            Users = new User[] {
                new User(){Id=1,Name="Book",Age=1},
                new User(){Id=2,Name="asp.net core",Age=10},
            };
        }

        // GET api/values
        [HttpGet]
        [Produces("application/proto")]
        public IEnumerable<User> Get()
        {
            return Users;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        [Produces("application/proto")]
        public User Get(int id)
        {
            return Users.FirstOrDefault(r=>r.Id==id);
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
