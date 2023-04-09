using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormRevokeRole2User : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormRevokeRole2User()
        {
            InitializeComponent();
            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }
        private void buttonRevokeRole2User_Click(object sender, System.EventArgs e)
        {

            String user = textName.Text.ToUpper();
            String role = textRole.Text;


            OracleCommand cmd = new OracleCommand("Revoke " + role + " FROM " + user, oracleConnection);
            cmd.CommandType = System.Data.CommandType.Text;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Thu hồi role thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }
        private void FormRevokeRole2User_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
        private void FormRevokeRole2User_Load(object sender, EventArgs e)
        {

        }
    }
}
