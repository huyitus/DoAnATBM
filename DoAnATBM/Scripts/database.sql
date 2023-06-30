alter session set "_ORACLE_SCRIPT" = true;

drop user admin cascade;
create user admin identified by admin123;
grant all privileges to admin;
grant create session to admin;

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

insert into ADMIN.NHANVIEN values('QL001', 'Nguyen Van An', N'Nam', '1990-05-01', 'Quan 2', '0768897001', 15000000, 1000000, 'Quan ly', NULL, 'PB001');
insert into ADMIN.NHANVIEN values('NV001', 'Nguyen Thi Bich', 'Nu', '1990-06-07', 'Quan 3', '0768897002', 10000000, 1000000, 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV002', 'Nguyen Van Chung', 'Nam', '1990-03-07', 'Quan 2', '0768897003', 10000000, 1000000, 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('QL002', 'Nguyen Van Chu', 'Nam', '1991-04-07', 'Quan 2', '0768897013', 10000000, 1000000, 'Quan ly', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV003', 'Nguyen Van Chun', 'Nam', '1992-03-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Nhan vien', 'QL001', 'PB002');
insert into ADMIN.NHANVIEN values('GD001', 'Nguyen Van Ha', 'Nam', '1992-04-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Giam doc', NULL, 'PB004');
insert into ADMIN.NHANVIEN values('TP001', 'Nguyen Van Chun', 'Nam', '1992-03-07', 'Quan 2', '0768897093', 10000000, 1000000, 'Truong phong', NULL, 'PB002');
insert into ADMIN.NHANVIEN values('TC001', 'Tran Van Hai', 'Nam', TO_DATE('1990-05-18', 'YYYY-MM-DD'), 'Quan 10', '0492295395', 10000000, 1000000, 'Tai chinh', NULL, NULL);
insert into ADMIN.NHANVIEN values('GD002', 'Nguyen Thi Ha', 'Nu', TO_DATE('1992-10-18', 'YYYY-MM-DD'), 'Quan 2', '0768897093', 10000000, 1000000, 'Giam doc', NULL, 'PB002');


insert into ADMIN.PHONGBAN values('PB001', N'Ke hoach', null);
insert into ADMIN.PHONGBAN values('PB002', N'Tai chinh', null);
insert into ADMIN.PHONGBAN values('PB003', N'Nhan su', null);
insert into ADMIN.PHONGBAN values('PB004', N'Ky thuat', null);
insert into ADMIN.PHONGBAN values('PB005', N'Marketing', null);
insert into ADMIN.PHONGBAN values('PB006', N'Hanh chinh', null);
insert into ADMIN.PHONGBAN values('PB007', N'Ke toan', null);
insert into ADMIN.PHONGBAN values('PB008', N'Kinh doanh', null);

