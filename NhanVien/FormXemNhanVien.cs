using Oracle.ManagedDataAccess.Client;
using System.Windows.Forms;
using System;
using System.Data;

namespace NhanVien
{
    public partial class FormXemNhanVien : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormXemNhanVien()
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
            var queryString = "SELECT * FROM ADMIN.UV_NHANVIEN_NHANVIEN";

            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            dataGrid.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }

        private void FormNhanVien_FormClosing(object sender, FormClosingEventArgs e)
        {
            oracleConnection.Close();
            oracleConnection.Dispose();
        }
    }
}
