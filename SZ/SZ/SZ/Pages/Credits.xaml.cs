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
    /// Lógica de interacción para Credits.xaml
    /// </summary>
    public partial class Credits : Page
    {
        public Credits()
        {
            InitializeComponent();
            App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
        }
        private void btn_back_Click(object sender, RoutedEventArgs e)
        {
            App.Parent.parent.NavigationService.Navigate(new MainMenu());
        }
    }
    
}
