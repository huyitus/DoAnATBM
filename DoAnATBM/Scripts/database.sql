alter session set "_ORACLE_SCRIPT" = true;

drop user admin cascade;
create user admin identified by admin123;
grant all privileges to admin;
grant create session to admin;
conn admin/admin123;

alter table ADMIN.NHANVIEN drop constraint FK_NV_QL;
alter table ADMIN.NHANVIEN drop constraint FK_NV_PHG;
alter table ADMIN.PHONGBAN drop constraint FK_NV_TRPHG;
alter table ADMIN.DEAN drop constraint FK_DA_PHG;
alter table ADMIN.PHANCONG drop constraint FK_PC_DA;
alter table ADMIN.PHANCONG drop constraint FK_PC_NV;

drop table ADMIN.PHANCONG;
drop table ADMIN.DEAN;
drop table ADMIN.PHONGBAN;
drop table ADMIN.NHANVIEN;

create table ADMIN.NHANVIEN (
    MANV varchar(5) primary key,
    TENNV nvarchar2(50),
    PHAI nvarchar2(3),
    NGAYSINH date,
    DIACHI nvarchar2(255),
    SODT varchar(10),
    LUONG int,
    PHUCAP int,
    VAITRO nvarchar2(20),
    MANQL varchar(5),
    PHG varchar(5),
    constraint check_phai check (PHAI in (N'Nam', N'Nu'))
);


create table ADMIN.PHONGBAN (
    MAPB varchar(5) primary key,
    TENPB nvarchar2(50),
    TRPHG varchar(5)
);

create table ADMIN.DEAN (
    MADA varchar(5) primary key,
    TENDA nvarchar2(50),
    NGAYBD date,
    PHONG varchar(5)
);

create table ADMIN.PHANCONG (
    MANV varchar(5),
    MADA varchar(5),
    THOIGIAN int,
    primary key (MANV, MADA)
);
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


insert into ADMIN.NHANVIEN values('NV001', 'Nguyen Van An', N'Nam', '1990-05-01', 'Quan 2', '0768897001', 15000000, 1000000, 'Quan ly', NULL, 'PB001');
insert into ADMIN.NHANVIEN values('NV002', 'Nguyen Thi Bich', 'Nu', '1990-06-07', 'Quan 3', '0768897002', 10000000, 1000000, 'Nhan vien', 'NV001', 'PB001');
insert into ADMIN.NHANVIEN values('NV003', 'Nguyen Van Chung', 'Nam', '1990-03-07', 'Quan 2', '0768897003', 10000000, 1000000, 'Nhan vien', 'NV001', 'PB001');
insert into ADMIN.NHANVIEN values('NV004', 'Nguyen Van Chu', 'Nam', '1991-04-07', 'Quan 2', '0768897013', 10000000, 1000000, 'Quan ly', 'NV001', 'PB001');
insert into ADMIN.NHANVIEN values('NV005', 'Nguyen Van Chun', 'Nam', '1992-03-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Nhan vien', 'NV001', 'PB002');
insert into ADMIN.NHANVIEN values('NV006', 'Nguyen Van Ha', 'Nam', '1992-04-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Giam doc', NULL, 'PB004');
insert into ADMIN.NHANVIEN values('NV008', 'Nguyen Van Chun', 'Nam', '1992-03-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Truong phong', NULL, 'PB002');
insert into ADMIN.NHANVIEN values('NV009', 'Tran Van Hai', 'Nam', TO_DATE('1990-05-18', 'YYYY-MM-DD'), 'Quan 10', '0492295395', 10000000, 1000000, 'Tai chinh', NULL, NULL);


insert into ADMIN.PHONGBAN values('PB001', N'Ke hoach', null);
insert into ADMIN.PHONGBAN values('PB002', N'Tai chinh', null);
insert into ADMIN.PHONGBAN values('PB003', N'Nhan su', null);
insert into ADMIN.PHONGBAN values('PB004', N'Ky thuat', null);
insert into ADMIN.PHONGBAN values('PB005', N'Marketing', null);
insert into ADMIN.PHONGBAN values('PB006', N'Hanh chinh', null);
insert into ADMIN.PHONGBAN values('PB007', N'Ke toan', null);
insert into ADMIN.PHONGBAN values('PB008', N'Kinh doanh', null);

update ADMIN.PHONGBAN set TRPHG = 'NV004' where MAPB = 'PB001'; 
update ADMIN.PHONGBAN set TRPHG = 'NV008' where MAPB = 'PB002'; 

insert into ADMIN.DEAN values('DA001', N'HTTT quan ly cac truong DH', TO_DATE('2007-10-20', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA002', N'Nghien cuu te bao goc', TO_DATE('2006-10-20', 'YYYY-MM-DD'), 'PB006');
insert into ADMIN.DEAN values('DA003', N'Ung dung hoa hoc xanh', TO_DATE('2003-10-10', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA004', N'HTTT quan ly giao vien cho mot Khoa', TO_DATE('2000-10-23', 'YYYY-MM-DD'), 'PB003');
insert into ADMIN.DEAN values('DA005', N'HTTT quan ly thu vien cac truong DH', TO_DATE('2009-05-10', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA006', N'Nghien cuu che tao soi Nano Platin', TO_DATE('2008-05-15', 'YYYY-MM-DD'), 'PB005');

insert into ADMIN.PHANCONG values('NV001', 'DA002', 3);
insert into ADMIN.PHANCONG values('NV002', 'DA001', 3);
insert into ADMIN.PHANCONG values('NV003', 'DA006', 3);
insert into ADMIN.PHANCONG values('NV005', 'DA006', 3);
insert into ADMIN.PHANCONG values('NV008', 'DA006', 3);

alter table ADMIN.NHANVIEN add constraint FK_NV_QL foreign key (MANQL) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.NHANVIEN add constraint FK_NV_PHG foreign key (PHG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHONGBAN add constraint FK_NV_TRPHG foreign key (TRPHG) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.DEAN add constraint FK_DA_PHG foreign key (PHONG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHANCONG add constraint FK_PC_DA foreign key (MADA) references ADMIN.DEAN(MADA);
alter table ADMIN.PHANCONG add constraint FK_PC_NV foreign key (MANV) references ADMIN.NHANVIEN(MANV);

Select*from admin.PHONGBAN;
Select*from admin.NHANVIEN;
SELECT*FROM ADMIN.PHANCONG;