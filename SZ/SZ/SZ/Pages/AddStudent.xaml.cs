using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Net.Mail;
using System.Configuration;
using System.Web;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

namespace SZ.Pages
{
    /// <summary>
    /// Lógica de interacción para AddStudent.xaml
    /// </summary>
    public partial class AddStudent : Page
    {
       string contra;

        public AddStudent()
        {
            InitializeComponent();
        }

        private void btn_SignUp_Click(object sender, RoutedEventArgs e)
        {
            Random rdn = new Random();
            string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890%$#@";
            int longitud = caracteres.Length;
            char letra;
            int longitudContrasenia = 8;
            for (int i = 0; i < longitudContrasenia; i++)
            {
                letra = caracteres[rdn.Next(longitud)];
                contra += letra.ToString();
            }

            bool vacio = false;
            if (tb_Name.Text == string.Empty)
            {
                req_name.Visibility = Visibility.Visible;
                req_name.Foreground = Brushes.Red;
                vacio = true;
            }

            if (tb_Surname1.Text == string.Empty)
            {
                req_sn1.Visibility = Visibility.Visible;
                req_sn1.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_Surname2.Text == string.Empty)
            {
                req_sn2.Visibility = Visibility.Visible;
                req_sn2.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_Nationality.Text == string.Empty)
            {
                req_nat.Visibility = Visibility.Visible;
                req_nat.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_Country.Text == string.Empty)
            {
                req_cou.Visibility = Visibility.Visible;
                req_cou.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_City.Text == string.Empty)
            {
                req_cit.Visibility = Visibility.Visible;
                req_cit.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_PostalCode.Text == string.Empty)
            {
                req_pos.Visibility = Visibility.Visible;
                req_pos.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_Address.Text == string.Empty)
            {
                req_add.Visibility = Visibility.Visible;
                req_add.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_Email.Text == string.Empty)
            {
                req_ema.Visibility = Visibility.Visible;
                req_ema.Foreground = Brushes.Red;
                vacio = true;
            }
            
            if (cal_Birth.DisplayDate.Date == DateTime.Today.Date)
            {
                req_cal.Visibility = Visibility.Visible;
                req_cal.Foreground = Brushes.Red;
                vacio = true;
            }

            if (!vacio)
            {
                DateTime fecha = cal_Birth.SelectedDate.GetValueOrDefault();
                Student student = new Student(tb_Name.Text.ToString(), tb_Surname1.Text.ToString(), tb_Surname2.Text.ToString(), fecha, tb_Nationality.Text.ToString(), 
                                              tb_Country.Text.ToString(), tb_City.Text.ToString(), tb_PostalCode.Text.ToString(), tb_Address.Text.ToString(), 
                                              tb_Email.Text.ToString(), contra, tb_Medical.Text.ToString(), tb_Observations.Text.ToString(), 
                                              img_Photo.Source.ToString());
                AccesoDatos con = new AccesoDatos();
                int r = con.annadir_estudiante("JOYFE", student.Name, student.Surname1, student.Surname2, student.Birth, student.Nationality, student.Country, 
                                       student.City, student.PostalCode, student.Address, student.Email, student.Password, student.Medical, student.Observations, student.PhotoRoute);
                if (r == 0)
                {
                    tb_sign_up.Visibility = Visibility.Visible;
                    App.Parent.parent.NavigationService.Navigate(new AddStudent());
                }

                MailMessage msg = new MailMessage();

                msg.From = new MailAddress("schoolerzz@outlook.com");
                msg.To.Add(tb_Email.Text);//Correo destino
                msg.Subject = "Datos de acceso a Schoolerzz";
                msg.Body = "Bienvenido a Schoolerzz.\nAqui le dejamos su usuario y contraseña.\nUsuario: "+ new AccesoDatos().getNick(student.Email).Substring(1, 11) + "\nContraseña: " + student.Password;
                //msg.Priority = MailPriority.High;


                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("schoolerzz@outlook.com", "Joyfe2022");
                    client.Host = "smtp.office365.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;

                    client.Send(msg);
                    MessageBox.Show("hecho");
                }


            }
            else 
            {
                tb_forget.Visibility = Visibility.Visible;
            }

        }

        private void btn_Image_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();
            
            openFileDlg.DefaultExt = ".png";
            openFileDlg.Filter = "Image Files(*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF";
            openFileDlg.InitialDirectory = @"C:\Users\admin-dam2b\Pictures";
            openFileDlg.Multiselect = false;
            
            Nullable<bool> result = openFileDlg.ShowDialog();

            try
            {
                string archi = openFileDlg.FileName;
                BitmapImage bi = new BitmapImage();
                bi.BeginInit();
                bi.UriSource = new Uri(archi);
                bi.EndInit();
                img_Photo.Source = bi;
            }
            catch
            {
                MessageBox.Show("No has elegido Foto");
            }
        }
    }
}
