using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FromMain : Form
    {
        private OracleConnection oracleConnection;

        public FromMain()
        {
            InitializeComponent();
            ConnectToDatabase();
        }

        private void ConnectToDatabase()
        {
            oracleConnection = new OracleConnection(Global.CONNECT_STRING);
            oracleConnection.Open();
        }

        private void FromMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            oracleConnection.Close();
            oracleConnection.Dispose();
        }
    }
}
