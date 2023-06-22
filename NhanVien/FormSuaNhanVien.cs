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
    public partial class FormSuaNhanVien : Form
    {
        private readonly OracleConnection oracleConnection;

        public FormSuaNhanVien()
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
            string ngaysinh = textBox1.Text;
            string query = string.Format("UPDATE ADMIN.UV_NHANVIEN_NHANVIEN SET NGAYSINH=TO_DATE('{0}', 'YYYY-MM-DD') WHERE MANV='{1}'",
                ngaysinh, Session.username);

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
            string diachi = textBox2.Text;
            string query = string.Format("UPDATE ADMIN.UV_NHANVIEN_NHANVIEN SET DIACHI='{0}' WHERE MANV='{1}'",
                diachi, Session.username);

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
            string sodt = textBox3.Text;
            string query = string.Format("UPDATE ADMIN.UV_NHANVIEN_NHANVIEN SET SODT='{0}' WHERE MANV='{1}'",
                sodt, Session.username);

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
