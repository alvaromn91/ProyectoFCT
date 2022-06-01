using System;
using System.Net.Sockets;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SZ.Net
{
    class Server
    {
        TcpClient client;
        public Server()
        {
            client = new TcpClient();
        }

        public void ConnectToServer()
        {
            if (client.Connected)
            {
                client.Connect("127.0.0.1", 7827);
            }
        }
    }
}
