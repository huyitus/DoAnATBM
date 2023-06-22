using System;
using Oracle.ManagedDataAccess.Client;
using System.Windows.Forms;

namespace NhanVien
{
    public partial class FormMain : Form
    {
        private OracleConnection oracleConnection;

        public FormMain()
        {
            InitializeComponent();
        }

        private void btnok_Click(object sender, EventArgs e)
        {
            string username = textus.Text;
            string password = textpw.Text;
            string connStr = string.Format(Global.CONNECT_STRING, username, password);

            try
            {
                oracleConnection = Global.CreateConnection(connStr);
                oracleConnection.Open();
                
                Session.username = username;
                Session.password = password;

                MessageBox.Show("Dang nhap thanh cong");

                FormFeatures_NV form = new FormFeatures_NV();
                form.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
