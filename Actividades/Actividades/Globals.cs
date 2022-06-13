using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Actividades
{
    public class Globals
    {
        public static Dictionary<string, string> GamesDict;

        
        public static void LoadRoutes()
        {
            if (GamesDict is null)
                GamesDict = new Dictionary<string, string>();

            GamesDict.Add( "Riot", ReadAppConfig<string>("Riot"));
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
