using System.Data;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormViewData : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormViewData()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FormViewData_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void buttonView_Click(object sender, System.EventArgs e)
        {
            var queryString = "select * from " + textName.Text;

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
    }
}
