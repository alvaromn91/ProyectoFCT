using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SZ
{
    public class AcademicoEstudiante
    {
        private string _nombre;
        private string _apellido1;
        private string _apellido2;
        private int _notasTrim1;
        private int _notasTrim2;
        private int _notasTrim3;
        private int _notasFinal;
        private int _faltas1;
        private int _faltas2;
        private int _faltas3;
        private int _faltasFinal;
        private int _justificadas1;
        private int _justificadas2;
        private int _justificadas3;
        private int _justificadasFinal;
        private int _retrasos1;
        private int _retrasos2;
        private int _retrasos3;
        private int _retrasosFinal;
        private string _ciclo;
        private int _curso;
        private string _clase;
        private string _doc_nick;

        public AcademicoEstudiante(List<object>param)
        {
            _nombre = param[0].ToString();
            _apellido1 = param[1].ToString();
            _apellido2 = param[2].ToString();
            _notasTrim1 = int.Parse(param[3].ToString());
            _notasTrim2 = int.Parse(param[4].ToString());
            _notasTrim3 = int.Parse(param[5].ToString());
            _notasFinal = int.Parse(param[6].ToString());
            _faltas1 = int.Parse(param[7].ToString());
            _faltas2 = int.Parse(param[8].ToString());
            _faltas3 = int.Parse(param[9].ToString());
            _faltasFinal = int.Parse(param[10].ToString());
            _justificadas1 = int.Parse(param[11].ToString());
            _justificadas2 = int.Parse(param[12].ToString());
            _justificadas3 = int.Parse(param[13].ToString());
            _justificadasFinal = int.Parse(param[14].ToString());
            _retrasos1 = int.Parse(param[15].ToString());
            _retrasos2 = int.Parse(param[16].ToString());
            _retrasos3 = int.Parse(param[17].ToString());
            _retrasosFinal = int.Parse(param[18].ToString());
            _ciclo = param[3].ToString();
            _curso = int.Parse(param[20].ToString());
            _clase = param[21].ToString();
            _doc_nick = param[22].ToString();
        }

        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido1 { get => _apellido1; set => _apellido1 = value; }
        public string Apellido2 { get => _apellido2; set => _apellido2 = value; }
        public int NotasTrim1 { get => _notasTrim1; set => _notasTrim1 = value; }
        public int NotasTrim2 { get => _notasTrim2; set => _notasTrim2 = value; }
        public int NotasTrim3 { get => _notasTrim3; set => _notasTrim3 = value; }
        public int NotasFinal { get => _notasFinal; set => _notasFinal = value; }
        public int Faltas1 { get => _faltas1; set => _faltas1 = value; }
        public int Faltas2 { get => _faltas2; set => _faltas2 = value; }
        public int Faltas3 { get => _faltas3; set => _faltas3 = value; }
        public int FaltasFinal { get => _faltasFinal; set => _faltasFinal = value; }
        public int Justificadas1 { get => _justificadas1; set => _justificadas1 = value; }
        public int Justificadas2 { get => _justificadas2; set => _justificadas2 = value; }
        public int Justificadas3 { get => _justificadas3; set => _justificadas3 = value; }
        public int JustificadasFinal { get => _justificadasFinal; set => _justificadasFinal = value; }
        public int Retrasos1 { get => _retrasos1; set => _retrasos1 = value; }
        public int Retrasos2 { get => _retrasos2; set => _retrasos2 = value; }
        public int Retrasos3 { get => _retrasos3; set => _retrasos3 = value; }
        public int RetrasosFinal { get => _retrasosFinal; set => _retrasosFinal = value; }
        public string Ciclo { get => _ciclo; set => _ciclo = value; }
        public int Curso { get => _curso; set => _curso = value; }
        public string Clase { get => _clase; set => _clase = value; }
        public string Doc_nick { get => _doc_nick; set => _doc_nick = value; }
    }
}
