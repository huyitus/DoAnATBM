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
    public partial class FormFeaturesQLTrucTiep : Form
    {
        public FormFeaturesQLTrucTiep()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            FormXemNVCuaPhong form = new FormXemNVCuaPhong();   
            form.Show();  
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FormXemNhanVien form = new FormXemNhanVien();
            form.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormXemPhanCong form =  new FormXemPhanCong();   
            form .Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FormSuaNhanVien form= new FormSuaNhanVien();   
            form .Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            FormXemPhanCong form = new FormXemPhanCong();  
            form .Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            FormXemThongBao form = new FormXemThongBao();
            form.Show();
        }
    }
}
