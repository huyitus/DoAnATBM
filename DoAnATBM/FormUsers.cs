using System.Data;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormUsers : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormUsers()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();

            FetchUsers();
        }

        private void FetchUsers()
        {
            var queryString = "SELECT * FROM all_users";
            
            var dataTable = new DataTable();

            var dataAdapter = new OracleDataAdapter(queryString, oracleConnection);
            dataAdapter.Fill(dataTable);

            UsersGridView.DataSource = dataTable;

            dataTable.Dispose();
            dataAdapter.Dispose();
        }

        private void FormUsers_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void UsersGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
