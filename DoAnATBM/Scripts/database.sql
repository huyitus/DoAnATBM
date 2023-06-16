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

alter session set nls_date_format = 'YYYY-MM-DD';

insert into ADMIN.NHANVIEN values('NV001', 'Nguyen Van An', 'Nam', '1990-05-01', 'Quan 2', '0768897001', '15000000', '1000000', 'Quan ly', null, 'PB001');
insert into ADMIN.NHANVIEN values('NV002', 'Nguyen Thi Bich', 'Nu', '1990-06-07', 'Quan 3', '0768897002', '10000000', '1000000', 'Nhan vien', 'NV001', 'PB001');
insert into ADMIN.NHANVIEN values('NV003', 'Nguyen Van Chung', 'Nam', '1990-03-07', 'Quan 2', '0768897003', '10000000', '1000000', 'Nhan vien', 'NV001', 'PB001');

insert into ADMIN.PHONGBAN values('PB001', N'Ke hoach', null);
insert into ADMIN.PHONGBAN values('PB002', N'Tai chinh', null);
insert into ADMIN.PHONGBAN values('PB003', N'Nhan su', null);
insert into ADMIN.PHONGBAN values('PB004', N'Ky thuat', null);
insert into ADMIN.PHONGBAN values('PB005', N'Marketing', null);
insert into ADMIN.PHONGBAN values('PB006', N'Hanh chinh', null);

insert into ADMIN.DEAN values('DA001', N'HTTT quan ly cac truong DH', '2007-10-20', 'PB001');
insert into ADMIN.DEAN values('DA002', N'Nghien cuu te bao goc', '2006-10-20', 'PB006');
insert into ADMIN.DEAN values('DA003', N'Ung dung hoa hoc xanh', '2003-10-10', 'PB001');
insert into ADMIN.DEAN values('DA004', N'HTTT quan ly giao vien cho mot Khoa', '2000-10-23', 'PB003');
insert into ADMIN.DEAN values('DA005', N'HTTT quan ly thu vien cac truong DH', '2009-05-10', 'PB001');
insert into ADMIN.DEAN values('DA006', N'Nghien cuu che tao soi Nano Platin', '2008-05-15', 'PB005');

insert into ADMIN.PHANCONG values('NV002', 'DA001', 3);
insert into ADMIN.PHANCONG values('NV003', 'DA006', 3);

alter table ADMIN.NHANVIEN add constraint FK_NV_QL foreign key (MANQL) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.NHANVIEN add constraint FK_NV_PHG foreign key (PHG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHONGBAN add constraint FK_NV_TRPHG foreign key (TRPHG) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.DEAN add constraint FK_DA_PHG foreign key (PHONG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHANCONG add constraint FK_PC_DA foreign key (MADA) references ADMIN.DEAN(MADA);
alter table ADMIN.PHANCONG add constraint FK_PC_NV foreign key (MANV) references ADMIN.NHANVIEN(MANV);