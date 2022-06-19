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
    /// Lógica de interacción para MainMenu.xaml
    /// </summary>
    public partial class MainMenu : Page
    {
        public MainMenu()
        {
            InitializeComponent();
            switch (App.nick.Substring(0, 1))
            {
                case "T":
                    btn_S_Buscar.Visibility = Visibility.Visible;
                    btn_S_Notas.Visibility = Visibility.Visible;
                    st_par.Visibility = Visibility.Hidden;
                    st_sch.Visibility = Visibility.Hidden;
                    st_doc.Visibility = Visibility.Hidden;
                    break;
                case "S":
                    st_par.Visibility = Visibility.Hidden;
                    st_sch.Visibility = Visibility.Hidden;
                    st_doc.Visibility = Visibility.Hidden;
                    btn_S_Notas.Visibility = Visibility.Visible;
                    btn_S_Actividades.Visibility = Visibility.Visible;
                    break;
                case "P":
                    st_par.Visibility = Visibility.Hidden;
                    st_sch.Visibility = Visibility.Hidden;
                    st_doc.Visibility = Visibility.Hidden;
                    btn_S_Notas.Visibility = Visibility.Visible;
                    break;
                case "M":
                    btn_S_Notas.Visibility = Visibility.Hidden;
                    btn_S_Add.Visibility = Visibility.Visible;
                    btn_S_Buscar.Visibility = Visibility.Visible;
                    btn_S_Delete.Visibility = Visibility.Visible;
                    btn_S_Modify.Visibility = Visibility.Visible;                    
                    break;
            }            
        }

        private void btn_Student_Click(object sender, RoutedEventArgs e)
        {
            if (Sub_Students.Visibility == Visibility.Visible)
            {
                Sub_Students.Visibility = Visibility.Collapsed;
            }
            else
            {
                Sub_Students.Visibility = Visibility.Visible;
                Sub_Teachers.Visibility = Visibility.Collapsed;
                Sub_School.Visibility = Visibility.Collapsed;
                Sub_Parents.Visibility = Visibility.Collapsed;
            }
        }

        private void btn_Teachers_Click(object sender, RoutedEventArgs e)
        {
            if (Sub_Teachers.Visibility == Visibility.Visible)
            {
                Sub_Teachers.Visibility = Visibility.Collapsed;
            }
            else
            {
                Sub_Teachers.Visibility = Visibility.Visible;
                Sub_Students.Visibility = Visibility.Collapsed;
                Sub_School.Visibility = Visibility.Collapsed;
                Sub_Parents.Visibility = Visibility.Collapsed;
            }
        }

        private void btn_Parents_Click(object sender, RoutedEventArgs e)
        {
            if (Sub_Parents.Visibility == Visibility.Visible)
            {
                Sub_Parents.Visibility = Visibility.Collapsed;
            }
            else
            {
                Sub_Parents.Visibility = Visibility.Visible;
                Sub_Students.Visibility = Visibility.Collapsed;
                Sub_School.Visibility = Visibility.Collapsed;
                Sub_Teachers.Visibility = Visibility.Collapsed;
            }
        }

        private void btn_School_Click(object sender, RoutedEventArgs e)
        {
            if (Sub_School.Visibility == Visibility.Visible)
            {
                Sub_School.Visibility = Visibility.Collapsed;
            }
            else
            {
                Sub_School.Visibility = Visibility.Visible;
                Sub_Parents.Visibility = Visibility.Collapsed;
                Sub_Students.Visibility = Visibility.Collapsed;
                Sub_Teachers.Visibility = Visibility.Collapsed;
            }
        }

        private void btn_S_Add_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new AddStudent());
        }

        private void btn_S_Buscar_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new GetStudent());
        }

        private void btn_S_Delete_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new DeleteStudent());
        }

        private void btn_S_Notas_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new PonerNotas());
        }

        private void btn_S_Actividades_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new Actividades());
        }
    }
}
