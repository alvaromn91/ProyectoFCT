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
        public static Dictionary<string, string> GamesDict;

        
        public static void LoadRoutes()
        {
            if (GamesDict is null)
                GamesDict = new Dictionary<string, string>();

            GamesDict.Add( "Game1", ReadAppConfig<string>("Game1"));
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
