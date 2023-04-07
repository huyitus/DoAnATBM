using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FromMain : Form
    {
        private readonly OracleConnection oracleConnection;

        public FromMain()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FromMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void ButtonUsers_Click(object sender, System.EventArgs e)
        {
            FormUsers formUsers = new FormUsers();
            formUsers.Show();
        }

        private void ButtonCreateUser_Click(object sender, System.EventArgs e)
        {
            FromCreateUser form = new FromCreateUser();
            form.Show();
        }
    }
}
