alter session set "_ORACLE_SCRIPT" = true;
/
--Cap quyen audit cho admin
GRANT AUDIT_ADMIN TO ADMIN;
GRANT AUDIT_VIEWER TO ADMIN;
/
--Luu vet nhung nguoi cap nhat truong THOIGIAN trong quan he PHANCONG
BEGIN
  DBMS_FGA.ADD_POLICY(
  object_schema => 'ADMIN', 
  object_name => 'PHANCONG', 
  policy_name => 'FGA_PHANCONG_THOIGIAN',
  audit_column => 'THOIGIAN', 
  enable => TRUE, 
  statement_types => 'UPDATE');
END;
--Disable va drop audit
exec DBMS_FGA.DISABLE_POLICY('ADMIN', 'PHANCONG', 'FGA_PHANCONG_THOIGIAN');
exec DBMS_FGA.DROP_POLICY('ADMIN', 'PHANCONG', 'FGA_PHANCONG_THOIGIAN');
/
--Thuc thi audit
SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT
FROM unified_audit_trail
WHERE object_name = 'PHANCONG';
/
--Luu vet nhung nguoi da doc tren truong LUONG va PHUCAP cua nguoi khac
BEGIN
  DBMS_FGA.ADD_POLICY(
  object_schema => 'ADMIN',
  object_name => 'NHANVIEN',
  policy_name => 'FGA_SELECT_LUONG_PHUCAP', 
  audit_column => 'LUONG, PHUCAP',
  enable => TRUE,
  statement_types => 'SELECT');
END;
/
--Disable va drop audit
exec DBMS_FGA.DISABLE_POLICY('ADMIN', 'NHANVIEN', 'FGA_SELECT_LUONG_PHUCAP');
exec DBMS_FGA.DROP_POLICY('ADMIN', 'NHANVIEN', 'FGA_SELECT_LUONG_PHUCAP');
/
--Thuc thi audit
SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT
FROM unified_audit_trail
WHERE object_name = 'NHANVIEN';
/
--Luu vet mot nguoi khong thuoc vai tro 'Tai chinh' nhung da cap nhat thanh cong tren truong LUONG và PHUCAP
BEGIN
  DBMS_FGA.ADD_POLICY(
  object_schema => 'ADMIN',
  object_name => 'NHANVIEN',
  policy_name => 'FGA_UPDATE_LUONG_PHUCAP',
  audit_condition => 'vaitro !=  ''Tai chinh''',
  audit_column => 'LUONG, PHUCAP',
  enable => TRUE,
  statement_types => 'SELECT');
END;

--Disable va drop audit
exec DBMS_FGA.DISABLE_POLICY('ADMIN', 'NHANVIEN', 'FGA_UPDATE_LUONG_PHUCAP');
exec DBMS_FGA.DROP_POLICY('ADMIN', 'NHANVIEN', 'FGA_UPDATE_LUONG_PHUCAP');
/
--Thuc thi audit
SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT
FROM unified_audit_trail
WHERE object_name = 'NHANVIEN';

