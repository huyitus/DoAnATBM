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

        private void GrantSelectDelete(string priv)
        {
            string user = textRole.Text.ToUpper();
            string table = textTable.Text;
            string grantOption = checkGrantOption.Checked ? "YES" : "NO";

            OracleCommand cmd = new OracleCommand("Grant_Priv_User1", oracleConnection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("User_Name", OracleDbType.Varchar2).Value = user;
            cmd.Parameters.Add("priv", OracleDbType.Varchar2).Value = priv;
            cmd.Parameters.Add("table_name", OracleDbType.Varchar2).Value = table;
            cmd.Parameters.Add("grant_option", OracleDbType.Varchar2).Value = grantOption;

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
        private void GrantInsertUpdate(string priv)
        {
            string role = textRole.Text.ToUpper();
            string table = textTable.Text;
            string grantOption = checkGrantOption.Checked ? "YES" : "NO";
            string column = textColumn.Text;

            OracleCommand cmd;
            if (grantOption == "YES")
            {
                cmd = new OracleCommand("grant_privilege_to_role", oracleConnection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = role;
                cmd.Parameters.Add("privilege_name", OracleDbType.Varchar2).Value = priv;
                cmd.Parameters.Add("table_name", OracleDbType.Varchar2).Value = table;
            }
            else
            {
                cmd = new OracleCommand("grant_priv_to_role_with_grant_option", oracleConnection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = role;
                cmd.Parameters.Add("privilege_name", OracleDbType.Varchar2).Value = priv;
                cmd.Parameters.Add("table_name", OracleDbType.Varchar2).Value = table;
                cmd.Parameters.Add("col_name", OracleDbType.Varchar2).Value = column;
                cmd.Parameters.Add("grant_option", OracleDbType.Varchar2).Value = " with grant option";
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
            GrantInsertUpdate("insert");
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            GrantInsertUpdate("update");
        }

        private void buttonSelect_Click(object sender, EventArgs e)
        {
            GrantSelectDelete("select");
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            GrantSelectDelete("delete");
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
