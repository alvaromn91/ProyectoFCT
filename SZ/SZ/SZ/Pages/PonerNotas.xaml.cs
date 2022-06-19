using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
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
    /// Lógica de interacción para PonerNotas.xaml
    /// </summary>
    public partial class PonerNotas : Page
    {
        List<AcademicoEstudiante> listaNotas = new List<AcademicoEstudiante>();
        public PonerNotas()
        {
            InitializeComponent();
            listaNotas = rellenarLista("TJOY-JUROCAT");
            grdNotas.ItemsSource = listaNotas;

        }
        private List<AcademicoEstudiante> rellenarLista(string nick)
        {
            List<AcademicoEstudiante> listaEstu = new List<AcademicoEstudiante>();
            List<object> listaObjetos = new List<object>();
            int cont = 0;
            foreach (var a in new AccesoDatos().NotasEstu(nick))
            {
                listaObjetos.Add(a);
                cont++;
                if (cont == 23)
                {
                    listaEstu.Add(new AcademicoEstudiante(listaObjetos));
                    listaObjetos = new List<object>();
                    cont = 0;
                }
            }
            return listaEstu;
        }
            
    }
    
}
