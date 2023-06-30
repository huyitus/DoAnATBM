alter session set "_ORACLE_SCRIPT" = true;
/
DROP ROLE TRGDA_ROLE;
CREATE ROLE TRGDA_ROLE;
/
GRANT NHANVIEN_ROLE TO TRGDA_ROLE;
GRANT INSERT, DELETE, UPDATE ON ADMIN.DEAN TO TRGDA_ROLE;

create user TD001 identified by TD001;
grant create session to TD001;
grant TRGDA_ROLE to TD001;