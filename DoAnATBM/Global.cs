using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    class Global
    {
        public const string CONNECT_STRING =
            "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.60.1)(PORT=1523)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));DBA Privilege=SYSDBA;User Id=sys;Password=sys1234;";
        public static OracleConnection CreateConnection()
        {
            var connection = new OracleConnection(CONNECT_STRING);
            return connection;
        }

        public static void DisposeConnection(OracleConnection connection)
        {
            connection.Close();
            connection.Dispose();
        }
    }
}
