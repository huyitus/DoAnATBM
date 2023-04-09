using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;

namespace DoAnATBM
{
    public partial class FormRolePrivileges : Form
    {
        private readonly OracleConnection oracleConnection;
        public FormRolePrivileges()
        {
            InitializeComponent();

            oracleConnection = Global.CreateConnection();
            oracleConnection.Open();
        }

        private void Grant(string priv, bool grantOption)
        {
            string role = textRole.Text.ToUpper();
            string table = textTable.Text;

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oracleConnection;
            cmd.CommandType = CommandType.Text;

            if (grantOption)
            {
                cmd.CommandText = "grant " + priv + " on " + table + " to " + role + " with grant option";
            }
            else
            {
                cmd.CommandText = "grant " + priv + " on " + table + " to " + role;
            }

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }

        private void buttonInsert_Click(object sender, EventArgs e)
        {
            Grant("insert", checkGrantOption.Checked);
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            Grant("update", checkGrantOption.Checked);
        }

        private void buttonSelect_Click(object sender, EventArgs e)
        {
            Grant("select", checkGrantOption.Checked);
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            Grant("delete", checkGrantOption.Checked);
        }

        private void FormRolePrivileges_FormClosing(object sender, FormClosingEventArgs e)
        {
            Global.DisposeConnection(oracleConnection);
        }

        private void Revoke(string priv)
        {
            string user = textRole.Text.ToUpper();
            string table = textTable.Text;

            OracleCommand cmd = new OracleCommand("revoke_privilege_to_role", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = user;
            cmd.Parameters.Add("privilege_name", OracleDbType.Varchar2).Value = priv;
            cmd.Parameters.Add("table_name", OracleDbType.Varchar2).Value = table;

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Thành công", "Thông báo");
            }
            catch (OracleException oe)
            {
                MessageBox.Show(oe.Message, "Lỗi");
            }
        }

        private void buttonRevokeSelect_Click(object sender, EventArgs e)
        {
            Revoke("select");
        }

        private void buttonRevokeDelete_Click(object sender, EventArgs e)
        {
            Revoke("delete");
        }

        private void buttonRevokeInsert_Click(object sender, EventArgs e)
        {
            Revoke("insert");
        }

        private void buttonRevokeUpdate_Click(object sender, EventArgs e)
        {
            Revoke("update");
        }

        private void buttonTest_Click(object sender, EventArgs e)
        {
            Process.Start("sqlplus");
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void FormRolePrivileges_Load(object sender, EventArgs e)
        {

        }
    }
}
