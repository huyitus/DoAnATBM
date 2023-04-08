alter session set "_ORACLE_SCRIPT" = true;

drop table PHANCONG;
drop table DEAN;
drop table PHONGBAN;
drop table NHANVIEN;

create table NHANVIEN (
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


create table PHONGBAN (
    MAPB varchar(5) primary key,
    TENPB nvarchar2(50),
    TRPHG varchar(5)
);

create table DEAN (
    MADA varchar(5) primary key,
    TENDA nvarchar2(50),
    NGAYBD date,
    PHONG varchar(5)
);

create table PHANCONG (
    MANV varchar(5),
    MADA varchar(5),
    THOIGIAN int,
    primary key (MANV, MADA)
);

alter table NHANVIEN add constraint FK_NV_QL foreign key (MANQL) references NHANVIEN(MANV);
alter table NHANVIEN add constraint FK_NV_PHG foreign key (PHG) references PHONGBAN(MAPB);
alter table PHONGBAN add constraint FK_NV_TRPHG foreign key (TRPHG) references NHANVIEN(MANV);
alter table DEAN add constraint FK_DA_PHG foreign key (PHONG) references PHONGBAN(MAPB);
alter table PHANCONG add constraint FK_PC_DA foreign key (MADA) references DEAN(MADA);
alter table PHANCONG add constraint FK_PC_NV foreign key (MANV) references NHANVIEN(MANV);

insert into PHONGBAN values('PB001', N'Kế hoạch',null);
insert into PHONGBAN values('PB002', N'Tài chính',null);
insert into PHONGBAN values('PB003', N'Nhân sự',null);
insert into PHONGBAN values('PB004', N'Kỹ thuật',null);
insert into PHONGBAN values('PB005', N'Marketing',null);
insert into PHONGBAN values('PB006', N'Hành chính',null);

alter session set nls_date_format = 'YY-MM-DD';
insert into DEAN values('DA001', N'HTTT quản lý các trường ĐH', '2007-10-20', 'PB006');
insert into DEAN values('DA002', N'Nghiên cứu tế bào gốc', '2006-10-20', 'PB006');
insert into DEAN values('DA003', N'Ứng dụng hóa học xanh', '2003-10-10', 'PB001');
insert into DEAN values('DA004', N'HTTT quản lý giáo viên cho một Khoa', '2000-10-23', 'PB003');
insert into DEAN values('DA005', N'HTTT quản lý thư viện các trường ĐH', '2009-05-10', 'PB001');
insert into DEAN values('DA006', N'Nghiên cứu chế tạo sợi Nano Platin', '2008-05-15', 'PB005');

drop user admin cascade;

create user admin identified by admin123;
grant connect to admin;

conn admin/admin123;