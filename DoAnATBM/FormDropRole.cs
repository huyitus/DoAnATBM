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
    public partial class FormDropRole : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormDropRole()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FormDropRole_Load(object sender, EventArgs e)
        {

        }
        private void buttonDropRole_Click(object sender, System.EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("drop_role", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = "C##" + textName.Text;

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

        private void FormCreateRole_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void FormCreateRole_Load(object sender, System.EventArgs e)
        {

        }
    }
}
