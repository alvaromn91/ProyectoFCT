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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SZ.Pages
{
    /// <summary>
    /// Lógica de interacción para GetStudent.xaml
    /// </summary>
    public partial class GetStudent : Page
    {
        public GetStudent()
        {
            InitializeComponent();
            App.Parent.title2.Visibility = Visibility.Collapsed;
            App.Parent.DataContext = null;
        }

        private void btn_Search_Click(object sender, RoutedEventArgs e)
        {
            var datos = new AccesoDatos().GetStudent(tb_Name.Text.ToString(), tb_SN1.Text.ToString(), tb_SN2.Text.ToString());

            Student

            datos.Count();

            sp_Data.Visibility = Visibility.Visible;
            btn_back.Visibility = Visibility.Visible;
        }

        private void btn_back_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new MainMenu());
        }
         public void BuscarEstudiante(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Hacer cosas , vagos.");
        }
    }
}
