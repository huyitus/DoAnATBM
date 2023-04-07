using System;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormCreateUser : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormCreateUser()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void buttonCreate_Click(object sender, EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("Create_NewUser", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = "c##" + textName.Text;
            cmd.Parameters.Add("Pass_Word", OracleDbType.NVarchar2).Value = textPass.Text;

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

        private void FormCreateUser_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
    }
}
