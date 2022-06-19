using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;

namespace SZ
{
    public class AccesoDatos
    {
        //string connectionString = "datasource=localhost;port=3306;username=Jaime;password=1234;database=schoolerzz;";
        //string connectionString = "datasource=localhost;port=3306;username=oscar;password=1234;database=schoolerzz;";
        //string connectionString = "datasource=172.16.51.7;port=3306;username=alvaro;password=1234;database=schoolerzz;";
        string connectionString = "datasource=localhost;port=3306;username=alvaro;password=12345678Aa;database=schoolerzz;";

        MySqlConnection databaseConnection;



        public AccesoDatos()
        {
            databaseConnection = new MySqlConnection(connectionString);
        }
        public AccesoDatos(string servidorDatos, string puerto, string u, string pwd, string bbdd)
        {
            databaseConnection = new MySqlConnection("datasource=" + servidorDatos + ";port=" + puerto + ";username=" + u + ";password= " + pwd + ";database=" + bbdd + ";");
        }
        private void EstablecerConexion()
        {
            databaseConnection.Open();
        }

        public void CerrarConexion()
        {
            databaseConnection.Close();
        }

        public int Login(char pc_Char, string pv_Nick, string pv_Password)
        {
            string pv_Username = pc_Char + pv_Nick;
            MySqlCommand cmd = new MySqlCommand("pa_login", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add(new MySqlParameter("pc_char", pc_Char));
            cmd.Parameters.Add(new MySqlParameter("pv_username", pv_Username));
            cmd.Parameters.Add(new MySqlParameter("pv_password", pv_Password));
            cmd.Parameters.Add(new MySqlParameter("pv_success", MySqlDbType.Int32));
            cmd.Parameters["pv_success"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            int s = (int)cmd.Parameters["pv_success"].Value;

            CerrarConexion();

            return s;
        }
        public List<string> GetManager(string manager)
        {
            List<string> lista = new List<string>();
            MySqlCommand cmd = new MySqlCommand("pa_GetManager", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_Nick", manager));
            cmd.Parameters.Add(new MySqlParameter("pv_name", MySqlDbType.VarChar));
            cmd.Parameters.Add(new MySqlParameter("pv_sn1", MySqlDbType.VarChar));
            cmd.Parameters.Add(new MySqlParameter("pv_sn2", MySqlDbType.VarChar));
            cmd.Parameters["pv_name"].Direction = ParameterDirection.Output;
            cmd.Parameters["pv_sn1"].Direction = ParameterDirection.Output;
            cmd.Parameters["pv_sn2"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            lista.Add(cmd.Parameters["pv_name"].Value.ToString());
            lista.Add(cmd.Parameters["pv_sn1"].Value.ToString());
            lista.Add((string)cmd.Parameters["pv_sn2"].Value.ToString());
            CerrarConexion();
            return lista;

        }
        public int annadir_estudiante(string colegio, string name, string surname1, string surname2, DateTime birth, string nationality, string country, string city, string postalCode, string address, string email, string password, string medical, string observations, string photoRoute)
        {
            MySqlCommand cmd = new MySqlCommand("pa_anadir_estudiante", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pt_colegio", colegio)); 
            cmd.Parameters.Add(new MySqlParameter("pv_nombre", name));
            cmd.Parameters.Add(new MySqlParameter("pv_apellido1", surname1));
            cmd.Parameters.Add(new MySqlParameter("pv_apellido2", surname2));
            cmd.Parameters.Add(new MySqlParameter("pdt_nacimiento", birth));
            cmd.Parameters.Add(new MySqlParameter("pv_nacionalidad", nationality));
            cmd.Parameters.Add(new MySqlParameter("pv_pais", country));
            cmd.Parameters.Add(new MySqlParameter("pv_ciudad", city));
            cmd.Parameters.Add(new MySqlParameter("pi_cp", postalCode));
            cmd.Parameters.Add(new MySqlParameter("pv_direccion", address));
            cmd.Parameters.Add(new MySqlParameter("pv_email", email));
            cmd.Parameters.Add(new MySqlParameter("pv_contrasena", password));
            cmd.Parameters.Add(new MySqlParameter("pt_datMedico", medical));
            cmd.Parameters.Add(new MySqlParameter("pt_observaciones", observations));
            cmd.Parameters.Add(new MySqlParameter("pt_ruta_foto", photoRoute));

            cmd.Parameters.Add(new MySqlParameter("pi_r", MySqlDbType.Int32));
            cmd.Parameters["pi_r"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            int s = (int)cmd.Parameters["pi_r"].Value;

            CerrarConexion();
            return s;
        }
        public string GetLicence(string manager)
        {
            MySqlCommand cmd = new MySqlCommand("pa_GetLicence", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_School_Manager_Nick", manager)); // AÑADIR SCHOOL MANAGER
            cmd.Parameters.Add(new MySqlParameter("pv_Licence", MySqlDbType.VarChar));
            cmd.Parameters["pv_Licence"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            string s = (string)cmd.Parameters["pv_Licence"].Value;

            CerrarConexion();
            return s;
        }

        public List<object> GetStudent(string name, string surname1, string surname2)
        {
            List<object> lista = new List<object>();
            string sql = @"SELECT * FROM vw_Datos_Alumnos WHERE Nombre = @name AND Apellido_1 = @ap1 AND Apellido_2 = @ap2";
           
            MySqlCommand cmd = new MySqlCommand(sql, databaseConnection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new MySqlParameter("@name", name));
            cmd.Parameters.Add(new MySqlParameter("@ap1", surname1));
            cmd.Parameters.Add(new MySqlParameter("@ap2", surname2));

            EstablecerConexion();

            MySqlDataReader rdr = cmd.ExecuteReader(); // FALLAAAAAAAAAAAAA

            while(rdr.Read())
            {
                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    var result = rdr.GetValue(i);
                    lista.Add(result);
                }
            }            
            rdr.Close();
            CerrarConexion();
            
            return lista;
        }
        public List<object> NotasEstu (string nick)
        {
            List<object> lista = new List<object>();
            string sql = @"SELECT * FROM vw_notas_alumnos WHERE doc_nick = @nick";

            MySqlCommand cmd = new MySqlCommand(sql, databaseConnection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new MySqlParameter("@nick", nick));

            EstablecerConexion();

            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    var result = rdr.GetValue(i);
                    lista.Add(result);
                }
            }
            rdr.Close();
            CerrarConexion();

            return lista;
        }

        public string getNick( String email) {
            string sql = @"SELECT NICK FROM estudiantes WHERE email = @email limit 1";
            MySqlCommand cmd = new MySqlCommand(sql, databaseConnection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new MySqlParameter("@email", email));

            EstablecerConexion();

            MySqlDataReader rdr = cmd.ExecuteReader(); // FALLAAAAAAAAAAAAA
            if (rdr.Read()) {
                string nick = rdr.GetValue(0).ToString();
            
                rdr.Close();
                CerrarConexion();
                return nick;
            }
            else
            {
                return null;
            }
        }

        public int DeleteStudent(string name, string apellido1, string apellido2)
        {
            MySqlCommand cmd = new MySqlCommand("pa_DeleteStudent", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_Name", name));
            cmd.Parameters.Add(new MySqlParameter("pv_SN1", apellido1));
            cmd.Parameters.Add(new MySqlParameter("pv_SN2", apellido2));
            cmd.Parameters.Add(new MySqlParameter("pi_out", MySqlDbType.Int32));
            cmd.Parameters["pi_out"].Direction = ParameterDirection.Output;
            EstablecerConexion();

            cmd.ExecuteNonQuery();
            int s = (int)cmd.Parameters["pi_out"].Value;
            CerrarConexion();
            return s;
        }
    }    
}
