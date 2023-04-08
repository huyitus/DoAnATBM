using System.Windows.Forms;

using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormAlterUser : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormAlterUser()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FormAlterUser_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void buttonUpdate_Click(object sender, System.EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("Alter_User", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = "C##" + textName.Text.ToUpper();
            cmd.Parameters.Add("Pass_Word", OracleDbType.Varchar2).Value = textPass.Text;

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Cập nhật thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }
    }
}
