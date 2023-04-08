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
    public partial class FormViewRoles : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormViewRoles()
        {
            InitializeComponent();
            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();

            FetchRole();
        }
        private void FetchRole()
        {
            var queryString = "SELECT * FROM dba_roles";

            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            RolesGridView.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }

        private void FormViewRoles_Load(object sender, EventArgs e)
        {

        }

        private void RolesGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void FormViewRoles_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
    }
}
