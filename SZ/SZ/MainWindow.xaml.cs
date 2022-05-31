using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Media;
using System.Windows.Navigation;
using SZ.Pages;


namespace SZ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        Login login = new Login();
        private MediaPlayer mp = new MediaPlayer();
        private bool pulsado = false;
        public MainWindow()
        {
            InitializeComponent();
            mp.Open(new Uri("Music/song.mp3", UriKind.Relative));
            mp.Volume = 0.3;
            //mostrarPaginaInicio();
            new Actividades().ShowDialog();
        }
        public void mostrarPaginaInicio()
        {
            App.Parent = this;
            this.parent.Navigate(login);
        }

        private void btn_Search_S_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM_Search_S.Visibility = Visibility.Visible;
            title.Visibility = Visibility.Collapsed;
        }

        private void btn_Twitter_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://twitter.com/home",
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void btn_Instagram_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://www.instagram.com/?hl=es",
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void btn_Facebook_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://es-es.facebook.com/",
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void btn_Add_S_Click(object sender, RoutedEventArgs e)
        {
            parent.NavigationService.Navigate(new AddStudent());
            title.Visibility = Visibility.Collapsed;
        }

        private void btn_Students_Click(object sender, RoutedEventArgs e)
        {
            if (stp_SubM_Students.Visibility == Visibility.Visible)
            {
                stp_SubM_Students.Visibility = Visibility.Collapsed;
            }
            else
            {
                stp_SubM_Students.Visibility = Visibility.Visible;
            }
        }

        private void btn_Group_Click(object sender, RoutedEventArgs e)
        {
            if (stp_SubM2_Group.Visibility == Visibility.Visible)
            {
                stp_SubM2_Group.Visibility = Visibility.Collapsed;
            }
            else
            {
                stp_SubM2_Group.Visibility = Visibility.Visible;
            }
        }

        private void btn_School_Click(object sender, RoutedEventArgs e)
        {
            if (stp_SubM1_Group.Visibility == Visibility.Visible)
            {
                stp_SubM1_Group.Visibility = Visibility.Collapsed;
            }
            else
            {
                stp_SubM1_Group.Visibility = Visibility.Visible;
            }
        }

        private void btn_Teachers_Click(object sender, RoutedEventArgs e)
        {
            if (stp_SubM_Teachers.Visibility == Visibility.Visible)
            {
                stp_SubM_Teachers.Visibility = Visibility.Collapsed;
            }
            else
            {
                stp_SubM_Teachers.Visibility = Visibility.Visible;
            }
        }

        private void btn_Parents_Click(object sender, RoutedEventArgs e)
        {
            if (stp_SubM_Parents.Visibility == Visibility.Visible)
            {
                stp_SubM_Parents.Visibility = Visibility.Collapsed;
            }
            else
            {
                stp_SubM_Parents.Visibility = Visibility.Visible;
            }
        }
        public void HandleNavigating(Object sender, NavigatingCancelEventArgs e)
        {
            if (e.NavigationMode == NavigationMode.Forward || e.NavigationMode == NavigationMode.Back)
            {
                e.Cancel = true;
            }
        }

        private void btn_Add_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_G_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_U_S_Click(object sender, RoutedEventArgs e)
        {
            parent.NavigationService.Navigate(new GetStudent());
        }

        private void btn_Modify_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_S_Click(object sender, RoutedEventArgs e)
        {
            parent.NavigationService.Navigate(new DeleteStudent());
        }

        private void btn_Search_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Modify_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Create_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Mod_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Data_Sc_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Mod_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Del_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }
        private void btn_Pause_Click(object sender, RoutedEventArgs e)
        {
            mp.Pause();
        }
        private void btn_play_Click(object sender, RoutedEventArgs e)
        {
            mp.Play();
        }
        private void btn_stop_Click(object sender, RoutedEventArgs e)
        {
            mp.Stop();
        }

        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            mp.Volume = sl_vol.Value;
        }

        private void btn_Music_Click(object sender, RoutedEventArgs e)
        {
            if (!pulsado)
            { 
                sp_mus.Visibility = Visibility.Visible;
                mp.Play();
                pulsado = true;
            }
            else 
            {
                sp_mus.Visibility = Visibility.Collapsed;
                mp.Stop();
                pulsado = false;
            }
        }

        private void btn_aboutUs_Click(object sender, RoutedEventArgs e)
        {
            parent.NavigationService.Navigate(new Credits());
        }
    }
}
