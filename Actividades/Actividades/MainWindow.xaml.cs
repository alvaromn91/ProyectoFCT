using System;
using System.Diagnostics;
using System.Threading;
using System.Windows;

namespace Actividades
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static string SelectedGamePath;
        public MainWindow()
        {
            InitializeComponent();
            Data manager = new Data();
            manager.MaxHeight = 390;
            manager.MaxWidth = 690;
            manager.RowHeight = manager.MaxHeight / 3;
            manager.ItemWidth = manager.MaxWidth / 3;
            manager.ActionButton = manager.RowHeight * 0.35f;
            manager.ImageButton = manager.RowHeight * 0.6;

            Globals.LoadRoutes();

            DataContext = manager;
        }

        public void DisplayValo(object sender, RoutedEventArgs e)
        {
            ActionValo.Visibility = ActionValo.Visibility == Visibility.Visible ? Visibility.Hidden : Visibility.Visible;
        }
        public void LaunchValo(object sender, RoutedEventArgs e)
        {
            this.Hide();
            SelectedGamePath = Globals.GamesDict["Riot"];
            this.StartApp();
            this.Show();
        }

        public void StartApp()
        {
            Process game = new Process();
            game.StartInfo.FileName = SelectedGamePath;

            try
            {
                game.Start();

                while (!game.HasExited)
                    Thread.Sleep(2000);
            }
            catch(Exception ex)
            {
                var t = ex.Message;
                MessageBox.Show(t);
            }
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
