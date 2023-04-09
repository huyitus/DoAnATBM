alter session set "_ORACLE_SCRIPT" = true;

drop user admin cascade;
create user admin identified by admin123;
grant all privileges to admin;
grant create session to admin;
conn admin/admin123;

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
    constraint check_phai check (PHAI in (N'Nam', N'Nữ'))
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

alter table ADMIN.NHANVIEN add constraint FK_NV_QL foreign key (MANQL) references NHANVIEN(MANV);
alter table ADMIN.NHANVIEN add constraint FK_NV_PHG foreign key (PHG) references PHONGBAN(MAPB);
alter table ADMIN.PHONGBAN add constraint FK_NV_TRPHG foreign key (TRPHG) references NHANVIEN(MANV);
alter table ADMIN.DEAN add constraint FK_DA_PHG foreign key (PHONG) references PHONGBAN(MAPB);
alter table ADMIN.PHANCONG add constraint FK_PC_DA foreign key (MADA) references DEAN(MADA);
alter table ADMIN.PHANCONG add constraint FK_PC_NV foreign key (MANV) references NHANVIEN(MANV);

insert into ADMIN.PHONGBAN values('PB001', N'Kế hoạch',null);
insert into ADMIN.PHONGBAN values('PB002', N'Tài chính',null);
insert into ADMIN.PHONGBAN values('PB003', N'Nhân sự',null);
insert into ADMIN.PHONGBAN values('PB004', N'Kỹ thuật',null);
insert into ADMIN.PHONGBAN values('PB005', N'Marketing',null);
insert into ADMIN.PHONGBAN values('PB006', N'Hành chính',null);

alter session set nls_date_format = 'YYYY-MM-DD';
insert into ADMIN.DEAN values('DA001', N'HTTT quản lý các trư�?ng �?H', '2007-10-20', 'PB006');
insert into ADMIN.DEAN values('DA002', N'Nghiên cứu tế bào gốc', '2006-10-20', 'PB006');
insert into ADMIN.DEAN values('DA003', N'Ứng dụng hóa h�?c xanh', '2003-10-10', 'PB001');
insert into ADMIN.DEAN values('DA004', N'HTTT quản lý giáo viên cho một Khoa', '2000-10-23', 'PB003');
insert into ADMIN.DEAN values('DA005', N'HTTT quản lý thư viện các trư�?ng �?H', '2009-05-10', 'PB001');
insert into ADMIN.DEAN values('DA006', N'Nghiên cứu chế tạo sợi Nano Platin', '2008-05-15', 'PB005');
