﻿using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FromMain : Form
    {
        private readonly OracleConnection oracleConnection;

        public FromMain()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void FromMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void ButtonUsers_Click(object sender, System.EventArgs e)
        {
            FormUsers formUsers = new FormUsers();
            formUsers.Show();
        }

        private void ButtonCreateUser_Click(object sender, System.EventArgs e)
        {
            FormCreateUser form = new FormCreateUser();
            form.Show();
        }

        private void buttonDropUser_Click(object sender, System.EventArgs e)
        {
            FormDropUser form = new FormDropUser();
            form.Show();
        }

        private void buttonAlterUser_Click(object sender, System.EventArgs e)
        {
            FormAlterUser form = new FormAlterUser();
            form.Show();
        }
        private void buttonCreateRole_Click(object sender, System.EventArgs e)
        {
            FormCreateRole form = new FormCreateRole();
           
            form.ShowDialog();
        }
        
        private void buttonDropRole_Click(object sender, System.EventArgs e)
        {
            FormDropRole form = new FormDropRole();

            form.ShowDialog();
        }
        
        private void buttonChangePW_Click(object sender, System.EventArgs e)
        {
            FormChangePW form = new FormChangePW();

            form.ShowDialog();
        }
        
        private void buttonViewRoles_Click(object sender, System.EventArgs e)
        {
            FormViewRoles form = new FormViewRoles();

            form.ShowDialog();
        }
        private void FromMain_Load(object sender, System.EventArgs e)
        {

        }
    }
}
