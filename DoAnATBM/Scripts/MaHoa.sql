-- Create a wallet, you must create a wallet folder before
ADMINISTER KEY MANAGEMENT CREATE KEYSTORE 'C:\app\Huy\admin\orcl\wallet' IDENTIFIED BY "atbm1234";

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

execute MaHoaCot('admin.nhanvien', 'luong');
/
execute GiaiMaCot('admin.nhanvien', 'luong');
/
execute 

-- Close the wallet
ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "atbm1234" CONTAINER=ALL;