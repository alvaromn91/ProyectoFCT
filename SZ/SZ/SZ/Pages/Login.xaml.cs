using SZ;
using SZ.Pages;
using System;
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


namespace SZ.Pages
{
    /// <summary>
    /// Lógica de interacción para Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btn_Login_Click(object sender, RoutedEventArgs e)
        {
            req1.Visibility = Visibility.Collapsed;
            req2.Visibility = Visibility.Collapsed;
            char rol;
            string bind;
            switch (cmb_Type.SelectedIndex)
            {
                case 0:
                    rol = 'P';
                    break;
                case 1:
                    rol = 'S';
                    break;
                case 2:
                    rol = 'T';
                    break;
                case 3:
                    rol = 'M';
                    break;
                default:
                    rol = 'X';
                    break;
            }
            if (rol == 'X')
            {
                MessageBox.Show("Elige un tipo de usuario");
            }
            else
            {
                if (tb_User.Text == string.Empty)
                {
                    req1.Visibility = Visibility.Visible;
                    req1.Foreground = Brushes.Red;
                }
                if (tb_Pass.Password == string.Empty)
                {
                    req2.Visibility = Visibility.Visible;
                    req2.Foreground = Brushes.Red;
                }
                AccesoDatos con = new AccesoDatos();
                int r = con.Login(rol, tb_User.Text.ToString(), tb_Pass.Password.ToString());
                if (r == 1)
                {
                    switch (rol)
                    {
                        case 'M':

                            tb_wrong_pass.Visibility = Visibility.Collapsed;
                            bind = rol + tb_User.Text.ToString();
                            App.nick = bind;
                            App.Parent.DataContext = new SchoolManager(bind);
                            App.Parent.stp_MenuLat.Visibility = Visibility.Visible;
                            App.Parent.parent.Navigate(new MainMenu());

                            App.Parent.title.Visibility = Visibility.Collapsed;
                            App.Parent.title2.Visibility = Visibility.Visible;
                            App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
                            App.Parent.stp_GorilaMenuLat.Visibility = Visibility.Visible;
                            App.Parent.stp_AU.Visibility = Visibility.Visible;

                            break;
                        case 'P':

                            tb_wrong_pass.Visibility = Visibility.Collapsed;
                            bind = rol + tb_User.Text.ToString();
                            App.nick = bind;
                            App.Parent.DataContext = new Parent(bind);
                            App.Parent.stp_MenuLat.Visibility = Visibility.Visible;
                            App.Parent.parent.Navigate(new MainMenu());

                            App.Parent.title.Visibility = Visibility.Collapsed;
                            App.Parent.title2.Visibility = Visibility.Visible;
                            App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
                            App.Parent.stp_GorilaMenuLat.Visibility = Visibility.Visible;
                            App.Parent.stp_AU.Visibility = Visibility.Visible;

                            break;
                        case 'T':

                            tb_wrong_pass.Visibility = Visibility.Collapsed;
                            bind = rol + tb_User.Text.ToString();
                            App.nick = bind;
                            App.Parent.DataContext = new Teacher(bind);
                            App.Parent.stp_MenuLat.Visibility = Visibility.Visible;
                            App.Parent.parent.Navigate(new MainMenu());

                            App.Parent.title.Visibility = Visibility.Collapsed;
                            App.Parent.title2.Visibility = Visibility.Visible;
                            App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
                            App.Parent.stp_GorilaMenuLat.Visibility = Visibility.Visible;
                            App.Parent.stp_AU.Visibility = Visibility.Visible;

                            break;
                        case 'S':

                            tb_wrong_pass.Visibility = Visibility.Collapsed;
                            bind = rol + tb_User.Text.ToString();
                            App.nick = bind;
                            App.Parent.DataContext = new Student(bind);
                            App.Parent.stp_MenuLat.Visibility = Visibility.Visible;
                            App.Parent.parent.Navigate(new MainMenu());

                            App.Parent.title.Visibility = Visibility.Collapsed;
                            App.Parent.title2.Visibility = Visibility.Visible;
                            App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
                            App.Parent.stp_GorilaMenuLat.Visibility = Visibility.Visible;
                            App.Parent.stp_AU.Visibility = Visibility.Visible;

                            break;
                        default:

                            tb_wrong_pass.Visibility = Visibility.Visible;

                            break;
                    }
                }
                else
                {
                    tb_wrong_pass.Visibility = Visibility.Visible;
                }
            }
        }
    }
}
