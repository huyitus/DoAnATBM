CREATE OR REPLACE VIEW ADMIN.UV_NHANVIEN_NHANVIEN AS
    SELECT *
    FROM ADMIN.NHANVIEN
    WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/

CREATE OR REPLACE VIEW ADMIN.UV_NHANVIEN_PHANCONG AS
    SELECT *
    FROM ADMIN.PHANCONG
    WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    
CREATE OR REPLACE FUNCTION ADMIN.nhanvien_policy (p_schema_name IN VARCHAR2, p_table_name IN VARCHAR2)
    RETURN VARCHAR2
AS
    v_predicate VARCHAR2(40);
BEGIN
    v_predicate := 'MANV = SYS_CONTEXT(''USERENV'', ''SESSION_USER'')';
    RETURN v_predicate;
END;
/

BEGIN
  DBMS_RLS.DROP_POLICY(
    object_schema   => 'ADMIN',
    object_name     => 'NHANVIEN',
    policy_name     => 'NHANVIEN_POLICY'
  );
END;
/

DECLARE
BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema   => 'ADMIN',
        object_name     => 'NHANVIEN',
        policy_name     => 'NHANVIEN_POLICY',
        function_schema => 'ADMIN',
        policy_function => 'ADMIN.NHANVIEN_POLICY',
        statement_types => 'UPDATE',
        sec_relevant_cols => 'NGAYSINH,DIACHI,SODT'
    );
END;
/   




alter session set "_oracle_script" = true;

drop role NHANVIEN_ROLE;
create role NHANVIEN_ROLE;

grant SELECT ON ADMIN.UV_NHANVIEN_NHANVIEN TO NHANVIEN_ROLE;
grant SELECT ON ADMIN.UV_NHANVIEN_PHANCONG TO NHANVIEN_ROLE;

grant SELECT ON ADMIN.PHONGBAN TO NHANVIEN_ROLE;
grant SELECT ON ADMIN.DEAN TO NHANVIEN_ROLE;

drop user NV001;
create user NV001 identified by NV001;
grant create session to NV001;
grant NHANVIEN_ROLE to NV001;

CONN NV001/NV001;



