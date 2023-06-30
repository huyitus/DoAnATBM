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
    public partial class FormFeatures_NS : Form
    {

        public FormFeatures_NS()
        {
            InitializeComponent();

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            FormThemNhanVien form = new FormThemNhanVien();     
            form.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            FormThemPhongBan form = new FormThemPhongBan();
            form.Show(); 
        }
        private void button6_Click(object sender, EventArgs e)
        {
            FormCapNhatPhongBan form =  new FormCapNhatPhongBan();
            form.Show();    
        }

        private void button7_Click(object sender, EventArgs e)
        {
            FormCapNhatLuongPhuCap form = new FormCapNhatLuongPhuCap();
            form.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FormSuaNhanVien form = new FormSuaNhanVien();   form.Show();    
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormXemPhanCong form    = new FormXemPhanCong();    form.Show();    
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FormXemNhanVien form = new FormXemNhanVien();
            form.Show();    
        }
    }
}
