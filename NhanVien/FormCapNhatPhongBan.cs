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
    public partial class FormCapNhatPhongBan : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormCapNhatPhongBan()
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

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string mapb = textBox1.Text;
            string tenphong = textBox2.Text;
            string query = string.Format("UPDATE ADMIN.PHONGBAN SET TENPB='{0}' WHERE MAPB='{1}'",
               tenphong, mapb);

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

        private void button2_Click(object sender, EventArgs e)
        {
            string mapb = textBox1.Text;
            string truongphong = textBox3.Text;
            string query = string.Format("UPDATE ADMIN.PHONGBAN SET trphg='{0}' WHERE MAPB='{1}'",
               truongphong, mapb);

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

        private void FormCapNhatPhongBan_Load(object sender, EventArgs e)
        {

        }
    }
}
