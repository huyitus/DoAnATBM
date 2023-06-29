using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnATBM
{
    public partial class FormXemAudit : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormXemAudit()
        {
            InitializeComponent();

            try
            {
                oracleConnection = Global.CreateConnection();
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
            var queryString = "SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT FROM unified_audit_trail WHERE object_name = 'PHANCONG'";

            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            dataGrid.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }

        private void FormXemAudit_FormClosing(object sender, FormClosingEventArgs e)
        {
            oracleConnection.Close();
            oracleConnection.Dispose();
        }
    }
}
