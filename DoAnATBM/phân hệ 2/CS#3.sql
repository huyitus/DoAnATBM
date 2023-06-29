alter session set "_ORACLE_SCRIPT" = true;

DROP ROLE TRUONGPHONG_ROLE;
CREATE ROLE TRUONGPHONG_ROLE;
/
GRANT NHANVIEN_ROLE TO TRUONGPHONG_ROLE;
/
CREATE OR REPLACE VIEW ADMIN.UV_TRPHG_NHANVIEN AS
    SELECT MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, VAITRO, MANQL, PHG 
    FROM ADMIN.NHANVIEN NV, ADMIN.PHONGBAN PB
    WHERE TRPHG = SYS_CONTEXT('USERENV', 'SESSION_USER') AND NV.PHG = PB.MAPB;
/
GRANT SELECT ON ADMIN.UV_TRPHG_NHANVIEN TO TRUONGPHONG_ROLE;
/
-- XEM TREN BANG PHANCONG
BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema   => 'ADMIN',
        object_name     => 'PHANCONG',
        policy_name     => 'QLPHANCONG',
        function_schema => 'ADMIN',
        policy_function => 'QUANLY_PHANCONG',
        statement_types => 'INSERT,UPDATE,DELETE,SELECT',
        update_check    => true
        );
END;
/

CREATE OR REPLACE FUNCTION ADMIN.QUANLY_PHANCONG(
    OBJ_SCHEMA IN VARCHAR2,
    OBJ_NAME IN VARCHAR2
)
RETURN VARCHAR2
AS
    USER_ VARCHAR(5);
    vaitro NVARCHAR2(20);
BEGIN
    SELECT VAITRO INTO vaitro
    FROM NHANVIEN
    WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    USER_ := SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    IF(vaitro = 'Quan ly') THEN 
        RETURN 'MANV = ''' || USER_ || ''' OR MANV IN (SELECT MANV FROM ADMIN.NHANVIEN WHERE MANQL = ''' || USER_ || ''')';
    ELSIF(vaitro =  'Truong phong') THEN 
        RETURN 'MANV = ''' || USER_ || ''' OR MANV IN (SELECT MANV FROM ADMIN.NHANVIEN WHERE PHG IN (SELECT MAPB FROM ADMIN.PHONGBAN WHERE TRPHG = ''' || USER_ || '''))';
    ELSIF(vaitro =  'Tai chinh') THEN 
        RETURN '1=1';
    ELSE 
        RETURN 'MANV = ''' || USER_ || '''';
    END IF;
END;
/
grant execute on ADMIN.QUANLY_PHANCONG TO TRUONGPHONG_ROLE;
grant update,insert,delete, select on ADMIN.PHANCONG TO TRUONGPHONG_ROLE;
/
drop user NV008;
create user NV008 identified by NV008;
grant create session to NV008;
/
drop user TP001;
create user TP001 identified by TP001;
grant create session to TP001;

GRANT TRUONGPHONG_ROLE TO TP001;



