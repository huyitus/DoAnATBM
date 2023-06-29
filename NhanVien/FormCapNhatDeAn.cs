using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace NhanVien
{
    public partial class FormCapNhatDeAn : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormCapNhatDeAn()
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

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string mada = textBox1.Text;
            string tenda = textBox2.Text;
            string ngayBD = textBox3.Text;
            string phong = textBox4.Text;
            string query = string.Format("UPDATE ADMIN.Dean SET tenda='{0}' WHERE mada='{1}'",
            tenda, mada);

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

        private void FormCapNhatDeAn_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string mada = textBox1.Text;
            string tenda = textBox2.Text;
            string ngayBD = textBox3.Text;
            string phong = textBox4.Text;
            string query = string.Format("UPDATE ADMIN.Dean SET ngaybd='{0}' WHERE mada='{1}'",
            ngayBD, mada);

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

        private void button3_Click(object sender, EventArgs e)
        {
            string mada = textBox1.Text;
            string tenda = textBox2.Text;
            string ngayBD = textBox3.Text;
            string phong = textBox4.Text;
            string query = string.Format("UPDATE ADMIN.Dean SET Phong='{0}' WHERE mada='{1}'",
            phong, mada);

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
    }
}
