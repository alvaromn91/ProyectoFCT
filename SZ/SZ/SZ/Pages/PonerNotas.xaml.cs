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
            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(new SqlParameter("@doc_nick", nick));

            using (DbContext context = new DbContext("datasource=localhost;port=3306;username=alvaro;password=12345678Aa;database=schoolerzz;"))
            {
                var lista = context.Database.SqlQuery<AcademicoEstudiante>("SELECT NOMBRE, " +
                                                                                    "APELLIDO_1, " +
                                                                                    "APELLIDO_2, " +
                                                                                    "NOTAS_TRIM_1, " +
                                                                                    "NOTAS_TRIM_2, " +
                                                                                    "NOTAS_TRIM_3, " +
                                                                                    "NOTAS_FINAL," +
                                                                                    "FALTAS_1," +
                                                                                    "FALTAS_2," +
                                                                                    "FALTAS_3," +
                                                                                    "FALTAS_FINAL," +
                                                                                    "JUSTIFICADAS_1," +
                                                                                    "JUSTIFICADAS_2," +
                                                                                    "JUSTIFICADAS_3," +
                                                                                    "JUSTIFICADAS_FINAL," +
                                                                                    "RETRASOS_1," +
                                                                                    "RETRASOS_2," +
                                                                                    "RETRASOS_3," +
                                                                                    "RETRASOS_FINAL," +
                                                                                    "CICLO," +
                                                                                    "CURSO," +
                                                                                    "CLASE," +
                                                                                    "DOC_NICK" +
                                                                                    "FROM vw_Notas_Alumnos" +
                                                                                    "WHERE '" +
                                                                                    "@doc_nick",
                                                                                    param.ToArray()).AsEnumerable<AcademicoEstudiante>();          
                foreach (AcademicoEstudiante a in lista)
                {
                    listaEstu.Add(a);
                }
            }
            return listaEstu;
        }
            
    }
    
}
