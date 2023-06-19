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
    public partial class FormFeatures : Form
    {
        public FormFeatures()
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
    }
}
