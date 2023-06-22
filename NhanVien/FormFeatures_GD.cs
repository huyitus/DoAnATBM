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
    public partial class FormFeatures_GD : Form
    {
        public FormFeatures_GD()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            FormGD_NV form = new FormGD_NV();
            form.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void FormFeatures_GD_Load(object sender, EventArgs e)
        {

        }
    }
}
