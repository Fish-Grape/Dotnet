using ProtoBuf;
using System;
using System.Collections.Generic;
using System.Net.Http;
using WebAPIDemo;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            HttpClient client=new HttpClient();
            var stream = client.GetStreamAsync("http://127.0.0.1:5000/api/values").Result;
            var users = Serializer.Deserialize<List<User>>(stream);
            foreach (User item in users)
            {
                Console.WriteLine($"ID:{item.Id}-Name:{item.Name}-Age:{item.Age}");
            }
            Console.ReadKey();
        }
    }
}
