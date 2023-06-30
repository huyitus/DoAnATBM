using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Windows.Forms;

namespace MaHoa
{
    public partial class FormMain : Form
    {
        const string CONNECT_STRING = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=xepdb1)));DBA Privilege=SYSDBA;User Id=sys;Password=123456789;";

        public FormMain()
        {
            InitializeComponent();
        }

        private void btnActivateWallet_Click(object sender, EventArgs e)
        {
            /*
            try
            {
                OracleConnection connection = new OracleConnection(CONNECT_STRING);
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "KichHoatVi";
                command.Parameters.Add("p_password", OracleDbType.Varchar2).Value = txtPassword.Text;

                command.ExecuteNonQuery();

                connection.Close();
            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            }
            */
            string query = "ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY " + txtPassword.Text + " CONTAINER=ALL";
            try
            {
                OracleConnection connection = new OracleConnection(CONNECT_STRING);
                connection.Open();
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnEncrypt_Click(object sender, EventArgs e)
        {
            try
            {

                
                OracleConnection connection = new OracleConnection(CONNECT_STRING);
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "MaHoaCot";
                command.Parameters.Add("p_table_name", OracleDbType.Varchar2).Value = txtTable.Text;
                command.Parameters.Add("p_column_name", OracleDbType.Varchar2).Value = txtColumn.Text;

                command.ExecuteNonQuery();

                connection.Close();

                MessageBox.Show("Mã hóa TDE đã được áp dụng cho cột " + txtColumn.Text);
            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            }
        }

        private void btnDecrypt_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection connection = new OracleConnection(CONNECT_STRING);
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GiaiMaCot";
                command.Parameters.Add("p_table_name", OracleDbType.Varchar2).Value = txtTable.Text;
                command.Parameters.Add("p_column_name", OracleDbType.Varchar2).Value = txtColumn.Text;

                command.ExecuteNonQuery();

                connection.Close();

                MessageBox.Show("Mã hóa TDE đã được gỡ bỏ cho cột " + txtColumn.Text);
            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            }
        }
    }
}
