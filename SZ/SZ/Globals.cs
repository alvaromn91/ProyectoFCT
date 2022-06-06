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
            minigames.Add( "appname", ReadAppConfig<string>("appname"));
        }

        public static T ReadAppConfig<T>(string name, T def = default)
        {

            T value = def;
            var data = ConfigurationManager.AppSettings[name];
            try
            {
                value = (T)Convert.ChangeType(data, typeof(T));
            }
            catch { }
            return value;
        }
    }
}
