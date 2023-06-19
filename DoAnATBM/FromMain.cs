using System.Windows.Forms;
using System;
using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    public partial class FromMain : Form
    {
        private readonly OracleConnection oracleConnection;

        public FromMain()
        {
            InitializeComponent();
            try
            {
                oracleConnection = Global.CreateConnection();
                oracleConnection.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
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

        private void buttonPrivileges_Click(object sender, System.EventArgs e)
        {
            FormUserPrivileges form = new FormUserPrivileges();
            form.Show();
        }

        private void buttonViewPrivs_Click(object sender, System.EventArgs e)
        {
            FormUserViewPrivs form = new FormUserViewPrivs();
            form.Show();
        }

        private void FromMain_Load(object sender, System.EventArgs e)
        {

        }

        private void button_cap_thu_quyen(object sender, System.EventArgs e)
        {
            FormRolePrivileges form = new FormRolePrivileges();
            form.Show();
        }

        private void xem_quyen_btn_Click(object sender, System.EventArgs e)
        {
            FormRoleViewPrivs form = new FormRoleViewPrivs();
            form.Show();
        }

        private void buttonPrivileges_Click_1(object sender, System.EventArgs e)
        {
            FormUserPrivileges form = new FormUserPrivileges();
            form.Show();
        }

        private void buttonViewUserPrivileges_Click(object sender, System.EventArgs e)
        {
            FormUserViewPrivs form = new FormUserViewPrivs();
            form.Show();
        }

        private void buttonViewData_Click(object sender, System.EventArgs e)
        {
            FormViewData form = new FormViewData();
            form.Show();
        }

    

        private void button_addRole2User(object sender, System.EventArgs e)
        {
            FormAddRole2User form = new FormAddRole2User();
            form.Show();
        }

        private void button_ThuHoiRole(object sender, System.EventArgs e)
        {
            FormRevokeRole2User form = new FormRevokeRole2User();
            form.Show();
        }

        private void groupBox2_Enter(object sender, System.EventArgs e)
        {

        }
    }
}
