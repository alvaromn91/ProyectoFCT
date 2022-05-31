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
using System.Windows.Shapes;

namespace SZ
{
    /// <summary>
    /// Lógica de interacción para Actividades.xaml
    /// </summary>
    public partial class Actividades : Window
    {
        public Actividades()
        {
            InitializeComponent();
            Data manager = new Data();
            manager.MaxHeight = 390;
            manager.MaxWidth = 690;
            manager.RowHeight = manager.MaxHeight / 3;
            manager.ItemWidth = manager.MaxWidth / 3 ;
            manager.ActionButton = manager.RowHeight * 0.6f;
            manager.ImageButton = manager.RowHeight * 0.4f;

            DataContext = manager;

        }
    }

    public partial class Data
    {
        public double MaxWidth { get; set; }
        public double MaxHeight { get; set; }
        public double RowHeight { get; set; }
        public double ItemWidth { get; set; }
        public double ActionButton { get; set; }
        public double ImageButton { get; set; }
    }
}
