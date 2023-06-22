using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace NhanVien
{
    public partial class FormGD_NV : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormGD_NV()
        {

            InitializeComponent();

            try
            {
                string connStr = string.Format(Global.CONNECT_STRING, Session.username, Session.password);
                oracleConnection = new OracleConnection(connStr);
                oracleConnection.Open();

                Fetch();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }   
        }
        private void Fetch()
        {
            var queryString = "SELECT * FROM ADMIN.NHANVIEN";
            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            dataGrid.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }

        private void FormGD_NV_Load(object sender, EventArgs e)
        {

        }

        private void dataGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
