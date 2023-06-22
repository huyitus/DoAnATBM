using Oracle.ManagedDataAccess.Client;

namespace NhanVien
{
    class Global
    {
        public const string CONNECT_STRING = "Data Source=localhost:1521/xe;User Id={0};Password={1};";

        public static OracleConnection CreateConnection(string connStr)
        {
            var connection = new OracleConnection(connStr);
            return connection;
        }

        public static void DisposeConnection(OracleConnection connection)
        {
            connection.Close();
            connection.Dispose();
        }
    }
}
