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
    /// Lógica de interacción para DeleteStudent.xaml
    /// </summary>
    public partial class DeleteStudent : Page
    {
        public DeleteStudent()
        {
            InitializeComponent();
        }

        private void btn_delete_Click(object sender, RoutedEventArgs e)
        {
            bool vacio = false;
            if (tb_Name.Text == string.Empty)
            {
                req_name.Visibility = Visibility.Visible;
                req_name.Foreground = Brushes.Red;
                vacio = true;
            }

            if (tb_SN1.Text == string.Empty)
            {
                req_SN1.Visibility = Visibility.Visible;
                req_SN1.Foreground = Brushes.Red;
                vacio = true;
            }
            if (tb_SN2.Text == string.Empty)
            {
                req_SN2.Visibility = Visibility.Visible;
                req_SN2.Foreground = Brushes.Red;
                vacio = true;
            }
            if (!vacio)
            {
                AccesoDatos con = new AccesoDatos();
                int s = con.DeleteStudent(tb_Name.Text.ToString(), tb_SN1.Text.ToString(),tb_SN2.Text.ToString());
                if (s == 0)
                {
                    tb_delete.Visibility = Visibility.Visible;
                    App.Parent.parent.NavigationService.Navigate(new DeleteStudent());
                }
                else
                {
                    tb_non_deleted.Visibility = Visibility.Visible;
                }
            }
        }
    }
}
