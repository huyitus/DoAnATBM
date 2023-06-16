alter session set "_ORACLE_SCRIPT" = true;

-- Tao chinh sach 4

CREATE ROLE role_tai_chinh;

GRANT SELECT ON ADMIN.NHANVIEN TO role_tai_chinh;
GRANT SELECT ON ADMIN.PHANCONG TO role_tai_chinh;
GRANT UPDATE (LUONG, PHUCAP) ON ADMIN.NHANVIEN TO role_tai_chinh;

-- Ham cap chinh sach 4 cho nhan vien

CREATE OR REPLACE FUNCTION cs4_grant_role_tai_chinh(username IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
    -- Thua huong quyen tu nhan vien (chinh sach 1)
    -- EXECUTE IMMEDIATE 'GRANT role_nhan_vien TO ' || ten_nv;
    -- Cap role_tai_chinh cho nhan vien
    EXECUTE IMMEDIATE 'GRANT role_tai_chinh TO ' || username;
    RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END;
/
