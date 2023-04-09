using System;
using System.Data;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormUserViewPrivs : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormUserViewPrivs()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void buttonView_Click(object sender, EventArgs e)
        {
            var queryString = "select * from dba_tab_privs where GRANTEE = '" + textUser.Text.ToUpper() + "'";

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

        private void FormUserViewPrivs_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
    }
}
