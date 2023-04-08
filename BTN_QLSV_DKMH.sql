create database QLSV_DKMH;
use QLSV_DKMH;
go

CREATE TABLE KHOA (
    MSKHOA VARCHAR(10) PRIMARY KEY,
    TENKHOA NVARCHAR(100) NOT NULL
);

CREATE TABLE GIANGVIEN(
    MSGV VARCHAR(10) PRIMARY KEY,
    HOTENGV NVARCHAR(200) NOT NULL,
	PHAI BIT NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    PHONE VARCHAR(20) NOT NULL,
    DIACHI NVARCHAR(900) NOT NULL,
	MSKHOA VARCHAR(10) NOT NULL
	FOREIGN KEY (MSKHOA) REFERENCES KHOA(MSKHOA),
);
CREATE TABLE SINHVIEN (
    MSSV VARCHAR(10) PRIMARY KEY,
    HOTENSV NVARCHAR(100) NOT NULL,
	LOP VARCHAR(10) NOT NULL,
    NGAYSINH DATE NOT NULL,
    PHAI BIT NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	PHONE VARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
);
CREATE TABLE HOCPHAN(
	MAHP VARCHAR(10) PRIMARY KEY,
    TENHP NVARCHAR(100) NOT NULL,
    SOTC SMALLINT NOT NULL,
);

create table GIANGDAY(
	MSGV VARCHAR(10) foreign key references GIANGVIEN(MSGV),
	MAHP VARCHAR(10) foreign key references HOCPHAN(MAHP),
	HOCKY SMALLINT NOT NULL,
	NAMHOC VARCHAR(10) NOT NULL,
);

CREATE TABLE KETQUA(
	MSSV VARCHAR(10) NOT NULL,
    MAHP VARCHAR(10) NOT NULL,
    HOCKY SMALLINT NOT NULL,
	NAMHOC VARCHAR(10) NOT NULL,
	DIEMBP DECIMAL(2,1) NOT NULL,
	DIEMGK DECIMAL(2,1) NOT NULL,
	DIEMKT DECIMAL(2,1) NOT NULL,
    FOREIGN KEY (MAHP) REFERENCES HOCPHAN(MAHP),
	FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV)
);

CREATE TABLE KHHT(
	MSKHOA VARCHAR(10) NOT NULL,
    MAHP VARCHAR(10) NOT NULL,
    TENHP NVARCHAR(100) NOT NULL,
	SOTC SMALLINT NOT NULL,
	HOCKY SMALLINT NOT NULL,
	NAMHOC VARCHAR(10) NOT NULL,
    FOREIGN KEY (MAHP) REFERENCES HOCPHAN(MAHP),
	FOREIGN KEY (MSKHOA) REFERENCES KHOA(MSKHOA)
);

CREATE TABLE LICHHOC(
    MALH VARCHAR(20) PRIMARY KEY,
    MAHP VARCHAR(10) NOT NULL,
	TUANBATDAU VARCHAR(50) NOT NULL,
	HOCKY SMALLINT NOT NULL,
	NAMHOC VARCHAR(10) NOT NULL,
	HOTENGV NVARCHAR(100) NOT NULL,
	THU VARCHAR(10) NOT NULL,
	TIETHOC VARCHAR(1000) NOT NULL,
	DIADIEM NVARCHAR(100) NOT NULL,	
	FOREIGN KEY (MAHP) REFERENCES HOCPHAN(MAHP)
);
CREATE TABLE DANGKY(
	MAHP VARCHAR(10) NOT NULL,
	MALH VARCHAR(20) NOT NULL,
	MSSV VARCHAR(10)NOT NULL,
	LOP VARCHAR(10) NOT NULL,
	TRANGTHAIDK NVARCHAR(20) NOT NULL,
	SLSV_DADK INT NOT NULL,
	SLSV_DK_TOIDA INT NOT NULL,
	FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MALH) REFERENCES LICHHOC(MALH),
	FOREIGN KEY (MAHP) REFERENCES HOCPHAN(MAHP)
);

drop table DANGKY;
drop table LICHHOC;
drop table KHHT;
drop table KETQUA;
drop table GIANGDAY;
drop table HOCPHAN;
drop table SINHVIEN;
drop table GIANGVIEN;
drop table KHOA;


insert into KHOA values
('CNTT',N'Công nghệ thông tin'),
('QTKD',N'Quản trị kinh doanh'),
('QTDL',N'Quản trị du lịch'),
('CNXD',N'Công nghệ xây dựng'),
('CNTP',N'Công nghệ thực phẩm')

