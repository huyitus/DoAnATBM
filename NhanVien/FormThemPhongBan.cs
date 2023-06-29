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
    public partial class FormThemPhongBan : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormThemPhongBan()
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

        private void ThemPhongBan_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {   string mapb = textBox1.Text;
            string tenpb = textBox2.Text;
            string trpg = textBox3.Text;

           // string trgpb = textBox3.Text;
            string query = string.Format("INSERT INTO ADMIN.Phongban VALUES('{0}','{1}','{2}')",mapb,tenpb,trpg);
            MessageBox.Show(query);

            try
            {
                using (OracleCommand command = new OracleCommand(query, oracleConnection))
                {
                    command.ExecuteNonQuery();

                }
                MessageBox.Show("ok");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
