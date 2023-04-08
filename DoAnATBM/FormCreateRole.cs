using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormCreateRole : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormCreateRole()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void buttonCreate_Click(object sender, System.EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("create_role", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = "C##" + textName.Text;
            cmd.Parameters.Add("pass_word", OracleDbType.Varchar2).Value = textPass.Text;

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Tạo thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }

        private void FormCreateRole_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
    }


}