insert into GIANGVIEN values
('3145',N'Nguyễn Thị Kim Hoa',1,'hoa.ntk@ntu.edu.vn','0913456689',N'Tôn Thất Tùng - Vĩnh Thọ - Nha Trang','CNTT'),
('3146',N'Nguyễn Văn Hùng',1,'hung.nv@ntu.edu.vn','0912472856',N'Nguyễn Đình Chiểu - Vĩnh Phước - Nha Trang','QTKD'),
('3147',N'Trần Văn Trung',1,'trung.tvk@ntu.edu.vn','0345756689',N'Lộc Thọ - Nha Trang','QTDL'),
('3148',N'Nguyễn Hoàng Huy ',1,'huy.nhk@ntu.edu.vn','0945621349',N'Vĩnh Thọ - Nha Trang','CNXD'),
('3149',N'Nguyễn Thị Thủy',0,'hoa.ntk@ntu.edu.vn','0977654629',N'Vĩnh Lương - Nha Trang','CNTP')

INSERT INTO SINHVIEN VALUES
('63134535', N'Huỳnh Thanh Luân','63.CNTT', '2003-06-30', 1,'luan.ht.63cntt@ntu.edu.vn','0937724198',N'Vạn Ninh - Khánh Hòa' ),
('63136237', N'Nguyễn Văn An', '63.CNTT', '2003-04-30', 1,'an.nv.63cntt@ntu.edu.vn','0931456898',N'Tuy Hòa - Phú Yên' ),
('63134671', N'Trần Thị Mai Thơ', '63.CNTT','2003-11-01', 0,'tho.ttm.63cntt@ntu.edu.vn','0934124148',N'Ninh Hòa - Khánh Hòa' ),
('63134928', N'Lê Duy Quốc', '63.CNXD', '2003-01-09', 1,'quoc.ld.63cnxd@ntu.edu.vn','0324141415',N'Vạn Ninh - Khánh Hòa' ),
('63145672', N'Nguyễn Thị Thu Thảo', '63.CNXD', '2003-03-19', 0,'thao.ntt.63cnxd@ntu.edu.vn','0341414558',N'Vạn Ninh - Khánh Hòa' ),
('63147875', N'Trần Thị Thu Hà', '63.CNTP', '2003-05-13', 0,'ha.ttt.63cntp@ntu.edu.vn','0931245198',N'Hoàn Kiếm - Hà Nội' ),
('63134657', N'Trần Quốc Bảo', '63.CNTP', '2003-03-03', 1,'bao.tq.63cntp@ntu.edu.vn','0952414515',N'Vạn Ninh - Khánh Hòa' ),
('63134913', N'Nguyễn Văn Hậu', '63.CNTP', '2003-02-03', 1,'hau.nv.63cntp@ntu.edu.vn','0351145138',N'Hải Anh - Hải Phòng' ),
('63130285', N'Phạm Thị Quỳnh Như', '63.QTKD', '2003-10-20', 0,'nhu.ptq.63qtkd@ntu.edu.vn','0563141551',N'TP.Vinh - Khánh Hòa' ),
('63131989', N'Phạm Văn Đồng', '63.QTKD', '2003-07-11', 1,'dong.pv.63qtkd@ntu.edu.vn','0941342198',N'Vạn Ninh - Khánh Hòa' ),
('63134580', N'Nguyễn Thị Kim Hương', '63.QTDL', '2003-12-21', 0,'huong.ntk.63qtdl@ntu.edu.vn','0941525498',N'Quỳnh Lưu - Nghệ An' ),
('63133145', N'Phạm Tú Như', '63.QTDL', '2003-06-25', 0,'nhu.pt.63qtdl@ntu.edu.vn','09151414198',N'Hòa Xuân - Khánh Hòa' ),
('63131276', N'Lê Trọng Hậu', '63.QTDL', '2003-01-21', 0,'hau.lt.63qtdl@ntu.edu.vn','0514141558',N'An Xuyên - Cà Mau' ),
('63134217', N'Lê Văn Luyện', '63.CNTT', '2003-01-21', 0,'luyen.lv.63cntt@ntu.edu.vn','0512414558',N'Vạn Ninh - Khánh Hòa' )

INSERT INTO HOCPHAN VALUES
('CNXHKH', N'Chủ nghĩa xã hội khoa học', 2),
('QTCSDL', N'Quản trị cơ sở dữ liệu', 3),
('LSD', N'Lịch sử đảng', 2),
('TTHCM', N'Tử tưởng hồ chí minh', 2),
('QTH', N'Quản trị học', 2),
('NNHT', N'Ngôn ngữ học thuật', 2),
('TDPB', N'Tư duy phản biện', 2),
('T2', N'Toán 2', 3),
('XSTK', N'Xác Xuất-Thống Kê', 3),
('T1', N'Toán 1', 3),
('ANQP', N'An Ninh Quốc Phòng', 4),
('TRR',N'Toán Rời Rạc',3)

