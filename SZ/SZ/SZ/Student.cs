using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using SZ;

namespace SZ
{
    class Student
    {
        private string _name;
        private string _surname1;
        private string _surname2;
        private DateTime _birth;
        private string _nationality;
        private string _country;
        private string _city;
        private string _postalCode;
        private string _address;
        private string _email;
        private string _medical;
        private string _observations;
        private string _photoRoute;
        private string _password;
        private string _stringBirth;
        public Student() 
        { 

        }

        public Student(string name, string surname1, string surname2, DateTime birth, string nationality, string country, string city, string postalCode, string address, string email, string password, string medical, string observations, string photoRoute)
        {
            Name = name;
            Surname1 = surname1;
            Surname2 = surname2;
            Birth = birth;
            Nationality = nationality;
            Country = country;
            City = city;
            PostalCode = postalCode;
            Address = address;
            Email = email;
            Password = password;
            Medical = medical;
            Observations = observations;
            PhotoRoute = photoRoute;
            StringBirth = Birth.ToString("dd/MM/yyyy");
        }

        public string Name { get => _name; set => _name = value; }
        public string Surname1 { get => _surname1; set => _surname1 = value; }
        public string Surname2 { get => _surname2; set => _surname2 = value; }
        public DateTime Birth { get => _birth; set => _birth = value; }
        public string Nationality { get => _nationality; set => _nationality = value; }
        public string Country { get => _country; set => _country = value; }
        public string City { get => _city; set => _city = value; }
        public string PostalCode { get => _postalCode; set => _postalCode = value; }
        public string Address { get => _address; set => _address = value; }
        public string Email { get => _email; set => _email = value; }
        public string Medical { get => _medical; set => _medical = value; }
        public string Observations { get => _observations; set => _observations = value; }
        public string PhotoRoute { get => _photoRoute; set => _photoRoute = value; }
        public string Password { get => _password; set => _password = value; }
        public string StringBirth { get => _stringBirth; set => _stringBirth = value; }

        
        
        //public int AddStudent(string name, string surname1, string surname2, DateTime birth, string nationality, string country, string city, string postalCode, string address, string email, string medical, string observations, string photoRoute)
        //{
        //    
        //}

    }
    


}
