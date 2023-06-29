SELECT STATUS FROM DBA_OLS_STATUS WHERE NAME='OLS_CONFIGURE_STATUS';
ALTER USER lbacsys IDENTIFIED BY lbacsys ACCOUNT UNLOCK;

EXEC LBACSYS.CONFIGURE_OLS;
EXEC LBACSYS.OLS_ENFORCEMENT.ENABLE_OLS;

CONN lbacsys/lbacsys
BEGIN
    SA_SYSDBA.CREATE_POLICY(
        policy_name => 'THONGBAO_OLS',
        column_name => 'COL_OLS'
        );
END;
CONN lbacsys/lbacsys
BEGIN
    SA_SYSDBA.DROP_POLICY(
        policy_name => 'THONGBAO_OLS'
        );
END;

CONN lbacsys/lbacsys
BEGIN
    SA_COMPONENTS.CREATE_LEVEL(
        policy_name  => 'THONGBAO_OLS',
        level_num    => 1000,
        short_name   => 'GD',
        long_name    => 'Giam doc'
    );
    
    SA_COMPONENTS.CREATE_LEVEL(
        policy_name  => 'THONGBAO_OLS',
        level_num    => 100,
        short_name   => 'TP',
        long_name    => 'Truong phong'
    );
    
    SA_COMPONENTS.CREATE_LEVEL(
        policy_name  => 'THONGBAO_OLS',
        level_num    => 10,
        short_name   => 'NV',
        long_name    => 'Nhan vien'  
    );
END;
CONN lbacsys/lbacsys
BEGIN
    SA_COMPONENTS.CREATE_COMPARTMENT(
        policy_name  => 'THONGBAO_OLS',
        comp_num     => 200,
        short_name   => 'MAB',
        long_name    => 'mua ban' 
    );
    
    SA_COMPONENTS.CREATE_COMPARTMENT(
        policy_name  => 'THONGBAO_OLS',
        comp_num     => 300,
        short_name   => 'SX',
        long_name    => 'san xuat'
    );
    
    SA_COMPONENTS.CREATE_COMPARTMENT(
        policy_name  => 'THONGBAO_OLS',
        comp_num     => 400,
        short_name   => 'GC',
        long_name    => 'gia cong'
    );
END;

CONN lbacsys/lbacsys
BEGIN
    SA_COMPONENTS.CREATE_GROUP(
        policy_name  => 'THONGBAO_OLS',
        group_num     => 10,
        short_name   => 'MB',
        long_name    => 'mien Bac'
    );
    
    SA_COMPONENTS.CREATE_GROUP(
        policy_name  => 'THONGBAO_OLS',
        group_num     => 20,
        short_name   => 'MT',
        long_name    => 'mien Trung'
    );
    
    SA_COMPONENTS.CREATE_GROUP(
        policy_name  => 'THONGBAO_OLS',
        group_num     => 30,
        short_name   => 'MN',
        long_name    => 'mien Nam'
    );
END;

EXECUTE SA_LABEL_ADMIN.CREATE_LABEL(policy_name =>'THONGBAO_OLS', label_tag =>3330, label_value =>'GD:MAB,SX,GC:MB,MT,MN');
EXECUTE SA_LABEL_ADMIN.CREATE_LABEL(policy_name =>'THONGBAO_OLS', label_tag =>2100, label_value =>'TP:SX:MN');
EXECUTE SA_LABEL_ADMIN.CREATE_LABEL(policy_name =>'THONGBAO_OLS', label_tag =>3310, label_value =>'GD:MAB,SX,GC:MB');

drop user admin cascade;
create user ADMIN identified by admin123;
grant create session to ADMIN;
grant all privileges to ADMIN;

DROP TABLE THONGBAO;

conn ADMIN/admin123;
create table THONGBAO(
    NOIDUNG nvarchar2(255),
    NGAYGIO date,
    DIADIEM nvarchar2(255),
    CAPBAC nvarchar2(50), 
    LINHVUC nvarchar2(50), 
    CHINHANH nvarchar2(50) 
);
/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

insert into THONGBAO VALUES('Hop ban giam doc','2023-06-30 13:00:00','HA NOI','Giam Doc','san xuat','mien Bac');
insert into THONGBAO VALUES('Trien khai du an cho cac truong phong','2023-07-10 09:00:00','TP.HCM','Truong Phong','san xuat', 'mien Nam');
insert into THONGBAO VALUES('Dang ky tham gia team building','2023-06-30 07:00:00','HA NOI','Nhan Vien','mua ban','mien Trung');
insert into THONGBAO VALUES('Hop ban giam doc','2023-07-11 13:00:00','HAI PHONG','Giam Doc','mua ban','mien Bac');

