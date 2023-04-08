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
    public partial class FormChangePW : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormChangePW()
        {
            InitializeComponent();
            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }
        private void buttonChangePW_Click(object sender, System.EventArgs e)
        {
            OracleCommand cmd = new OracleCommand("alter_role", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = "C##" + textName.Text;
            cmd.Parameters.Add("pass_word", OracleDbType.Varchar2).Value = textPass.Text;

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Đã thay đổi", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }

        private void FormChangePW_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        
        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void FormChangPW_Load(object sender, EventArgs e)
        {

        }

        private void textName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
