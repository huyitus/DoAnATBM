CREATE OR REPLACE VIEW UV_NHANVIEN_NHANVIEN AS
    SELECT *
    FROM ADMIN.NHANVIEN
    WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/

CREATE OR REPLACE VIEW UV_NHANVIEN_PHANCONG AS
    SELECT *
    FROM PHANCONG
    WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    
CREATE OR REPLACE FUNCTION admin.nhanvien_policy (p_schema_name IN VARCHAR2, p_table_name IN VARCHAR2)
    RETURN VARCHAR2
AS
    v_predicate VARCHAR2(40);
BEGIN
    v_predicate := 'MANV = SYS_CONTEXT(''USERENV'', ''SESSION_USER'')';
    RETURN v_predicate;
END;
/


DECLARE
BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema   => 'ADMIN',
        object_name     => 'NHANVIEN',
        policy_name     => 'STOCK_TRX_NHANVIEN_POLICY',
        function_schema => 'ADMIN',
        policy_function => 'NHANVIEN_POLICY',
        statement_types => 'UPDATE'
        
    );
END;
/   

BEGIN
  DBMS_RLS.DROP_POLICY(
    object_schema   => 'admin',
    object_name     => 'NHANVIEN',
    policy_name     => 'STOCK_TRX_NHANVIEN_POLICY'
  );
END;


drop role NHANVIEN_ROLE;
create role NHANVIEN_ROLE;

grant SELECT ON UV_NHANVIEN_NHANVIEN TO NV001;
grant UPDATE(NGAYSINH,DIACHI,SODT) ON ADMIN.NHANVIEN TO NHANVIEN_ROLE;
grant SELECT ON PHONGBAN TO NHANVIEN_ROLE;
grant SELECT ON DEAN TO NHANVIEN_ROLE;
GRANT UPDATE ON NHANVIEN TO ADMIN;

create user NV001 identified by NV001;
grant create session to NV001;
grant NHANVIEN_ROLE to NV001;
CONN NV001/NV001;

SELECT COUNT(*)
FROM all_objects
WHERE object_type = 'PACKAGE'
AND object_name = 'DBMS_RLS';