INSERT INTO GIANGDAY VALUES
('3146','CNXHKH', 2, '2022-2023'),
('3145','QTCSDL', 2, '2022-2023'),
('3147','LSD', 1, '2022-2023'),
('3147','TTHCM' , 2, '2022-2023'),
('3148','QTH' , 2, '2022-2023'),
('3149','NNHT' , 1, '2022-2023'),
('3149','TDPB' , 2, '2022-2023'),
('3146','T2' ,1, '2022-2023'),
('3147','XSTK' , 1, '2023-2024'),
('3148','T1' , 1, '2023-2024'),
('3148','ANQP' ,1, '2023-2024'),
('3145','TRR' , 1, '2023-2024')

insert into KHHT values
('CNTT','TRR', N'Toán Rời Rạc',3,1,'2023-2024'),
('CNTP','T1', N'Toán 1',3,1,'2023-2024'),
('QTKD','T1', N'Toán 1',3,1,'2023-2024'),
('CNTT','ANQP', N'An Ninh Quốc Phòng', 4,1,'2023-2024'),
('QTKD','ANQP', N'An Ninh Quốc Phòng', 4,1,'2023-2024'),
('QTDL','ANQP', N'An Ninh Quốc Phòng', 4,1,'2023-2024'),
('CNXD','ANQP', N'An Ninh Quốc Phòng', 4,1,'2023-2024'),
('CNTP','ANQP', N'An Ninh Quốc Phòng', 4,1,'2023-2024'),
('CNXD','XSTK', N'Xác Xuất-Thống Kê',3,1,'2023-2024'),
('QTKD','XSTK', N'Xác Xuất-Thống Kê', 3,1,'2023-2024'),
('CNTP','XSTK', N'Xác Xuất-Thống Kê', 3,1,'2023-2024'),
('QTDL','XSTK', N'Xác Xuất-Thống Kê', 3,1,'2023-2024'),
('CNXD','T2', N'Toán 2', 3,1,'2023-2024'),
('QTDL','T2', N'Toán 2', 3,1,'2023-2024')

INSERT INTO KETQUA  VALUES
('63134535', 'QTCSDL', 2, '2022-2023','9.6','9.8','9.7'),
('63134535', 'TTHCM', 2, '2022-2023','4.6','4.8','4.7'),
('63136237', 'TTHCM', 1, '2022-2023','5.6','5.8','5.7'),
('63136237', 'NNHT',1, '2022-2023','7.6','7.8','7.7'),
('63134671', 'TTHCM', 2, '2022-2023','9','8','8.8'),
('63134671', 'QTCSDL',2, '2022-2023','9','7','8'),
('63134928', 'LSD' ,1, '2022-2023','0','0','0'),
('63134928', 'TTHCM', 2, '2022-2023','4.4','5','4.7'),
('63145672', 'TTHCM', 2, '2022-2023','6.6','6.8','6.7'),
('63147875', 'QTH', 2, '2022-2023','9.6','9.8','9.7'),
('63134657', 'CNXHKH', 2, '2022-2023','6','8','7'),
('63134913', 'TTHCM', 2, '2022-2023','4','8','6'),
('63130285', 'TTHCM', 2, '2022-2023','2','8','5'),
('63131989', 'LSD', 1, '2022-2023','4','7','5.5'),
('63134580', 'TTHCM', 2, '2022-2023','7','7','7'),
('63134580', 'LSD', 1, '2022-2023','9','8','8.5'),
('63133145', 'QTH', 2, '2022-2023','6','9','7.5'),
('63133145', 'NNHT', 1, '2022-2023','5','8','6.5'),
('63131276', 'NNHT', 1, '2022-2023','7','9','8'),
('63131276', 'TDPB', 2, '2022-2023','5','9','7'),
('63134217', 'TDPB', 2, '2022-2023','8','4','6'),
('63136237', 'QTH', 2, '2022-2023','9.6','9.8','9.7'),
('63134535', 'CNXHKH', 2, '2022-2023','4','7','5.5')

