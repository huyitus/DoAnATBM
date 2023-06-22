using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NhanVien
{
    public partial class FormFeatures_NV : Form
    {
        public FormFeatures_NV()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FormXemNhanVien form = new FormXemNhanVien();
            form.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormXemPhanCong form = new FormXemPhanCong();
            form.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FormSuaNhanVien form = new FormSuaNhanVien();
            form.Show();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {

        }
    }
}