update ADMIN.PHONGBAN set TRPHG = 'QL001' where MAPB = 'PB001'; 
update ADMIN.PHONGBAN set TRPHG = 'TP001' where MAPB = 'PB002'; 
select * from ADMIN.DEAN;
insert into ADMIN.DEAN values('DA001', N'HTTT quan ly cac truong DH', TO_DATE('2007-10-20', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA002', N'Nghien cuu te bao goc', TO_DATE('2006-10-20', 'YYYY-MM-DD'), 'PB006');
insert into ADMIN.DEAN values('DA003', N'Ung dung hoa hoc xanh', TO_DATE('2003-10-10', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA004', N'HTTT quan ly giao vien cho mot Khoa', TO_DATE('2000-10-23', 'YYYY-MM-DD'), 'PB003');
insert into ADMIN.DEAN values('DA005', N'HTTT quan ly thu vien cac truong DH', TO_DATE('2009-05-10', 'YYYY-MM-DD'), 'PB001');
insert into ADMIN.DEAN values('DA006', N'Nghien cuu che tao soi Nano Platin', TO_DATE('2008-05-15', 'YYYY-MM-DD'), 'PB005');

insert into ADMIN.PHANCONG values('QL001', 'DA002', 3);
insert into ADMIN.PHANCONG values('NV002', 'DA001', 3);
insert into ADMIN.PHANCONG values('NV003', 'DA006', 3);
insert into ADMIN.PHANCONG values('NV001', 'DA006', 3);
insert into ADMIN.PHANCONG values('TP001', 'DA006', 3);

alter table ADMIN.NHANVIEN add constraint FK_NV_QL foreign key (MANQL) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.NHANVIEN add constraint FK_NV_PHG foreign key (PHG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHONGBAN add constraint FK_NV_TRPHG foreign key (TRPHG) references ADMIN.NHANVIEN(MANV);
alter table ADMIN.DEAN add constraint FK_DA_PHG foreign key (PHONG) references ADMIN.PHONGBAN(MAPB);
alter table ADMIN.PHANCONG add constraint FK_PC_DA foreign key (MADA) references ADMIN.DEAN(MADA);
alter table ADMIN.PHANCONG add constraint FK_PC_NV foreign key (MANV) references ADMIN.NHANVIEN(MANV);

Select*from admin.PHONGBAN;
Select*from admin.NHANVIEN;
SELECT*FROM ADMIN.PHANCONG;

/

insert into ADMIN.NHANVIEN values('QL003', 'Dang Thuy Tu', 'Nam', '1987-09-26', 'Quan 8', '0919528624', '12100000', '1400000', 'Quan ly', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('QL004', 'Huynh Van Tai', 'Nam', '1995-02-24', 'Quan 6', '0919445226', '13500000', '4800000', 'Quan ly', 'null', 'PB001');
insert into ADMIN.NHANVIEN values('QL005', 'Ho Quoc Tam', 'Nam', '1987-06-26', 'Huyen Cu Chi', '0919410681', '10700000', '3000000', 'Quan ly', 'null', 'PB002');
insert into ADMIN.NHANVIEN values('QL006', 'Ly Duc Hung', 'Nam', '1991-09-13', 'Quan 6', '0919011704', '9200000', '4100000', 'Quan ly', 'null', 'PB001');
insert into ADMIN.NHANVIEN values('QL007', 'Do Tuyet Huy', 'Nam', '1987-02-06', 'Quan Binh Thanh', '0919447115', '9100000', '3400000', 'Quan ly', 'null', 'PB004');
insert into ADMIN.NHANVIEN values('QL008', 'Bui Quang Tran', 'Nam', '1994-04-11', 'Quan 12', '0919506680', '11200000', '1000000', 'Quan ly', 'null', 'PB005');
insert into ADMIN.NHANVIEN values('QL009', 'Vo Hong Tu', 'Nam', '1990-08-11', 'Quan 12', '0919034056', '9500000', '3200000', 'Quan ly', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('QL010', 'Ho My Long', 'Nam', '1994-07-02', 'Quan Tan Binh', '0919153802', '8900000', '3100000', 'Quan ly', 'null', 'PB005');
insert into ADMIN.NHANVIEN values('QL011', 'Le Tuyet Khai', 'Nam', '1982-11-14', 'Quan 5', '0919824687', '9400000', '1300000', 'Quan ly', 'null', 'PB002');
insert into ADMIN.NHANVIEN values('QL012', 'Ngo Van Danh', 'Nam', '1986-10-08', 'Quan Go Vap', '0919517667', '10500000', '4000000', 'Quan ly', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('QL013', 'Pham Yen Bao', 'Nam', '1984-05-27', 'Quan 5', '0919674888', '13000000', '3100000', 'Quan ly', 'null', 'PB004');
insert into ADMIN.NHANVIEN values('QL014', 'Ho Thu Bang', 'Nam', '1990-06-02', 'Quan 8', '0919868658', '11200000', '3100000', 'Quan ly', 'null', 'PB006');
insert into ADMIN.NHANVIEN values('QL015', 'Vo Trung Lam', 'Nam', '1988-01-01', 'Quan 3', '0919451582', '9600000', '2400000', 'Quan ly', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('QL016', 'Nguyen Yen Hieu', 'Nam', '1998-01-10', 'Quan 8', '0919243863', '9100000', '1300000', 'Quan ly', 'null', 'PB004');
insert into ADMIN.NHANVIEN values('QL017', 'Le Thu Phuong', 'Nam', '1981-01-13', 'Quan 7', '0919474224', '8200000', '3600000', 'Quan ly', 'null', 'PB006');
insert into ADMIN.NHANVIEN values('QL018', 'Duong Mai Huong', 'Nam', '1988-01-22', 'Quan Binh Thanh', '0919383427', '14900000', '1300000', 'Quan ly', 'null', 'PB003');
insert into ADMIN.NHANVIEN values('QL019', 'Ly Thu Duy', 'Nam', '1984-02-05', 'Quan 6', '0919801838', '11000000', '4800000', 'Quan ly', 'null', 'PB006');
insert into ADMIN.NHANVIEN values('QL020', 'Tran Mai Anh', 'Nam', '1981-02-02', 'Quan Binh Thanh', '0919868574', '14200000', '4500000', 'Quan ly', 'null', 'PB004');

insert into ADMIN.NHANVIEN values('TP002', 'Ly Quoc Hung', 'Nam', '1982-05-11', 'Quan Go Vap', '0919553856', '13100000', '2200000', 'Truong phong', 'null', 'PB005');
insert into ADMIN.NHANVIEN values('TP003', 'Vo Ngoc Thuong', 'Nam', '1983-04-03', 'Quan Tan Binh', '0919525482', '11100000', '4500000', 'Truong phong', 'null', 'PB003');
insert into ADMIN.NHANVIEN values('TP004', 'Ngo Quang Tuyet', 'Nam', '1996-03-26', 'Quan 5', '0919802005', '8100000', '1800000', 'Truong phong', 'null', 'PB003');
insert into ADMIN.NHANVIEN values('TP005', 'Dang Duc Son', 'Nam', '1989-09-05', 'Huyen Binh Chanh', '0919516838', '9800000', '1500000', 'Truong phong', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('TP006', 'Duong Dang Hien', 'Nam', '1989-10-05', 'Quan 12', '0919370116', '11600000', '4500000', 'Truong phong', 'null', 'PB007');
insert into ADMIN.NHANVIEN values('TP007', 'Nguyen Huu Tho', 'Nam', '1998-05-17', 'Quan 5', '0919514728', '11700000', '3900000', 'Truong phong', 'null', 'PB007');

insert into ADMIN.NHANVIEN values('TC002', 'Dang Hong Phuc', 'Nam', '1982-05-26', 'Quan 10', '0919248580', '8500000', '4900000', 'Tai chinh', 'QL018', 'PB002');
insert into ADMIN.NHANVIEN values('TC003', 'Tran Dang Duong', 'Nam', '1981-06-21', 'Quan 11', '0919734801', '13900000', '2600000', 'Tai chinh', 'QL005', 'PB002');
insert into ADMIN.NHANVIEN values('TC004', 'Phan Thi Trang', 'Nam', '1996-05-21', 'Huyen Cu Chi', '0919175368', '12200000', '1000000', 'Tai chinh', 'QL015', 'PB002');
insert into ADMIN.NHANVIEN values('TC005', 'Ngo Duy Vy', 'Nam', '1984-03-13', 'Quan 6', '0919165381', '14700000', '4200000', 'Tai chinh', 'QL001', 'PB002');

insert into ADMIN.NHANVIEN values('NS001', 'Ho Quynh Phuoc', 'Nam', '1988-11-01', 'Quan 10', '0919601582', '9300000', '2700000', 'Nhan su', 'QL013', 'PB003');
insert into ADMIN.NHANVIEN values('NS002', 'Huynh Tuan Bich', 'Nam', '1989-06-26', 'Quan 6', '0919841486', '11900000', '1000000', 'Nhan su', 'QL003', 'PB003');
insert into ADMIN.NHANVIEN values('NS003', 'Bui Thuy Phung', 'Nam', '1995-02-17', 'Huyen Cu Chi', '0919811660', '14300000', '4500000', 'Nhan su', 'QL017', 'PB003');
insert into ADMIN.NHANVIEN values('NS004', 'Vo Tan Nhu', 'Nam', '1990-05-26', 'Quan 6', '0919763847', '10500000', '1900000', 'Nhan su', 'QL005', 'PB003');
insert into ADMIN.NHANVIEN values('NS005', 'Pham Tan Truc', 'Nam', '1994-01-12', 'Quan 6', '0919641162', '13700000', '3800000', 'Nhan su', 'QL001', 'PB003');

insert into ADMIN.NHANVIEN values('TD001', 'Tran Mai Phuong', 'Nam', '1993-09-01', 'Quan 6', '0919054723', '14300000', '3700000', 'Truong de an', 'QL011', 'PB001');
insert into ADMIN.NHANVIEN values('TD002', 'Phan Quang Nhan', 'Nam', '1991-10-26', 'Quan 1', '0919500031', '12900000', '2000000', 'Truong de an', 'QL014', 'PB004');
insert into ADMIN.NHANVIEN values('TD003', 'Dang Dang Chi', 'Nam', '1982-04-09', 'Quan 1', '0919607743', '8200000', '2400000', 'Truong de an', 'QL015', 'PB004');

insert into ADMIN.NHANVIEN values('NV004', 'Vo Thanh My', 'Nam', '1992-04-03', 'Quan 1', '0919503826', '11500000', '3100000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV005', 'Tran Thanh Dat', 'Nam', '1998-06-09', 'Huyen Nha Be', '0919808833', '9300000', '3100000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV006', 'Pham Van Duong', 'Nam', '1982-01-12', 'Quan 1', '0919711746', '10500000', '4800000', 'Nhan vien', 'QL009', 'PB007');
insert into ADMIN.NHANVIEN values('NV007', 'Tran Trung Hiep', 'Nam', '1999-10-12', 'Quan 11', '0919436220', '12500000', '1100000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV008', 'Pham Van Khoi', 'Nam', '1995-11-24', 'Quan 6', '0919006258', '14300000', '2200000', 'Nhan vien', 'QL015', 'PB007');
insert into ADMIN.NHANVIEN values('NV009', 'Duong Mai Nguyen', 'Nam', '1981-02-06', 'Huyen Hoc Mon', '0919730247', '8100000', '2000000', 'Nhan vien', 'QL014', 'PB006');
insert into ADMIN.NHANVIEN values('NV010', 'Tran Thao Uyen', 'Nam', '1990-03-19', 'Quan Tan Binh', '0919248875', '8500000', '3300000', 'Nhan vien', 'QL019', 'PB004');
insert into ADMIN.NHANVIEN values('NV011', 'Vo Tan Nhut', 'Nam', '1987-10-25', 'Quan Tan Phu', '0919130754', '11400000', '2000000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV012', 'Le Thanh Phung', 'Nam', '1985-08-04', 'Quan 1', '0919485822', '12000000', '4700000', 'Nhan vien', 'QL003', 'PB004');
insert into ADMIN.NHANVIEN values('NV013', 'Pham Duy Kha', 'Nam', '1987-01-05', 'Quan 12', '0919871413', '9700000', '2600000', 'Nhan vien', 'QL006', 'PB001');
insert into ADMIN.NHANVIEN values('NV014', 'Dang Trung Nghi', 'Nam', '1999-01-04', 'Quan 4', '0919441006', '14100000', '1400000', 'Nhan vien', 'QL005', 'PB001');
insert into ADMIN.NHANVIEN values('NV015', 'Nguyen Yen Linh', 'Nam', '1990-09-11', 'Huyen Hoc Mon', '0919074166', '8500000', '2600000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV016', 'Vo Tuyet Tan', 'Nam', '1986-03-01', 'Quan 1', '0919825661', '13300000', '3100000', 'Nhan vien', 'QL001', 'PB007');
insert into ADMIN.NHANVIEN values('NV017', 'Pham Huu Phu', 'Nam', '1984-09-03', 'Huyen Hoc Mon', '0919646336', '14600000', '1800000', 'Nhan vien', 'QL005', 'PB007');
insert into ADMIN.NHANVIEN values('NV018', 'Pham Hong Tung', 'Nam', '1999-06-16', 'Quan 5', '0919336382', '11200000', '2700000', 'Nhan vien', 'QL005', 'PB004');
insert into ADMIN.NHANVIEN values('NV019', 'Bui Ngoc Thang', 'Nam', '1988-04-04', 'Huyen Cu Chi', '0919067411', '11300000', '4300000', 'Nhan vien', 'QL003', 'PB005');
insert into ADMIN.NHANVIEN values('NV020', 'Huynh Thu Tam', 'Nam', '1987-09-22', 'Quan 3', '0919830506', '12700000', '4500000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV021', 'Ho Quang Phung', 'Nam', '1990-11-05', 'Huyen Nha Be', '0919758757', '10800000', '4200000', 'Nhan vien', 'QL004', 'PB001');
insert into ADMIN.NHANVIEN values('NV022', 'Pham Yen Truong', 'Nam', '1995-01-25', 'Huyen Hoc Mon', '0919071264', '14700000', '3300000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV023', 'Nguyen Thanh Dai', 'Nam', '1980-07-02', 'Quan 1', '0919450844', '13400000', '1900000', 'Nhan vien', 'QL009', 'PB006');
insert into ADMIN.NHANVIEN values('NV024', 'Bui Thi Thy', 'Nam', '1983-03-25', 'Quan 6', '0919763335', '14300000', '1600000', 'Nhan vien', 'QL006', 'PB007');
insert into ADMIN.NHANVIEN values('NV025', 'Ly Yen Ky', 'Nam', '1999-09-24', 'Quan Binh Thanh', '0919310622', '12200000', '1200000', 'Nhan vien', 'QL016', 'PB001');
insert into ADMIN.NHANVIEN values('NV026', 'Do Ngoc Dong', 'Nam', '1987-09-05', 'Huyen Cu Chi', '0919403816', '11500000', '4400000', 'Nhan vien', 'QL012', 'PB007');
insert into ADMIN.NHANVIEN values('NV027', 'Phan Thao Giang', 'Nam', '1995-01-21', 'Quan 1', '0919734026', '13800000', '2000000', 'Nhan vien', 'QL005', 'PB001');
insert into ADMIN.NHANVIEN values('NV028', 'Pham Quang Thang', 'Nam', '1998-03-21', 'Quan 11', '0919510181', '12800000', '3800000', 'Nhan vien', 'QL019', 'PB007');
insert into ADMIN.NHANVIEN values('NV029', 'Tran Thanh Linh', 'Nam', '1989-08-23', 'Huyen Cu Chi', '0919157283', '10000000', '1500000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV030', 'Tran Thanh Sang', 'Nam', '1982-11-13', 'Quan 3', '0919254743', '14100000', '4700000', 'Nhan vien', 'QL012', 'PB001');
insert into ADMIN.NHANVIEN values('NV031', 'Nguyen Tan Lam', 'Nam', '1985-04-11', 'Quan 3', '0919765021', '9000000', '2800000', 'Nhan vien', 'QL019', 'PB005');
insert into ADMIN.NHANVIEN values('NV032', 'Vo Quynh Quang', 'Nam', '1987-04-06', 'Quan 4', '0919145163', '12200000', '4100000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV033', 'Tran Ngoc Tan', 'Nam', '1985-03-19', 'Quan Phu Nhuan', '0919452486', '12100000', '4400000', 'Nhan vien', 'QL015', 'PB007');
insert into ADMIN.NHANVIEN values('NV034', 'Nguyen Tan Viet', 'Nam', '1987-09-05', 'Huyen Hoc Mon', '0919085011', '14800000', '1800000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV035', 'Tran Thi Nhan', 'Nam', '1999-03-02', 'Huyen Binh Chanh', '0919008888', '8500000', '2600000', 'Nhan vien', 'QL013', 'PB001');
insert into ADMIN.NHANVIEN values('NV036', 'Phan Dang Tuan', 'Nam', '1998-01-10', 'Quan 7', '0919608780', '14000000', '1300000', 'Nhan vien', 'QL010', 'PB004');
insert into ADMIN.NHANVIEN values('NV037', 'Dang Quang Quoc', 'Nam', '1980-08-10', 'Quan Tan Phu', '0919735352', '10000000', '2200000', 'Nhan vien', 'QL004', 'PB004');
insert into ADMIN.NHANVIEN values('NV038', 'Tran Thanh Kieu', 'Nam', '1990-05-22', 'Quan Go Vap', '0919475231', '13700000', '1500000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV039', 'Vo Thu Thong', 'Nam', '1984-04-24', 'Quan 1', '0919468780', '8000000', '2300000', 'Nhan vien', 'QL012', 'PB004');
insert into ADMIN.NHANVIEN values('NV040', 'Do Thu Van', 'Nam', '1987-02-19', 'Quan 11', '0919103325', '14000000', '4800000', 'Nhan vien', 'QL016', 'PB006');
insert into ADMIN.NHANVIEN values('NV041', 'Bui Duy Y', 'Nam', '1993-10-20', 'Quan Go Vap', '0919586757', '8800000', '1300000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV042', 'Le Truc An', 'Nam', '1998-09-07', 'Quan 1', '0919308444', '13100000', '4500000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV043', 'Tran Tuyet Nguyen', 'Nam', '1990-04-21', 'Quan Phu Nhuan', '0919287251', '12400000', '4100000', 'Nhan vien', 'QL010', 'PB007');
insert into ADMIN.NHANVIEN values('NV044', 'Ly Yen Vinh', 'Nam', '1991-06-15', 'Quan 11', '0919067255', '14100000', '2100000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV045', 'Bui Thao Phuong', 'Nam', '1993-10-03', 'Quan 5', '0919706330', '12500000', '3300000', 'Nhan vien', 'QL014', 'PB006');
insert into ADMIN.NHANVIEN values('NV046', 'Pham Tuyet Tam', 'Nam', '1993-05-08', 'Quan Go Vap', '0919270462', '8400000', '1500000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV047', 'Bui Quang Hao', 'Nam', '1996-09-24', 'Quan 12', '0919874787', '13200000', '2100000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV048', 'Ly Truc Dong', 'Nam', '1999-05-26', 'Quan 1', '0919463276', '11300000', '2000000', 'Nhan vien', 'QL015', 'PB005');
insert into ADMIN.NHANVIEN values('NV049', 'Pham Duc Phuong', 'Nam', '1988-04-21', 'Quan 3', '0919176651', '8200000', '2800000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV050', 'Ngo Thanh Nguyen', 'Nam', '1996-01-26', 'Huyen Cu Chi', '0919602516', '11200000', '4100000', 'Nhan vien', 'QL016', 'PB007');
insert into ADMIN.NHANVIEN values('NV051', 'Dang Dang Kim', 'Nam', '1992-09-26', 'Quan Tan Binh', '0919384742', '14800000', '2200000', 'Nhan vien', 'QL008', 'PB005');
insert into ADMIN.NHANVIEN values('NV052', 'Duong Tuan Hung', 'Nam', '1997-07-13', 'Quan Phu Nhuan', '0919780045', '13100000', '2800000', 'Nhan vien', 'QL014', 'PB001');
insert into ADMIN.NHANVIEN values('NV053', 'Ho My Nhi', 'Nam', '1982-10-08', 'Quan 5', '0919026033', '14400000', '4100000', 'Nhan vien', 'QL016', 'PB005');
insert into ADMIN.NHANVIEN values('NV054', 'Pham Trung Thuy', 'Nam', '1988-09-06', 'Quan 4', '0919185567', '8700000', '2900000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV055', 'Ho Duy Khanh', 'Nam', '1987-11-17', 'Huyen Can Gio', '0919650311', '11200000', '4300000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV056', 'Ly Tuan Nhan', 'Nam', '1993-06-15', 'Quan 3', '0919010442', '13800000', '4000000', 'Nhan vien', 'QL013', 'PB004');
insert into ADMIN.NHANVIEN values('NV057', 'Bui Yen Hau', 'Nam', '1987-11-02', 'Quan 6', '0919156670', '14300000', '2900000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV058', 'Vo Hong Duyen', 'Nam', '1997-08-07', 'Quan 3', '0919401834', '9200000', '3000000', 'Nhan vien', 'QL019', 'PB005');
insert into ADMIN.NHANVIEN values('NV059', 'Pham Thu Duy', 'Nam', '1986-04-09', 'Huyen Can Gio', '0919746618', '9300000', '3600000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV060', 'Bui Hong Thien', 'Nam', '1988-11-13', 'Huyen Can Gio', '0919367071', '8300000', '4700000', 'Nhan vien', 'QL001', 'PB006');
insert into ADMIN.NHANVIEN values('NV061', 'Ho Ngoc Bach', 'Nam', '1985-10-02', 'Quan Binh Thanh', '0919333356', '8300000', '1800000', 'Nhan vien', 'QL019', 'PB001');
insert into ADMIN.NHANVIEN values('NV062', 'Le Duc Sang', 'Nam', '1996-08-21', 'Quan Tan Phu', '0919861214', '11700000', '2100000', 'Nhan vien', 'QL010', 'PB001');
insert into ADMIN.NHANVIEN values('NV063', 'Ly Thi Phuoc', 'Nam', '1989-05-01', 'Quan 12', '0919707745', '14500000', '2900000', 'Nhan vien', 'QL019', 'PB006');
insert into ADMIN.NHANVIEN values('NV064', 'Le Mai Tuan', 'Nam', '1992-08-19', 'Quan 6', '0919777082', '14500000', '1500000', 'Nhan vien', 'QL009', 'PB006');
insert into ADMIN.NHANVIEN values('NV065', 'Duong Tan Hieu', 'Nam', '1988-01-09', 'Huyen Hoc Mon', '0919144600', '13600000', '1600000', 'Nhan vien', 'QL017', 'PB005');
insert into ADMIN.NHANVIEN values('NV066', 'Dang Van Phi', 'Nam', '1983-09-20', 'Huyen Hoc Mon', '0919146168', '12200000', '4800000', 'Nhan vien', 'QL008', 'PB007');
insert into ADMIN.NHANVIEN values('NV067', 'Ho Quang Phi', 'Nam', '1990-11-03', 'Quan 1', '0919660205', '14000000', '2800000', 'Nhan vien', 'QL006', 'PB001');
insert into ADMIN.NHANVIEN values('NV068', 'Duong Yen Doanh', 'Nam', '1980-08-26', 'Quan 11', '0919524263', '11200000', '3000000', 'Nhan vien', 'QL016', 'PB007');
insert into ADMIN.NHANVIEN values('NV069', 'Bui Thao Thien', 'Nam', '1995-04-12', 'Quan 6', '0919878611', '8100000', '1800000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV070', 'Bui Quang Dao', 'Nam', '1990-07-27', 'Quan Tan Binh', '0919750521', '9900000', '1100000', 'Nhan vien', 'QL014', 'PB001');
insert into ADMIN.NHANVIEN values('NV071', 'Tran Thu Tan', 'Nam', '1995-03-27', 'Huyen Hoc Mon', '0919153818', '9000000', '3700000', 'Nhan vien', 'QL019', 'PB007');
insert into ADMIN.NHANVIEN values('NV072', 'Huynh Thu Khang', 'Nam', '1984-11-16', 'Quan 10', '0919816544', '12600000', '4100000', 'Nhan vien', 'QL018', 'PB005');
insert into ADMIN.NHANVIEN values('NV073', 'Ly Thao Nam', 'Nam', '1983-07-08', 'Quan Binh Thanh', '0919306657', '12100000', '3500000', 'Nhan vien', 'QL013', 'PB004');
insert into ADMIN.NHANVIEN values('NV074', 'Ly Mai Nhien', 'Nam', '1997-04-10', 'Quan 12', '0919067700', '9000000', '3700000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV075', 'Do Thanh Phong', 'Nam', '1981-11-10', 'Quan Phu Nhuan', '0919543534', '13100000', '3900000', 'Nhan vien', 'QL018', 'PB001');
insert into ADMIN.NHANVIEN values('NV076', 'Le Duc Lam', 'Nam', '1992-01-22', 'Quan 6', '0919428726', '9800000', '2700000', 'Nhan vien', 'QL007', 'PB006');
insert into ADMIN.NHANVIEN values('NV077', 'Ly Quoc Hoang', 'Nam', '1983-06-25', 'Huyen Can Gio', '0919483768', '10100000', '3300000', 'Nhan vien', 'QL019', 'PB005');
insert into ADMIN.NHANVIEN values('NV078', 'Do Dang Thang', 'Nam', '1993-06-17', 'Huyen Can Gio', '0919235617', '8500000', '2700000', 'Nhan vien', 'QL015', 'PB006');
insert into ADMIN.NHANVIEN values('NV079', 'Le My My', 'Nam', '1991-11-22', 'Huyen Hoc Mon', '0919145860', '14100000', '1900000', 'Nhan vien', 'QL018', 'PB004');
insert into ADMIN.NHANVIEN values('NV080', 'Pham Truc Tam', 'Nam', '1993-02-21', 'Quan Go Vap', '0919784583', '8900000', '3800000', 'Nhan vien', 'QL010', 'PB004');
insert into ADMIN.NHANVIEN values('NV081', 'Ho Tuan Khanh', 'Nam', '1999-02-19', 'Quan 8', '0919343050', '13600000', '4500000', 'Nhan vien', 'QL004', 'PB004');
insert into ADMIN.NHANVIEN values('NV082', 'Ly Mai Thuong', 'Nam', '1995-11-01', 'Quan 7', '0919653878', '11400000', '2900000', 'Nhan vien', 'QL015', 'PB005');
insert into ADMIN.NHANVIEN values('NV083', 'Ly Tuyet Binh', 'Nam', '1986-11-14', 'Quan Tan Binh', '0919041758', '14300000', '3700000', 'Nhan vien', 'QL007', 'PB005');
insert into ADMIN.NHANVIEN values('NV084', 'Duong Thi Bich', 'Nam', '1984-01-10', 'Huyen Hoc Mon', '0919382313', '8100000', '1200000', 'Nhan vien', 'QL007', 'PB006');
insert into ADMIN.NHANVIEN values('NV085', 'Ngo Mai Viet', 'Nam', '1985-04-13', 'Quan Binh Thanh', '0919875085', '13600000', '1200000', 'Nhan vien', 'QL004', 'PB006');
insert into ADMIN.NHANVIEN values('NV086', 'Ly Thuy Thao', 'Nam', '1996-01-09', 'Quan Binh Thanh', '0919058675', '12400000', '4100000', 'Nhan vien', 'QL007', 'PB005');
insert into ADMIN.NHANVIEN values('NV087', 'Bui Van Truong', 'Nam', '1984-09-06', 'Quan Tan Binh', '0919487886', '11600000', '3600000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV088', 'Ly Thu Tue', 'Nam', '1992-07-25', 'Quan Binh Thanh', '0919845410', '10700000', '3500000', 'Nhan vien', 'QL011', 'PB005');
insert into ADMIN.NHANVIEN values('NV089', 'Huynh Truc Khue', 'Nam', '1996-01-03', 'Quan Go Vap', '0919776766', '8000000', '3400000', 'Nhan vien', 'QL018', 'PB007');
insert into ADMIN.NHANVIEN values('NV090', 'Dang Thu Tam', 'Nam', '1996-07-25', 'Quan 8', '0919875636', '9200000', '1900000', 'Nhan vien', 'QL003', 'PB001');
insert into ADMIN.NHANVIEN values('NV091', 'Tran Trung Tra', 'Nam', '1989-09-07', 'Quan 6', '0919638623', '13400000', '1400000', 'Nhan vien', 'QL010', 'PB005');
insert into ADMIN.NHANVIEN values('NV092', 'Bui Quynh Thanh', 'Nam', '1995-05-14', 'Quan Binh Thanh', '0919340083', '9200000', '2600000', 'Nhan vien', 'QL007', 'PB005');
insert into ADMIN.NHANVIEN values('NV093', 'Nguyen Thi Dao', 'Nam', '1999-02-02', 'Quan 4', '0919323558', '14700000', '1200000', 'Nhan vien', 'QL008', 'PB004');
insert into ADMIN.NHANVIEN values('NV094', 'Bui Huu Nhien', 'Nam', '1983-05-04', 'Huyen Cu Chi', '0919747263', '8500000', '4600000', 'Nhan vien', 'QL017', 'PB001');
insert into ADMIN.NHANVIEN values('NV095', 'Duong Quang Loan', 'Nam', '1998-10-07', 'Quan 6', '0919210324', '10900000', '1500000', 'Nhan vien', 'QL002', 'PB006');
insert into ADMIN.NHANVIEN values('NV096', 'Duong Duy Tuyet', 'Nam', '1981-10-17', 'Huyen Hoc Mon', '0919745757', '9000000', '1600000', 'Nhan vien', 'QL012', 'PB007');
insert into ADMIN.NHANVIEN values('NV097', 'Bui Thanh Phung', 'Nam', '1999-03-11', 'Quan Tan Binh', '0919812315', '14600000', '2700000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV098', 'Nguyen Trung Tran', 'Nam', '1992-08-01', 'Quan Tan Phu', '0919464678', '14900000', '1000000', 'Nhan vien', 'QL004', 'PB001');
insert into ADMIN.NHANVIEN values('NV099', 'Pham My Sang', 'Nam', '1988-11-26', 'Huyen Binh Chanh', '0919272476', '9000000', '1500000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV100', 'Ly Quynh Minh', 'Nam', '1997-11-06', 'Quan 8', '0919255080', '8100000', '3500000', 'Nhan vien', 'QL005', 'PB007');
insert into ADMIN.NHANVIEN values('NV101', 'Huynh Quynh Han', 'Nam', '1987-10-12', 'Huyen Cu Chi', '0919428427', '14900000', '1800000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV102', 'Duong Trung Kien', 'Nam', '1999-09-16', 'Huyen Can Gio', '0919553268', '14800000', '1700000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV103', 'Bui Ngoc Nguyen', 'Nam', '1985-04-12', 'Quan 4', '0919504376', '13900000', '4900000', 'Nhan vien', 'QL009', 'PB005');
insert into ADMIN.NHANVIEN values('NV104', 'Duong Tuan Thuan', 'Nam', '1983-09-03', 'Huyen Binh Chanh', '0919760388', '12700000', '4300000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV105', 'Tran Quoc Duy', 'Nam', '1990-05-13', 'Quan 12', '0919752131', '8900000', '4200000', 'Nhan vien', 'QL015', 'PB006');
insert into ADMIN.NHANVIEN values('NV106', 'Do My Tho', 'Nam', '1994-06-05', 'Quan Phu Nhuan', '0919014145', '14800000', '1900000', 'Nhan vien', 'QL008', 'PB004');
insert into ADMIN.NHANVIEN values('NV107', 'Ngo Truc Uyen', 'Nam', '1987-11-26', 'Quan Tan Phu', '0919784734', '8400000', '1500000', 'Nhan vien', 'QL009', 'PB001');
insert into ADMIN.NHANVIEN values('NV108', 'Duong Quoc An', 'Nam', '1995-10-08', 'Huyen Binh Chanh', '0919256010', '14900000', '1000000', 'Nhan vien', 'QL013', 'PB005');
insert into ADMIN.NHANVIEN values('NV109', 'Ngo Thao Tham', 'Nam', '1993-07-20', 'Quan 5', '0919353028', '9300000', '3100000', 'Nhan vien', 'QL016', 'PB006');
insert into ADMIN.NHANVIEN values('NV110', 'Le Tan Dao', 'Nam', '1985-09-01', 'Quan Tan Phu', '0919616080', '14500000', '2000000', 'Nhan vien', 'QL001', 'PB006');
insert into ADMIN.NHANVIEN values('NV111', 'Vo Thanh Dai', 'Nam', '1998-10-25', 'Quan 7', '0919857851', '8200000', '1500000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV112', 'Nguyen Hong Thong', 'Nam', '1989-07-18', 'Quan 5', '0919648430', '10000000', '1200000', 'Nhan vien', 'QL006', 'PB004');
insert into ADMIN.NHANVIEN values('NV113', 'Dang Thuy Chau', 'Nam', '1988-05-23', 'Quan 10', '0919075380', '9000000', '3100000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV114', 'Vo Thu Quan', 'Nam', '1991-02-01', 'Huyen Nha Be', '0919344273', '13000000', '3700000', 'Nhan vien', 'QL008', 'PB006');
insert into ADMIN.NHANVIEN values('NV115', 'Vo Tuan Bach', 'Nam', '1992-02-02', 'Quan 12', '0919881886', '9800000', '1500000', 'Nhan vien', 'QL018', 'PB007');
insert into ADMIN.NHANVIEN values('NV116', 'Nguyen Truc Truc', 'Nam', '1991-04-10', 'Quan 11', '0919038216', '8200000', '2800000', 'Nhan vien', 'QL002', 'PB001');
insert into ADMIN.NHANVIEN values('NV117', 'Le Thuy Khang', 'Nam', '1990-03-08', 'Quan 11', '0919437324', '13100000', '2600000', 'Nhan vien', 'QL010', 'PB005');
insert into ADMIN.NHANVIEN values('NV118', 'Duong Thuy Thanh', 'Nam', '1984-04-09', 'Quan 6', '0919563113', '8800000', '4600000', 'Nhan vien', 'QL011', 'PB005');
insert into ADMIN.NHANVIEN values('NV119', 'Bui Van Bao', 'Nam', '1997-09-10', 'Quan 4', '0919272714', '12700000', '2900000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV120', 'Pham Hong Huong', 'Nam', '1994-10-22', 'Quan 1', '0919774874', '14000000', '1700000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV121', 'Huynh Thao Giang', 'Nam', '1995-02-20', 'Quan 3', '0919276378', '8800000', '1200000', 'Nhan vien', 'QL019', 'PB001');
insert into ADMIN.NHANVIEN values('NV122', 'Nguyen Dang Nhi', 'Nam', '1991-03-21', 'Huyen Can Gio', '0919317618', '12800000', '2600000', 'Nhan vien', 'QL008', 'PB007');
insert into ADMIN.NHANVIEN values('NV123', 'Le Van Phung', 'Nam', '1983-01-13', 'Quan 6', '0919525860', '8300000', '3800000', 'Nhan vien', 'QL014', 'PB001');
insert into ADMIN.NHANVIEN values('NV124', 'Nguyen Yen Toan', 'Nam', '1993-09-13', 'Quan Tan Phu', '0919046544', '13000000', '4800000', 'Nhan vien', 'QL014', 'PB007');
insert into ADMIN.NHANVIEN values('NV125', 'Duong Thuy Quang', 'Nam', '1997-10-16', 'Huyen Nha Be', '0919833726', '9300000', '4400000', 'Nhan vien', 'QL019', 'PB004');
insert into ADMIN.NHANVIEN values('NV126', 'Nguyen Yen Ky', 'Nam', '1988-05-19', 'Quan Tan Phu', '0919745484', '14300000', '4500000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV127', 'Bui Thuy Tram', 'Nam', '1999-03-08', 'Quan Tan Binh', '0919372264', '13700000', '3900000', 'Nhan vien', 'QL008', 'PB006');
insert into ADMIN.NHANVIEN values('NV128', 'Ngo Thi Tien', 'Nam', '1986-06-08', 'Quan 7', '0919876881', '9600000', '2300000', 'Nhan vien', 'QL017', 'PB004');
insert into ADMIN.NHANVIEN values('NV129', 'Duong Quynh Lam', 'Nam', '1986-09-23', 'Quan 7', '0919680808', '11300000', '1000000', 'Nhan vien', 'QL005', 'PB001');
insert into ADMIN.NHANVIEN values('NV130', 'Do Thu Lien', 'Nam', '1998-11-21', 'Huyen Hoc Mon', '0919028606', '10600000', '4700000', 'Nhan vien', 'QL015', 'PB006');
insert into ADMIN.NHANVIEN values('NV131', 'Phan Quynh Tuyet', 'Nam', '1989-10-20', 'Quan 3', '0919650853', '9500000', '2500000', 'Nhan vien', 'QL017', 'PB004');
insert into ADMIN.NHANVIEN values('NV132', 'Ngo Mai Bach', 'Nam', '1987-06-22', 'Quan 6', '0919854774', '13300000', '2700000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV133', 'Huynh Van Tien', 'Nam', '1983-05-06', 'Huyen Cu Chi', '0919676638', '10400000', '1000000', 'Nhan vien', 'QL003', 'PB004');
insert into ADMIN.NHANVIEN values('NV134', 'Do My Chi', 'Nam', '1984-02-17', 'Quan Phu Nhuan', '0919383188', '14400000', '4600000', 'Nhan vien', 'QL012', 'PB004');
insert into ADMIN.NHANVIEN values('NV135', 'Vo Duc Dao', 'Nam', '1987-01-01', 'Huyen Hoc Mon', '0919107016', '11300000', '3100000', 'Nhan vien', 'QL013', 'PB005');
insert into ADMIN.NHANVIEN values('NV136', 'Ly Ngoc Mi', 'Nam', '1986-07-16', 'Quan 5', '0919623202', '12000000', '2700000', 'Nhan vien', 'QL014', 'PB001');
insert into ADMIN.NHANVIEN values('NV137', 'Pham Quoc Han', 'Nam', '1985-11-26', 'Huyen Hoc Mon', '0919011854', '12600000', '3000000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV138', 'Nguyen My Quan', 'Nam', '1981-10-25', 'Quan 3', '0919778563', '13300000', '2600000', 'Nhan vien', 'QL006', 'PB006');
insert into ADMIN.NHANVIEN values('NV139', 'Pham Thu Khoi', 'Nam', '1995-03-09', 'Quan 8', '0919434548', '12700000', '3600000', 'Nhan vien', 'QL002', 'PB001');
insert into ADMIN.NHANVIEN values('NV140', 'Pham Huu Vu', 'Nam', '1980-07-27', 'Huyen Hoc Mon', '0919462310', '8000000', '1200000', 'Nhan vien', 'QL018', 'PB006');
insert into ADMIN.NHANVIEN values('NV141', 'Ho Huu Nhut', 'Nam', '1992-08-18', 'Quan Phu Nhuan', '0919161458', '13400000', '4200000', 'Nhan vien', 'QL012', 'PB006');
insert into ADMIN.NHANVIEN values('NV142', 'Tran Duc Doanh', 'Nam', '1997-10-24', 'Quan Go Vap', '0919571362', '11000000', '4300000', 'Nhan vien', 'QL002', 'PB004');
insert into ADMIN.NHANVIEN values('NV143', 'Huynh Tuyet Son', 'Nam', '1989-06-18', 'Quan Go Vap', '0919635273', '9900000', '1900000', 'Nhan vien', 'QL003', 'PB007');
insert into ADMIN.NHANVIEN values('NV144', 'Duong Thi Duong', 'Nam', '1996-10-15', 'Huyen Hoc Mon', '0919544830', '12000000', '4300000', 'Nhan vien', 'QL001', 'PB005');
insert into ADMIN.NHANVIEN values('NV145', 'Phan Thanh Linh', 'Nam', '1990-09-15', 'Quan 6', '0919837417', '13000000', '3800000', 'Nhan vien', 'QL004', 'PB001');
insert into ADMIN.NHANVIEN values('NV146', 'Vo Quynh Phu', 'Nam', '1998-06-07', 'Huyen Cu Chi', '0919638767', '13900000', '1400000', 'Nhan vien', 'QL008', 'PB004');
insert into ADMIN.NHANVIEN values('NV147', 'Vo Thi Hoang', 'Nam', '1985-08-15', 'Huyen Cu Chi', '0919542674', '10800000', '1600000', 'Nhan vien', 'QL002', 'PB001');
insert into ADMIN.NHANVIEN values('NV148', 'Vo Thanh Trinh', 'Nam', '1997-08-04', 'Quan Phu Nhuan', '0919308673', '12700000', '3000000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV149', 'Tran Tuyet Tien', 'Nam', '1996-05-14', 'Quan 12', '0919854024', '13700000', '3200000', 'Nhan vien', 'QL015', 'PB001');
insert into ADMIN.NHANVIEN values('NV150', 'Tran Duc Viet', 'Nam', '1982-03-22', 'Quan Tan Phu', '0919847545', '9800000', '4300000', 'Nhan vien', 'QL013', 'PB006');
insert into ADMIN.NHANVIEN values('NV151', 'Duong Dang Hai', 'Nam', '1988-06-13', 'Quan 10', '0919660816', '10000000', '2100000', 'Nhan vien', 'QL015', 'PB006');
insert into ADMIN.NHANVIEN values('NV152', 'Phan Huu Khiem', 'Nam', '1988-11-25', 'Huyen Hoc Mon', '0919151082', '8500000', '4300000', 'Nhan vien', 'QL014', 'PB001');
insert into ADMIN.NHANVIEN values('NV153', 'Le Mai Ngan', 'Nam', '1996-08-26', 'Quan 1', '0919100107', '10100000', '2800000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV154', 'Duong Duc Chi', 'Nam', '1993-11-15', 'Quan Phu Nhuan', '0919811434', '13400000', '1300000', 'Nhan vien', 'QL019', 'PB004');
insert into ADMIN.NHANVIEN values('NV155', 'Nguyen Dang Diep', 'Nam', '1998-01-18', 'Quan 6', '0919548401', '12400000', '1400000', 'Nhan vien', 'QL008', 'PB006');
insert into ADMIN.NHANVIEN values('NV156', 'Tran Thanh Thanh', 'Nam', '1992-11-15', 'Quan 8', '0919754520', '12600000', '1800000', 'Nhan vien', 'QL004', 'PB006');
insert into ADMIN.NHANVIEN values('NV157', 'Ngo Tuan Minh', 'Nam', '1986-03-07', 'Quan 1', '0919245718', '14600000', '3400000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV158', 'Pham Quynh An', 'Nam', '1996-02-21', 'Quan Binh Thanh', '0919314388', '11000000', '1300000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV159', 'Ho Ngoc Triet', 'Nam', '1986-02-11', 'Quan 12', '0919052260', '11600000', '2900000', 'Nhan vien', 'QL007', 'PB005');
insert into ADMIN.NHANVIEN values('NV160', 'Ho Duy Chi', 'Nam', '1991-07-14', 'Huyen Cu Chi', '0919450535', '11400000', '1900000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV161', 'Ho Quoc Nhat', 'Nam', '1985-07-18', 'Quan Tan Phu', '0919100838', '8700000', '3900000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV162', 'Duong Tan Dung', 'Nam', '1980-02-06', 'Quan Phu Nhuan', '0919675411', '9000000', '1100000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV163', 'Bui My Khanh', 'Nam', '1996-04-27', 'Quan Phu Nhuan', '0919305445', '9600000', '4000000', 'Nhan vien', 'QL013', 'PB001');
insert into ADMIN.NHANVIEN values('NV164', 'Ngo My Tu', 'Nam', '1998-04-20', 'Quan 7', '0919286865', '12400000', '1400000', 'Nhan vien', 'QL011', 'PB001');
insert into ADMIN.NHANVIEN values('NV165', 'Do Thanh Duong', 'Nam', '1996-06-03', 'Quan 1', '0919731206', '14800000', '2100000', 'Nhan vien', 'QL018', 'PB004');
insert into ADMIN.NHANVIEN values('NV166', 'Le Ngoc Vinh', 'Nam', '1996-09-11', 'Quan Go Vap', '0919440485', '8800000', '1700000', 'Nhan vien', 'QL018', 'PB004');
insert into ADMIN.NHANVIEN values('NV167', 'Bui Quang Quan', 'Nam', '1991-09-13', 'Quan 7', '0919440681', '9300000', '3000000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV168', 'Ho Mai Trong', 'Nam', '1998-06-10', 'Quan Phu Nhuan', '0919603104', '8600000', '3600000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV169', 'Le Hong Thien', 'Nam', '1996-05-21', 'Quan Go Vap', '0919376530', '14400000', '2500000', 'Nhan vien', 'QL014', 'PB006');
insert into ADMIN.NHANVIEN values('NV170', 'Dang Thanh Thang', 'Nam', '1983-02-21', 'Quan 7', '0919204200', '10100000', '1400000', 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV171', 'Do Thuy Tran', 'Nam', '1999-10-27', 'Quan 4', '0919453675', '10500000', '3000000', 'Nhan vien', 'QL017', 'PB006');
insert into ADMIN.NHANVIEN values('NV172', 'Dang Dang Dan', 'Nam', '1992-11-24', 'Quan 10', '0919671456', '11700000', '4600000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV173', 'Pham Tan Hai', 'Nam', '1982-01-16', 'Huyen Hoc Mon', '0919204603', '11000000', '2100000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV174', 'Ho Trung Ly', 'Nam', '1992-03-14', 'Quan Go Vap', '0919620858', '11100000', '4600000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV175', 'Pham Thanh Kha', 'Nam', '1983-04-02', 'Quan Go Vap', '0919625453', '14100000', '2700000', 'Nhan vien', 'QL003', 'PB004');
insert into ADMIN.NHANVIEN values('NV176', 'Bui Duy Van', 'Nam', '1998-02-05', 'Quan 12', '0919416588', '13800000', '2900000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV177', 'Ly Huu Nghi', 'Nam', '1992-03-12', 'Quan 3', '0919030844', '8600000', '4400000', 'Nhan vien', 'QL006', 'PB007');
insert into ADMIN.NHANVIEN values('NV178', 'Bui Mai Tuan', 'Nam', '1998-05-22', 'Quan 8', '0919635844', '8800000', '3100000', 'Nhan vien', 'QL004', 'PB004');
insert into ADMIN.NHANVIEN values('NV179', 'Ly Thuy Linh', 'Nam', '1998-01-01', 'Quan Phu Nhuan', '0919431534', '10600000', '3100000', 'Nhan vien', 'QL011', 'PB004');
insert into ADMIN.NHANVIEN values('NV180', 'Phan Thao Phi', 'Nam', '1982-04-03', 'Quan Tan Binh', '0919555845', '13100000', '1900000', 'Nhan vien', 'QL018', 'PB005');
insert into ADMIN.NHANVIEN values('NV181', 'Bui Hong Tu', 'Nam', '1990-05-10', 'Huyen Cu Chi', '0919727880', '11000000', '1800000', 'Nhan vien', 'QL009', 'PB006');
insert into ADMIN.NHANVIEN values('NV182', 'Pham Mai Nga', 'Nam', '1994-04-12', 'Quan 5', '0919411130', '8000000', '4700000', 'Nhan vien', 'QL006', 'PB001');
insert into ADMIN.NHANVIEN values('NV183', 'Ho Quynh Khue', 'Nam', '1994-09-04', 'Quan 12', '0919532158', '8700000', '4100000', 'Nhan vien', 'QL002', 'PB006');
insert into ADMIN.NHANVIEN values('NV184', 'Ly Huu Hoa', 'Nam', '1997-10-05', 'Quan 3', '0919166607', '10100000', '1500000', 'Nhan vien', 'QL005', 'PB001');
insert into ADMIN.NHANVIEN values('NV185', 'Tran Hong Phuong', 'Nam', '1996-02-04', 'Quan 11', '0919640561', '8600000', '1300000', 'Nhan vien', 'QL018', 'PB004');
insert into ADMIN.NHANVIEN values('NV186', 'Phan Van Trinh', 'Nam', '1984-01-26', 'Quan 8', '0919161226', '12300000', '4600000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV187', 'Le Thuy Tien', 'Nam', '1993-10-19', 'Huyen Hoc Mon', '0919132143', '8300000', '1400000', 'Nhan vien', 'QL016', 'PB001');
insert into ADMIN.NHANVIEN values('NV188', 'Ngo Dang Nga', 'Nam', '1997-11-07', 'Quan 12', '0919820225', '8000000', '4500000', 'Nhan vien', 'QL006', 'PB005');
insert into ADMIN.NHANVIEN values('NV189', 'Bui Thuy Linh', 'Nam', '1998-04-16', 'Quan 5', '0919120884', '11000000', '4000000', 'Nhan vien', 'QL007', 'PB005');
insert into ADMIN.NHANVIEN values('NV190', 'Ho Quang Quoc', 'Nam', '1984-08-03', 'Quan Tan Binh', '0919181723', '14000000', '2300000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV191', 'Bui Trung Minh', 'Nam', '1982-01-13', 'Quan Phu Nhuan', '0919840278', '8000000', '1700000', 'Nhan vien', 'QL014', 'PB004');
insert into ADMIN.NHANVIEN values('NV192', 'Huynh Huu Tam', 'Nam', '1993-10-03', 'Quan 6', '0919712781', '8000000', '4000000', 'Nhan vien', 'QL013', 'PB005');
insert into ADMIN.NHANVIEN values('NV193', 'Phan Quynh Hung', 'Nam', '1989-08-22', 'Quan Binh Thanh', '0919063452', '8200000', '3500000', 'Nhan vien', 'QL007', 'PB001');
insert into ADMIN.NHANVIEN values('NV194', 'Dang Quynh Van', 'Nam', '1985-06-26', 'Quan 5', '0919244322', '9700000', '2500000', 'Nhan vien', 'QL009', 'PB004');
insert into ADMIN.NHANVIEN values('NV195', 'Vo Quynh Lam', 'Nam', '1980-10-23', 'Quan 10', '0919061876', '13500000', '3700000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV196', 'Le Trung Phat', 'Nam', '1996-06-15', 'Quan Binh Thanh', '0919325861', '9700000', '3600000', 'Nhan vien', 'QL018', 'PB006');
insert into ADMIN.NHANVIEN values('NV197', 'Dang My Thien', 'Nam', '1982-01-22', 'Quan Tan Phu', '0919313708', '10200000', '1000000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV198', 'Dang Yen Kiet', 'Nam', '1980-11-17', 'Quan Tan Binh', '0919315136', '8300000', '3500000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV199', 'Tran Thi Van', 'Nam', '1999-07-25', 'Quan 3', '0919567676', '9500000', '1400000', 'Nhan vien', 'QL008', 'PB001');
insert into ADMIN.NHANVIEN values('NV200', 'Do Van Dat', 'Nam', '1982-03-09', 'Quan 7', '0919203263', '9700000', '4300000', 'Nhan vien', 'QL016', 'PB006');
insert into ADMIN.NHANVIEN values('NV201', 'Vo Yen Quan', 'Nam', '1981-06-14', 'Quan Tan Binh', '0919284343', '9400000', '3700000', 'Nhan vien', 'QL001', 'PB007');
insert into ADMIN.NHANVIEN values('NV202', 'Dang Tan Anh', 'Nam', '1980-10-03', 'Quan Go Vap', '0919121250', '10000000', '1200000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV203', 'Ly Thao Anh', 'Nam', '1995-08-27', 'Quan Go Vap', '0919483812', '10300000', '2800000', 'Nhan vien', 'QL016', 'PB006');
insert into ADMIN.NHANVIEN values('NV204', 'Dang Thu Tan', 'Nam', '1986-08-03', 'Quan 1', '0919378053', '13300000', '4600000', 'Nhan vien', 'QL017', 'PB007');
insert into ADMIN.NHANVIEN values('NV205', 'Vo Huu Chau', 'Nam', '1982-09-11', 'Quan Phu Nhuan', '0919185808', '9500000', '3600000', 'Nhan vien', 'QL015', 'PB007');
insert into ADMIN.NHANVIEN values('NV206', 'Do Thao Vu', 'Nam', '1990-04-26', 'Quan Go Vap', '0919435424', '12500000', '3400000', 'Nhan vien', 'QL018', 'PB001');
insert into ADMIN.NHANVIEN values('NV207', 'Ngo Thuy Khanh', 'Nam', '1986-01-07', 'Quan 3', '0919270147', '12400000', '4600000', 'Nhan vien', 'QL017', 'PB006');
insert into ADMIN.NHANVIEN values('NV208', 'Huynh Duy Thanh', 'Nam', '1980-02-21', 'Quan Tan Binh', '0919055233', '14700000', '3100000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV209', 'Ly Thu Anh', 'Nam', '1983-07-17', 'Quan 3', '0919677214', '10200000', '2900000', 'Nhan vien', 'QL016', 'PB007');
insert into ADMIN.NHANVIEN values('NV210', 'Bui Duc Hien', 'Nam', '1994-07-27', 'Huyen Cu Chi', '0919172724', '13600000', '4300000', 'Nhan vien', 'QL015', 'PB001');
insert into ADMIN.NHANVIEN values('NV211', 'Ly Thu Luan', 'Nam', '1992-06-03', 'Quan Phu Nhuan', '0919800418', '14200000', '3200000', 'Nhan vien', 'QL002', 'PB007');
insert into ADMIN.NHANVIEN values('NV212', 'Ho Duc Nghia', 'Nam', '1980-11-09', 'Huyen Cu Chi', '0919772250', '14700000', '3600000', 'Nhan vien', 'QL003', 'PB006');
insert into ADMIN.NHANVIEN values('NV213', 'Ngo Thi Thuy', 'Nam', '1989-01-26', 'Quan Go Vap', '0919188441', '13400000', '2900000', 'Nhan vien', 'QL004', 'PB005');
insert into ADMIN.NHANVIEN values('NV214', 'Tran Dang Vu', 'Nam', '1991-01-11', 'Huyen Hoc Mon', '0919644815', '11100000', '3200000', 'Nhan vien', 'QL011', 'PB001');
insert into ADMIN.NHANVIEN values('NV215', 'Ho Ngoc Thai', 'Nam', '1998-10-20', 'Quan 12', '0919746818', '13500000', '2800000', 'Nhan vien', 'QL018', 'PB005');
insert into ADMIN.NHANVIEN values('NV216', 'Le Quang Han', 'Nam', '1988-05-22', 'Quan 8', '0919704248', '14500000', '2500000', 'Nhan vien', 'QL017', 'PB006');
insert into ADMIN.NHANVIEN values('NV217', 'Duong Trung Loi', 'Nam', '1980-04-10', 'Huyen Can Gio', '0919630672', '13300000', '2000000', 'Nhan vien', 'QL012', 'PB007');
insert into ADMIN.NHANVIEN values('NV218', 'Vo Hong Phuc', 'Nam', '1992-11-26', 'Quan 7', '0919447388', '14100000', '1800000', 'Nhan vien', 'QL001', 'PB004');
insert into ADMIN.NHANVIEN values('NV219', 'Pham Thu Van', 'Nam', '1983-03-11', 'Huyen Cu Chi', '0919622384', '8900000', '2100000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV220', 'Duong Yen Dan', 'Nam', '1984-11-05', 'Quan 12', '0919385620', '11300000', '2500000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV221', 'Dang My Tham', 'Nam', '1990-09-03', 'Quan 11', '0919132578', '8800000', '1000000', 'Nhan vien', 'QL016', 'PB004');
insert into ADMIN.NHANVIEN values('NV222', 'Vo Quoc Khanh', 'Nam', '1985-08-05', 'Quan 12', '0919313248', '8500000', '2800000', 'Nhan vien', 'QL012', 'PB006');
insert into ADMIN.NHANVIEN values('NV223', 'Bui My Hung', 'Nam', '1996-07-17', 'Quan Tan Phu', '0919341368', '13400000', '1200000', 'Nhan vien', 'QL013', 'PB004');
insert into ADMIN.NHANVIEN values('NV224', 'Ly Tuyet Tien', 'Nam', '1996-08-18', 'Quan 7', '0919346223', '10600000', '4300000', 'Nhan vien', 'QL003', 'PB005');
insert into ADMIN.NHANVIEN values('NV225', 'Bui Thi Chau', 'Nam', '1989-02-23', 'Quan 12', '0919503716', '12000000', '3700000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV226', 'Huynh Dang Kien', 'Nam', '1989-04-27', 'Quan 4', '0919325212', '14000000', '1300000', 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV227', 'Phan Ngoc Dan', 'Nam', '1980-11-27', 'Huyen Cu Chi', '0919360418', '14900000', '3200000', 'Nhan vien', 'QL010', 'PB006');
insert into ADMIN.NHANVIEN values('NV228', 'Nguyen Duc Kiet', 'Nam', '1996-01-08', 'Quan 4', '0919670382', '14300000', '3300000', 'Nhan vien', 'QL013', 'PB005');
insert into ADMIN.NHANVIEN values('NV229', 'Dang Thao Bach', 'Nam', '1992-10-10', 'Quan 5', '0919425382', '14600000', '1100000', 'Nhan vien', 'QL013', 'PB005');
insert into ADMIN.NHANVIEN values('NV230', 'Phan Trung Dang', 'Nam', '1987-09-03', 'Quan 4', '0919622421', '14700000', '2400000', 'Nhan vien', 'QL002', 'PB004');
insert into ADMIN.NHANVIEN values('NV231', 'Dang Yen Khanh', 'Nam', '1980-10-09', 'Quan 6', '0919438273', '14800000', '2200000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV232', 'Le Duc An', 'Nam', '1981-07-18', 'Huyen Binh Chanh', '0919827086', '13800000', '3200000', 'Nhan vien', 'QL009', 'PB007');
insert into ADMIN.NHANVIEN values('NV233', 'Ly Dang Minh', 'Nam', '1995-02-24', 'Huyen Nha Be', '0919267330', '10000000', '2800000', 'Nhan vien', 'QL014', 'PB005');
insert into ADMIN.NHANVIEN values('NV234', 'Vo Ngoc Cong', 'Nam', '1995-11-24', 'Quan Go Vap', '0919620185', '13500000', '2600000', 'Nhan vien', 'QL019', 'PB004');
insert into ADMIN.NHANVIEN values('NV235', 'Pham Trung Trinh', 'Nam', '1988-07-10', 'Huyen Hoc Mon', '0919241557', '12400000', '4600000', 'Nhan vien', 'QL019', 'PB005');
insert into ADMIN.NHANVIEN values('NV236', 'Bui Hong Thao', 'Nam', '1994-07-02', 'Quan 11', '0919208637', '10100000', '2100000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV237', 'Ngo Yen Quang', 'Nam', '1995-07-18', 'Quan Tan Phu', '0919762652', '12700000', '1700000', 'Nhan vien', 'QL007', 'PB007');
insert into ADMIN.NHANVIEN values('NV238', 'Ngo Tan Dang', 'Nam', '1997-10-06', 'Quan 5', '0919270275', '12500000', '3900000', 'Nhan vien', 'QL016', 'PB001');
insert into ADMIN.NHANVIEN values('NV239', 'Ly Mai Quoc', 'Nam', '1983-07-05', 'Quan 5', '0919866406', '14600000', '4400000', 'Nhan vien', 'QL014', 'PB004');
insert into ADMIN.NHANVIEN values('NV240', 'Nguyen Van Kha', 'Nam', '1989-10-20', 'Quan Tan Binh', '0919402782', '14400000', '2600000', 'Nhan vien', 'QL009', 'PB006');
insert into ADMIN.NHANVIEN values('NV241', 'Phan Van Lam', 'Nam', '1988-09-20', 'Huyen Cu Chi', '0919363535', '14400000', '1800000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV242', 'Huynh Tan Khang', 'Nam', '1999-03-06', 'Huyen Binh Chanh', '0919116766', '11900000', '4400000', 'Nhan vien', 'QL006', 'PB006');
insert into ADMIN.NHANVIEN values('NV243', 'Le My Nguyen', 'Nam', '1999-04-19', 'Quan 11', '0919041350', '12400000', '4300000', 'Nhan vien', 'QL017', 'PB007');
insert into ADMIN.NHANVIEN values('NV244', 'Bui Thi Phu', 'Nam', '1998-10-27', 'Huyen Binh Chanh', '0919285757', '10600000', '1000000', 'Nhan vien', 'QL002', 'PB005');
insert into ADMIN.NHANVIEN values('NV245', 'Ly Duc Hanh', 'Nam', '1983-11-19', 'Huyen Binh Chanh', '0919700368', '12300000', '3100000', 'Nhan vien', 'QL014', 'PB004');
insert into ADMIN.NHANVIEN values('NV246', 'Ngo Quynh Tho', 'Nam', '1982-02-25', 'Quan Go Vap', '0919880043', '12500000', '2900000', 'Nhan vien', 'QL012', 'PB005');
insert into ADMIN.NHANVIEN values('NV247', 'Nguyen Quoc Hao', 'Nam', '1986-10-04', 'Quan 6', '0919108215', '10900000', '3400000', 'Nhan vien', 'QL010', 'PB005');
insert into ADMIN.NHANVIEN values('NV248', 'Vo Tan Man', 'Nam', '1985-10-26', 'Huyen Hoc Mon', '0919807585', '12500000', '2600000', 'Nhan vien', 'QL006', 'PB007');
insert into ADMIN.NHANVIEN values('NV249', 'Do Dang Quynh', 'Nam', '1993-03-22', 'Quan 1', '0919243784', '10100000', '2200000', 'Nhan vien', 'QL008', 'PB004');
insert into ADMIN.NHANVIEN values('NV250', 'Le Thu Thu', 'Nam', '1997-11-18', 'Huyen Binh Chanh', '0919025510', '9000000', '2300000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV251', 'Ly Thi Hien', 'Nam', '1991-11-25', 'Huyen Can Gio', '0919248780', '8700000', '1000000', 'Nhan vien', 'QL007', 'PB006');
insert into ADMIN.NHANVIEN values('NV252', 'Vo Trung Thanh', 'Nam', '1990-10-04', 'Quan 11', '0919337220', '13600000', '4100000', 'Nhan vien', 'QL013', 'PB001');
insert into ADMIN.NHANVIEN values('NV253', 'Phan Van Diem', 'Nam', '1999-06-03', 'Quan 5', '0919542734', '14700000', '2400000', 'Nhan vien', 'QL015', 'PB005');
insert into ADMIN.NHANVIEN values('NV254', 'Vo My Nhut', 'Nam', '1993-06-19', 'Huyen Nha Be', '0919760132', '14800000', '1500000', 'Nhan vien', 'QL011', 'PB006');
insert into ADMIN.NHANVIEN values('NV255', 'Bui Hong Tuyen', 'Nam', '1983-07-09', 'Huyen Hoc Mon', '0919220013', '12900000', '4500000', 'Nhan vien', 'QL001', 'PB007');
insert into ADMIN.NHANVIEN values('NV256', 'Dang Hong Linh', 'Nam', '1982-10-01', 'Quan Binh Thanh', '0919605202', '11900000', '4100000', 'Nhan vien', 'QL009', 'PB004');
insert into ADMIN.NHANVIEN values('NV257', 'Huynh Dang Bang', 'Nam', '1993-03-10', 'Quan Go Vap', '0919002220', '11400000', '4900000', 'Nhan vien', 'QL013', 'PB007');
insert into ADMIN.NHANVIEN values('NV258', 'Dang Hong Thanh', 'Nam', '1985-11-18', 'Quan 10', '0919243676', '9300000', '3700000', 'Nhan vien', 'QL004', 'PB006');
insert into ADMIN.NHANVIEN values('NV259', 'Phan Tuyet Triet', 'Nam', '1983-10-16', 'Quan 11', '0919718752', '9200000', '4700000', 'Nhan vien', 'QL014', 'PB006');
insert into ADMIN.NHANVIEN values('NV260', 'Pham Yen Tan', 'Nam', '1984-07-02', 'Quan Binh Thanh', '0919758778', '13000000', '2500000', 'Nhan vien', 'QL019', 'PB005');
insert into ADMIN.NHANVIEN values('NV261', 'Ho My Dung', 'Nam', '1992-09-22', 'Quan 3', '0919721528', '14800000', '4400000', 'Nhan vien', 'QL001', 'PB007');
insert into ADMIN.NHANVIEN values('NV262', 'Do Ngoc Tram', 'Nam', '1995-03-05', 'Huyen Cu Chi', '0919835315', '10900000', '2300000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV263', 'Ho Mai Phung', 'Nam', '1984-10-08', 'Huyen Binh Chanh', '0919885518', '14200000', '2000000', 'Nhan vien', 'QL012', 'PB006');
insert into ADMIN.NHANVIEN values('NV264', 'Huynh Huu Nhi', 'Nam', '1986-11-06', 'Quan Tan Binh', '0919432277', '12100000', '1800000', 'Nhan vien', 'QL011', 'PB007');
insert into ADMIN.NHANVIEN values('NV265', 'Bui Trung Ngan', 'Nam', '1982-04-07', 'Huyen Hoc Mon', '0919353664', '10600000', '4700000', 'Nhan vien', 'QL008', 'PB006');
insert into ADMIN.NHANVIEN values('NV266', 'Nguyen Trung Dat', 'Nam', '1989-01-15', 'Huyen Nha Be', '0919573005', '14900000', '2000000', 'Nhan vien', 'QL018', 'PB001');
insert into ADMIN.NHANVIEN values('NV267', 'Do Huu Hoa', 'Nam', '1989-01-18', 'Quan Phu Nhuan', '0919531871', '12100000', '3400000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV268', 'Ngo Duc Danh', 'Nam', '1995-10-20', 'Quan 11', '0919834286', '13600000', '1400000', 'Nhan vien', 'QL008', 'PB005');
insert into ADMIN.NHANVIEN values('NV269', 'Pham Tan Tho', 'Nam', '1990-05-23', 'Huyen Can Gio', '0919676865', '8000000', '3200000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV270', 'Do Trung Quynh', 'Nam', '1982-05-15', 'Quan 6', '0919726657', '12900000', '1300000', 'Nhan vien', 'QL009', 'PB001');
insert into ADMIN.NHANVIEN values('NV271', 'Do Yen Son', 'Nam', '1998-07-04', 'Huyen Hoc Mon', '0919257848', '12400000', '1500000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV272', 'Pham Dang Tin', 'Nam', '1986-02-26', 'Huyen Hoc Mon', '0919436651', '12200000', '3400000', 'Nhan vien', 'QL015', 'PB004');
insert into ADMIN.NHANVIEN values('NV273', 'Tran Thi Truc', 'Nam', '1997-06-09', 'Huyen Can Gio', '0919778605', '8100000', '4600000', 'Nhan vien', 'QL011', 'PB006');
insert into ADMIN.NHANVIEN values('NV274', 'Vo Tuan Kiet', 'Nam', '1982-03-08', 'Quan 4', '0919015773', '8100000', '2000000', 'Nhan vien', 'QL019', 'PB006');
insert into ADMIN.NHANVIEN values('NV275', 'Do Tuan Duyen', 'Nam', '1985-08-21', 'Quan 7', '0919654827', '11000000', '3700000', 'Nhan vien', 'QL018', 'PB007');
insert into ADMIN.NHANVIEN values('NV276', 'Tran Truc Tin', 'Nam', '1989-10-15', 'Quan 6', '0919684703', '9900000', '1100000', 'Nhan vien', 'QL002', 'PB006');
insert into ADMIN.NHANVIEN values('NV277', 'Vo Hong Dan', 'Nam', '1986-03-13', 'Quan 12', '0919368444', '11200000', '1400000', 'Nhan vien', 'QL017', 'PB006');
insert into ADMIN.NHANVIEN values('NV278', 'Le Mai Hang', 'Nam', '1984-11-26', 'Quan 3', '0919748018', '14500000', '1000000', 'Nhan vien', 'QL001', 'PB007');
insert into ADMIN.NHANVIEN values('NV279', 'Le My Yen', 'Nam', '1988-03-04', 'Quan 10', '0919620378', '13000000', '3200000', 'Nhan vien', 'QL017', 'PB005');
insert into ADMIN.NHANVIEN values('NV280', 'Tran Tan Toan', 'Nam', '1993-01-23', 'Huyen Nha Be', '0919007548', '14700000', '2500000', 'Nhan vien', 'QL014', 'PB006');
insert into ADMIN.NHANVIEN values('NV281', 'Do Ngoc Lan', 'Nam', '1990-03-11', 'Quan Tan Phu', '0919551215', '11600000', '4700000', 'Nhan vien', 'QL007', 'PB004');
insert into ADMIN.NHANVIEN values('NV282', 'Duong Thao Trung', 'Nam', '1982-05-06', 'Quan Go Vap', '0919221043', '12200000', '1900000', 'Nhan vien', 'QL012', 'PB001');
insert into ADMIN.NHANVIEN values('NV283', 'Ho Mai Diep', 'Nam', '1985-08-23', 'Quan 7', '0919654521', '11300000', '4600000', 'Nhan vien', 'QL005', 'PB006');
insert into ADMIN.NHANVIEN values('NV284', 'Tran Huu Phung', 'Nam', '1987-07-18', 'Huyen Binh Chanh', '0919225624', '11700000', '3700000', 'Nhan vien', 'QL018', 'PB001');
insert into ADMIN.NHANVIEN values('NV285', 'Pham Thuy Thien', 'Nam', '1984-01-27', 'Huyen Cu Chi', '0919571023', '14700000', '3400000', 'Nhan vien', 'QL009', 'PB007');
insert into ADMIN.NHANVIEN values('NV286', 'Bui Yen Tram', 'Nam', '1987-01-10', 'Huyen Nha Be', '0919403642', '10900000', '4200000', 'Nhan vien', 'QL008', 'PB005');
insert into ADMIN.NHANVIEN values('NV287', 'Ngo Trung Dat', 'Nam', '1984-06-17', 'Huyen Binh Chanh', '0919160480', '11000000', '1800000', 'Nhan vien', 'QL018', 'PB004');
insert into ADMIN.NHANVIEN values('NV288', 'Tran Ngoc Tung', 'Nam', '1992-07-22', 'Quan 11', '0919508070', '13200000', '4500000', 'Nhan vien', 'QL005', 'PB007');
insert into ADMIN.NHANVIEN values('NV289', 'Ho Yen Hao', 'Nam', '1989-07-05', 'Quan 1', '0919708168', '11300000', '2800000', 'Nhan vien', 'QL003', 'PB007');
insert into ADMIN.NHANVIEN values('NV290', 'Le Quang Thu', 'Nam', '1983-09-11', 'Quan Phu Nhuan', '0919840554', '10800000', '2000000', 'Nhan vien', 'QL006', 'PB001');
insert into ADMIN.NHANVIEN values('NV291', 'Dang Tuan Chau', 'Nam', '1988-06-17', 'Quan Binh Thanh', '0919260135', '11100000', '3100000', 'Nhan vien', 'QL001', 'PB004');
insert into ADMIN.NHANVIEN values('NV292', 'Ho Yen Van', 'Nam', '1993-10-24', 'Quan 4', '0919332328', '10700000', '1200000', 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV293', 'Tran Van Chi', 'Nam', '1989-01-12', 'Quan 7', '0919052816', '13800000', '3100000', 'Nhan vien', 'QL001', 'PB001');
insert into ADMIN.NHANVIEN values('NV294', 'Le My Phuong', 'Nam', '1997-01-02', 'Huyen Nha Be', '0919012715', '12200000', '1100000', 'Nhan vien', 'QL017', 'PB007');
insert into ADMIN.NHANVIEN values('NV295', 'Nguyen Thao Anh', 'Nam', '1997-06-24', 'Quan 10', '0919477184', '8100000', '1200000', 'Nhan vien', 'QL010', 'PB006');
insert into ADMIN.NHANVIEN values('NV296', 'Ly Trung Di', 'Nam', '1986-09-03', 'Quan 5', '0919240785', '10800000', '3400000', 'Nhan vien', 'QL019', 'PB001');
insert into ADMIN.NHANVIEN values('NV297', 'Vo Hong Khanh', 'Nam', '1993-06-12', 'Quan 12', '0919183558', '10700000', '4600000', 'Nhan vien', 'QL012', 'PB004');
insert into ADMIN.NHANVIEN values('NV298', 'Huynh Tuan Vy', 'Nam', '1993-07-27', 'Huyen Binh Chanh', '0919740186', '8700000', '2800000', 'Nhan vien', 'QL006', 'PB001');
insert into ADMIN.NHANVIEN values('NV299', 'Do Tan Dung', 'Nam', '1985-06-24', 'Quan 12', '0919016186', '13100000', '4400000', 'Nhan vien', 'QL004', 'PB007');
insert into ADMIN.NHANVIEN values('NV300', 'Tran Thao Cong', 'Nam', '1990-11-10', 'Quan Tan Phu', '0919583787', '8100000', '1700000', 'Nhan vien', 'QL019', 'PB007');