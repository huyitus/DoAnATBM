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
    
    public partial class FormCapNhatLuongPhuCap : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormCapNhatLuongPhuCap()
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

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void FormCapNhatLuongPhuCap_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string manv = textBox1.Text;
            string luong = textBox2.Text;
            string query = string.Format("UPDATE ADMIN.UV_NHANVIEN_NHANVIEN SET LUONG='{0}' WHERE MANV='{1}'",
            luong , manv);

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
            string manv = textBox1.Text;
            string phucap = textBox3.Text;
            string query = string.Format("UPDATE ADMIN.UV_NHANVIEN_NHANVIEN SET PHUCAP='{0}' WHERE MANV='{1}'",
            phucap, manv);

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