CONN lbacsys/lbacsys
EXECUTE SA_USER_ADMIN.SET_USER_PRIVS('THONGBAO_OLS','ADMIN','FULL,PROFILE_ACCESS');

GRANT EXECUTE ON sa_components TO ADMIN WITH GRANT OPTION;
GRANT EXECUTE ON sa_user_admin TO ADMIN WITH GRANT OPTION;
GRANT EXECUTE ON sa_user_admin TO ADMIN WITH GRANT OPTION;
GRANT EXECUTE ON sa_label_admin TO ADMIN WITH GRANT OPTION;
GRANT EXECUTE ON sa_policy_admin TO ADMIN WITH GRANT OPTION;
GRANT EXECUTE ON sa_audit_admin  TO ADMIN WITH GRANT OPTION;

GRANT LBAC_DBA TO ADMIN;
GRANT EXECUTE ON sa_sysdba TO ADMIN;
GRANT EXECUTE ON to_lbac_data_label TO ADMIN;

GRANT THONGBAO_OLS_DBA TO ADMIN;

conn ADMIN/admin123;
EXECUTE SA_POLICY_ADMIN.APPLY_TABLE_POLICY(policy_name =>'THONGBAO_OLS', schema_name =>'admin', table_name =>'THONGBAO', table_options =>'NO_CONTROL');

update ADMIN.THONGBAO
set COL_OLS = char_to_label('THONGBAO_OLS','GD:MAB,SX,GC:MB,MT,MN')
WHERE CAPBAC='Giam Doc';

update ADMIN.THONGBAO
set COL_OLS = char_to_label('THONGBAO_OLS','TP:SX:MN')
WHERE CAPBAC='Truong Phong' AND LINHVUC='san xuat' AND CHINHANH='mien Nam';

update ADMIN.THONGBAO
set COL_OLS = char_to_label('THONGBAO_OLS','GD:MAB,SX,GC:MB')
WHERE CAPBAC='Giam Doc' AND CHINHANH='mien Bac';

conn ADMIN/admin123;
--XOA AP DUNG POLICY
BEGIN
    SA_POLICY_ADMIN.REMOVE_TABLE_POLICY(
        policy_name     =>'THONGBAO_OLS',
        schema_name     =>'ADMIN',
        table_name      =>'THONGBAO'
    );
END;

--AP DUNG POLICY OLS
conn ADMIN/admin123;

BEGIN
    SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
        policy_name     =>'THONGBAO_OLS',
        schema_name     =>'ADMIN',
        table_name      =>'THONGBAO',
        table_options   =>'READ_CONTROL'
    );
END;

alter session set "_ORACLE_SCRIPT"=true;

drop user GIAM_DOC cascade;
drop user TRUONGPHONG_SX_MN cascade;
drop user GIAMDOC_MB cascade;

create user GIAM_DOC identified by 123456;
grant create session to GIAM_DOC;

create user TRUONGPHONG_SX_MN identified by 123456;
grant create session to TRUONGPHONG_SX_MN;

create user GIAMDOC_MB identified by 123456;
grant create session to GIAMDOC_MB;

conn ADMIN/admin123;
grant select on THONGBAO to GIAM_DOC;
grant select on THONGBAO to TRUONGPHONG_SX_MN;
grant select on THONGBAO to GIAMDOC_MB;

conn ADMIN/admin123;
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS(
        policy_name     =>'THONGBAO_OLS',
        user_name       =>'GIAM_DOC',
        max_read_label  =>'GD:MAB,SX,GC:MB,MT,MN',
        def_label       =>'GD:MAB,SX,GC:MB,MT,MN',
        row_label       =>'GD:MAB,SX,GC:MB,MT,MN'
    );
END; 

conn ADMIN/admin123;
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS(
        policy_name     =>'THONGBAO_OLS',
        user_name       =>'TRUONGPHONG_SX_MN',
        max_read_label   =>'TP:SX:MN',
        def_label       =>'TP:SX:MN',
        row_label       =>'TP:SX:MN'
    );
END;

conn ADMIN/admin123;
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS(
        policy_name     =>'THONGBAO_OLS',
        user_name       =>'GIAMDOC_MB',
        max_read_label   =>'GD:MAB,SX,GC:MB',
        def_label       =>'GD:MAB,SX,GC:MB',
        row_label       =>'GD:MAB,SX,GC:MB'
    );
END;

CONN GIAM_DOC/123456
SELECT*FROM ADMIN.THONGBAO;

CONN TRUONGPHONG_SX_MN/123456
SELECT*FROM ADMIN.THONGBAO;

CONN GIAMDOC_MB/123456
SELECT*FROM ADMIN.THONGBAO;

