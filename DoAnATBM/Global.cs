using Oracle.ManagedDataAccess.Client;

namespace DoAnATBM
{
    class Global
    {
        public const string CONNECT_STRING =
            "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=xe)));DBA Privilege=SYSDBA;User Id=sys;Password=admin;";
        
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
