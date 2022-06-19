using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SZ
{
    class AcademicoEstudiante
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

        public AcademicoEstudiante(string nombre, string apellido1, string apellido2, int notasTrim1, int notasTrim2, int notasTrim3, int notasFinal, int faltas1, int faltas2, int faltas3, int faltasFinal, int justificadas1, int justificadas2, int justificadas3, int justificadasFinal, int retrasos1, int retrasos2, int retrasos3, int retrasosFinal, string ciclo, int curso, string clase)
        {
            _nombre = nombre;
            _apellido1 = apellido1;
            _apellido2 = apellido2;
            _notasTrim1 = notasTrim1;
            _notasTrim2 = notasTrim2;
            _notasTrim3 = notasTrim3;
            _notasFinal = notasFinal;
            _faltas1 = faltas1;
            _faltas2 = faltas2;
            _faltas3 = faltas3;
            _faltasFinal = faltasFinal;
            _justificadas1 = justificadas1;
            _justificadas2 = justificadas2;
            _justificadas3 = justificadas3;
            _justificadasFinal = justificadasFinal;
            _retrasos1 = retrasos1;
            _retrasos2 = retrasos2;
            _retrasos3 = retrasos3;
            _retrasosFinal = retrasosFinal;
            _ciclo = ciclo;
            _curso = curso;
            _clase = clase;
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
    }
}
