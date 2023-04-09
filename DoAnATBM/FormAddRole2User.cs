using System;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormAddRole2User : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormAddRole2User()
        {
            InitializeComponent();
            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }
        private void buttonAddRole2User_Click(object sender, System.EventArgs e)
        {
            String user = textName.Text.ToUpper();
            String role = textRole.Text;


            OracleCommand cmd = new OracleCommand("Grant "+ role + " TO "+ user, oracleConnection);
            cmd.CommandType = System.Data.CommandType.Text;
            
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Cấp quyền thành công", "Thông báo");
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


        private void FormAddRole2User_Load(object sender, EventArgs e)
        {

        }
    }
}
