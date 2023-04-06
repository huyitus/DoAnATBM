alter session set "_ORACLE_SCRIPT" = true;

drop table PHANCONG;
drop table DEAN;
drop table PHONGBAN;
drop table NHANVIEN;

create table NHANVIEN (
    MANV int primary key,
    TENNV nvarchar2(50),
    PHAI nvarchar2(3),
    NGAYSINH date,
    DIACHI nvarchar2(255),
    SODT varchar(10),
    LUONG int,
    PHUCAP int,
    VAITRO nvarchar2(20),
    MANQL int,
    PHG int,
    constraint check_phai check (PHAI in (N'Nam', N'Nữ'))
);

create table PHONGBAN (
    MAPB int primary key,
    TENPB nvarchar2(50),
    TRPHG int
);

create table DEAN (
    MADA int primary key,
    TENDA nvarchar2(50),
    NGAYBD date,
    PHONG int
);

create table PHANCONG (
    MANV int,
    MADA int,
    THOIGIAN int,
    primary key (MANV, MADA)
);

alter table NHANVIEN add foreign key (MANQL) references NHANVIEN(MANV);
alter table NHANVIEN add foreign key (PHG) references PHONGBAN(MAPB);
alter table PHONGBAN add foreign key (TRPHG) references NHANVIEN(MANV);
alter table DEAN add foreign key (PHONG) references PHONGBAN(MAPB);
alter table PHANCONG add foreign key (MADA) references DEAN(MADA);
alter table PHANCONG add foreign key (MANV) references NHANVIEN(MANV);

drop user admin;

create user admin identified by admin123;
grant connect to admin;

conn admin/admin123;