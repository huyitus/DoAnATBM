alter session set container=CDB$ROOT;

-- Create a wallet, you must create a wallet folder before
ADMINISTER KEY MANAGEMENT CREATE KEYSTORE 'C:\app\User\product\21c\admin\XE\wallet' IDENTIFIED BY "atbm1234";

-- Open the wallet
ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY "atbm1234" CONTAINER=ALL;

-- Create a master key
ADMINISTER KEY MANAGEMENT CREATE KEY IDENTIFIED BY "atbm1234" WITH BACKUP;

CREATE OR REPLACE PROCEDURE MaHoaCot(p_table_name IN VARCHAR2, p_column_name IN VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE ' || p_table_name || ' MODIFY (' || p_column_name || ' ENCRYPT)';
END;
/

CREATE OR REPLACE PROCEDURE GiaiMaCot(p_table_name IN VARCHAR2, p_column_name IN VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE ' || p_table_name || ' MODIFY (' || p_column_name || ' DECRYPT)';
END;
/

CREATE OR REPLACE PROCEDURE KichHoatVi(p_password IN VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY "' || p_password || '" CONTAINER=ALL';
END;
/
alter session set container=xepdb1;

--exec KichHoatVi('atbm1234');
-- Close the wallet
-- ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "atbm1234" CONTAINER=ALL;