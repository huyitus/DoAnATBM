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

                string work = username.Substring(0, 2).ToUpper();
                if (work == "NV")
                {
                    FormFeatures_NV form = new FormFeatures_NV();
                    form.Show();
                }
                else if (work == "GD")
                {
                    FormFeatures_GD form = new FormFeatures_GD();
                    form.Show();
                }
                else if (work == "NS")
                {
                    FormFeatures_NS form = new FormFeatures_NS();
                    form.Show();
                }
                else if (work == "TC")
                {
                    FormFeatures_TC form = new FormFeatures_TC();
                    form.Show();
                }
                else if (work == "TD")
                {
                    FormFeatures_TDA form = new FormFeatures_TDA();
                    form.Show();
                }
                else if (work == "QL")
                {
                    FormFeaturesQLTrucTiep form = new FormFeaturesQLTrucTiep();
                    form.Show();
                }
                else if (work == "TP")
                {
                    FormFeaturesQLTrucTiep form = new FormFeaturesQLTrucTiep();
                    form.Show();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
