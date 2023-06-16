alter session set "_ORACLE_SCRIPT" = true;

DROP ROLE QUANLY_ROLE;
CREATE ROLE QUANLY_ROLE;
/
GRANT NHANVIEN_ROLE TO QUANLY_ROLE;
/
CREATE OR REPLACE VIEW ADMIN.UV_QUANLY_NHANVIEN AS
    SELECT MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, VAITRO, MANQL, PHG 
    FROM ADMIN.NHANVIEN
    WHERE MANQL = SYS_CONTEXT('USERENV', 'SESSION_USER');
/
GRANT SELECT ON ADMIN.UV_QUANLY_NHANVIEN TO QUANLY_ROLE;


------XEM TREN BANG PHAN CONG
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
BEGIN
    DBMS_RLS.DROP_POLICY(
        object_schema   => 'ADMIN',
        object_name     => 'PHANCONG',
        policy_name     => 'QLPHANCONG'
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

grant execute on ADMIN.QUANLY_PHANCONG TO QUANLY_ROLE;
grant select on ADMIN.PHANCONG TO QUANLY_ROLE;
/
GRANT QUANLY_ROLE TO NV001;

