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
    public partial class FormFeatures_TDA : Form
    {
        public FormFeatures_TDA()
        {
            InitializeComponent();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            FormCapNhatDeAn form = new FormCapNhatDeAn();
            form.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            FormThemDeAn form = new FormThemDeAn(); 
            form.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            FormXoaDeAn form = new FormXoaDeAn();
            form.Show();
        }
    }
}
