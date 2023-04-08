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
    public partial class FormCreateRole : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormCreateRole()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FormCreateRole_Load(object sender, EventArgs e)
        {

        }

        private void buttonCreate_Click(object sender, System.EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("create_role", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = "c##" + textPass1.Text;
            cmd.Parameters.Add("pass_word", OracleDbType.NVarchar2).Value = textPass2.Text;

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
        private void textPass_TextChanged(object sender, EventArgs e)
        {

        }

        private void textPass2_TextChanged(object sender, EventArgs e)
        {

        }
    }


}

