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

namespace NhanVien
{
    public partial class FormThemDeAn : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormThemDeAn()
        {
            InitializeComponent();
            try
            {
                string connStr = string.Format(Global.CONNECT_STRING, Session.username, Session.password);
                oracleConnection = new OracleConnection(connStr);
                oracleConnection.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string mada = textBox1.Text;
            string tenda = textBox2.Text;
            string ngaybd = textBox3.Text;
            string phong = textBox4.Text;
            string query = string.Format("INSERT INTO admin.uv_dean_dean (mada, tenda, ngaybd, phong) VALUES ('{0}', '{1}', '{2}', '{3}')",
                             mada, tenda, ngaybd, phong);
            try
            {
                using (OracleCommand command = new OracleCommand(query, oracleConnection))
                {
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void FormThemDeAn_Load(object sender, EventArgs e)
        {

        }
    }
}
