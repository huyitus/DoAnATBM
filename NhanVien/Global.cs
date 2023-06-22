using Oracle.ManagedDataAccess.Client;

namespace NhanVien
{
    class Global
    {
        public const string CONNECT_STRING = "Data Source=192.168.60.1:1523/orcl;User Id={0};Password={1};";

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
