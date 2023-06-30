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
    public partial class XemPhanCongCuaPhong : Form
    {
        private readonly OracleConnection oracleConnection;
        public XemPhanCongCuaPhong()
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
            var queryString = "SELECT * FROM ADMIN.UV_TRPHG_NHANVIEN";

            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            dataGrid.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
