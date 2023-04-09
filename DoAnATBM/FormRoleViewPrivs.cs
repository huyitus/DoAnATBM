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

namespace DoAnATBM
{
    public partial class FormRoleViewPrivs : Form
    {

        private readonly OracleConnection oracleConnection;
        public FormRoleViewPrivs()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FormRoleViewPrivs_Load(object sender, EventArgs e)
        {

        }

        private void buttonView_Click(object sender, EventArgs e)
        {
            var queryString = "select * from role_tab_privs where role='" + textRole.Text.ToUpper() + "'";

            try
            {
                var dataTable = new DataTable();

                var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
                dataAdapter.Fill(dataTable);

                gridView.DataSource = dataTable;

                dataAdapter.Dispose();
                dataTable.Dispose();
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }

        }

        private void FormRoleViewPrivs_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void gridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