insert into LICHHOC values
('LH01','CNXHKH',1,2,'2022-2023',N'Nguyễn Văn Hùng',4,'12','G5-101'),
('LH02','QTCSDL',1,2,'2022-2023',N'Nguyễn Thị Kim Hoa',5,'123','G6-101'),
('LH03','LSD',1,1,'2022-2023',N'Trần Văn Trung',2,'45','G2-201'),
('LH04','TTHCM',9,2,'2022-2023',N'Trần Văn Trung',3,'67','G5-103'),
('LH05','QTH',9,2,'2022-2023',N'Nguyễn Hoàng Huy',7,'12','G7-301'),
('LH06','NNHT',9,1,'2022-2023',N'Nguyễn Thị Thủy',5,'123','G7-401'),
('LH07','TDPB',1,2,'2022-2023',N'Nguyễn Thị Thủy',6,'123','G3-101'),
('LH08','T2',1,1,'2023-2024',N'Nguyễn Văn Hùng',6,'567','G6-103'),
('LH09','XSTK',1,1,'2022-2024',N'Trần Văn Trung',5,'12','G3-203'),
('LH010','T1',1,1,'2022-2024',N'Nguyễn Hoàng Huy',3,'12','G6-201'),
('LH011','ANQP',1,1,'2022-2024',N'Nguyễn Hoàng Huy',4,'12345','G5-103'),
('LH012','TRR',1,1,'2022-2024',N'Nguyễn Thị Kim Hoa',2,'567','G5-101')

INSERT INTO DANGKY VALUES
('TRR','LH012','63134535','63.CNTT',N'Đã Đăng Ký',32,50),
('ANQP','LH011','63134535','63.CNTT',N'Chưa Đăng Ký',45,60),
('TRR','LH012','63136237','63.CNTT',N'Đã Đăng Ký',32,50),
('ANQP','LH011','63136237','63.CNTT',N'Đã Đăng Ký',45,60),
('TRR','LH012','63134671','63.CNTT',N'Chưa Đăng Ký',32,50),
('ANQP','LH011','63134671','63.CNTT',N'Đã Đăng Ký',45,60),
('TRR','LH012','63134217','63.CNTT',N'Chưa Đăng Ký',32,50),
('ANQP','LH011','63134217','63.CNTT',N'Đã Đăng Ký',45,60),
('ANQP','LH011','63134928','63.CNXD',N'Đã Đăng Ký',45,60),
('XSTK','LH09','63134928','63.CNXD',N'Chưa Đăng Ký',47,70),
('ANQP','LH011','63145672','63.CNXD',N'Đã Đăng Ký',45,60),
('XSTK','LH09','63145672','63.CNXD',N'Đã Đăng Ký',47,70),
('T2','LH08','63145672','63.CNXD',N'Đã Đăng Ký',50,50),
('T2','LH08','63134928','63.CNXD',N'Đã Đăng Ký',50,50),
('ANQP','LH011','63147875','63.CNTP',N'Chưa Đăng Ký',45,60),
('ANQP','LH011','63134657','63.CNTP',N'Đã Đăng Ký',45,60),
('ANQP','LH011','63134913','63.CNTP',N'Đã Đăng Ký',45,60),
('T1','LH010','63147875','63.CNTP',N'Đã Đăng Ký',57,60),
('T1','LH010','63134657','63.CNTP',N'Đã Đăng Ký',57,60),
('T1','LH010','63134913','63.CNTP',N'Đã Đăng Ký',57,60),
('XSTK','LH09','63147875','63.CNTP',N'Đã Đăng Ký',47,70),
('XSTK','LH09','63134657','63.CNTP',N'Đã Đăng Ký',47,70),
('XSTK','LH09','63134913','63.CNTP',N'Chưa Đăng Ký',47,70),
('ANQP','LH011','63130285','63.QTKD',N'Đã Đăng Ký',45,60),
('XSTK','LH09','63130285','63.QTKD',N'Chưa Đăng Ký',47,70),
('ANQP','LH011','63131989','63.QTKD',N'Đã Đăng Ký',45,60),
('XSTK','LH09','63131989','63.QTKD',N'Đã Đăng Ký',47,70),
('T1','LH010','63130285','63.QTKD',N'Đã Đăng Ký',57,60),
('T1','LH010','63131989','63.QTKD',N'Chưa Đăng Ký',57,60),
('ANQP','LH011','63134580','63.QTDL',N'Đã Đăng Ký',45,60),
('ANQP','LH011','63133145','63.QTDL',N'Đã Đăng Ký',45,60),
('ANQP','LH011','63131276','63.QTDL',N'Chưa Đăng Ký',45,60),
('XSTK','LH09','63134580','63.QTDL',N'Đã Đăng Ký',47,70),
('XSTK','LH09','63133145','63.QTDL',N'Đã Đăng Ký',47,70),
('XSTK','LH09','63131276','63.QTDL',N'Đã Đăng Ký',47,70),
('T2','LH08','63134580','63.QTDL',N'Chưa Đăng Ký',50,50),
('T2','LH08','63133145','63.QTDL',N'Đã Đăng Ký',50,50),
('T2','LH08','63131276','63.QTDL',N'Đã Đăng Ký',50,50)