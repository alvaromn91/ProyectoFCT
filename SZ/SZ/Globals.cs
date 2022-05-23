using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SZ
{
    public class Globals
    {
        public static Dictionary<string, string> minigames;

        
        public void LoadRoutes()
        {
            if (minigames is null)
                minigames = new Dictionary<string, string>();

            //minigames.Add( "appname" , ConfigurationManager.AppSettings["appname"] ?? null);
            minigames.Add( "appname", ReadAppConfig("appname"));
        }

        public static string ReadAppConfig(string app)
        {
            var data = ConfigurationManager.AppSettings[app] ?? null;
            return data;
        }
    }
}
