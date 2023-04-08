using System;
using System.Collections.Generic;
using System.Windows.Forms;

using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FormDropUser : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormDropUser()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void buttonDrop_Click(object sender, EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("Drop_User", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = "C##" + textName.Text.ToUpper();

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Xóa thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }

        private void FormDropUser_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }
    }
}
