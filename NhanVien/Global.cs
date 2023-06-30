using Oracle.ManagedDataAccess.Client;

namespace NhanVien
{
    class Global
    {
        public const string CONNECT_STRING = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=xepdb1)));DBA Privilege=SYSDBA;User Id=sys;Password=123456789;";

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
