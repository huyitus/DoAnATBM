﻿using System;
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
            Form form = new FormGD_PB();    
            form.Show();
        }

        private void FormFeatures_GD_Load(object sender, EventArgs e)
        {

        }

        private void button10_Click(object sender, EventArgs e)
        {
            Form form = new FormGD_DA();
            form.Show();    
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form form = new FormGD_PC();
            form.Show();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            FormXemThongBao form = new FormXemThongBao();
            form.Show();
        }
    }
}
