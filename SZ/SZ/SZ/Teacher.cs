using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SZ;

namespace SZ
{
    class Teacher
    {
        private string _name;
        private string _surname1;
        private string _surname2;
        private string _nameSurnames;
        private string nick;
        public Teacher(string nick)
        {
            AccesoDatos nuevo = new AccesoDatos();
            Nick = nick;
            List<string> lista = nuevo.GetTeacher(Nick);
            Name = lista[0];
            Surname1 = lista[1];
            Surname2 = lista[2];
            NameSurnames = Name + " " + Surname1 + " " + Surname2;
        }

        public string Name { get => _name; set => _name = value; }
        public string Surname1 { get => _surname1; set => _surname1 = value; }
        public string Surname2 { get => _surname2; set => _surname2 = value; }
        public string Nick { get => nick; set => nick = value; }
        public string NameSurnames { get => _nameSurnames; set => _nameSurnames = value; }
    }
}
