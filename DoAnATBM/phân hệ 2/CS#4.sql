alter session set "_ORACLE_SCRIPT" = true;

-- Tao chinh sach 4

CREATE ROLE TAICHINH_ROLE;

GRANT NHANVIEN_ROLE TO TAICHINH_ROLE;

grant execute on ADMIN.QUANLY_PHANCONG TO TAICHINH_ROLE;
GRANT SELECT ON ADMIN.NHANVIEN TO TAICHINH_ROLE;
GRANT SELECT ON ADMIN.PHANCONG TO TAICHINH_ROLE;
GRANT UPDATE (LUONG, PHUCAP) ON ADMIN.NHANVIEN TO TAICHINH_ROLE;

-- Ham cap chinh sach 4 cho nhan vien

CREATE OR REPLACE FUNCTION cs4_grant_role_tai_chinh(username IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
    -- Thua huong quyen tu nhan vien (chinh sach 1)
    -- EXECUTE IMMEDIATE 'GRANT role_nhan_vien TO ' || ten_nv;
    -- Cap role_tai_chinh cho nhan vien
    EXECUTE IMMEDIATE 'GRANT TAICHINH_ROLE TO ' || username;
    RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END;
/
DROP USER TC001;
CREATE USER TC001 IDENTIFIED BY TC001;
GRANT CREATE SESSION TO TC001;
GRANT TAICHINH_ROLE TO TC001;

conn TC001/TC001;