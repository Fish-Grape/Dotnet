using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace SignalRChat
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message)
        {
            // 客户端通过调用broadcastMessage来获取数据
            Clients.All.broadcastMessage(name,message);
        }



    }
}