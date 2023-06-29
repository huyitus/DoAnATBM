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
    public partial class FormThemNhanVien : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormThemNhanVien()
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

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string manv = textBox1.Text;
            string tennv = textBox2.Text;
            string phai = textBox3.Text;    
            string ngaysinh =   textBox4.Text;  
            string diachi = textBox5.Text;  
            string sodt =       textBox6.Text;
            string luong = textBox12.Text;
            string phucap = textBox11.Text;
            string vaitro = textBox10.Text;
            string manql = textBox9.Text;
            string phongban = textBox8.Text;
            string query = string.Format("INSERT INTO ADMIN.UV_Nhanvien_NhanVien (MaNV, TenNV, phai, NgaySinh, DiaChi, SoDT, Luong, PhuCap, VaiTro, MaNQL, PhongBan) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}')", manv, tennv, phai, ngaysinh, diachi, sodt, luong, phucap, vaitro, manql, phongban);
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

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox12_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox11_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {

        }

        private void FormThemNhanVien_Load(object sender, EventArgs e)
        {

        }
    }
}
