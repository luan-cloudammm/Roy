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
	PHAI NVARCHAR(10) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    PHONE VARCHAR(20) NOT NULL,
    DIACHI NVARCHAR(900) NOT NULL,
	MSKHOA VARCHAR(10) NOT NULL
	FOREIGN KEY (MSKHOA) REFERENCES KHOA(MSKHOA),
);
CREATE TABLE SINHVIEN (
    MSSV VARCHAR(10) PRIMARY KEY,
    HOTENSV NVARCHAR(100) NOT NULL,
	MSKHOA VARCHAR(10) NOT NULL FOREIGN KEY (MSKHOA) REFERENCES KHOA(MSKHOA),
	LOP VARCHAR(10) NOT NULL,
    NGAYSINH DATE NOT NULL,
    PHAI NVARCHAR(10) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	PHONE VARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
);
select* from sinhvien
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
	FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MALH) REFERENCES LICHHOC(MALH),
	FOREIGN KEY (MAHP) REFERENCES HOCPHAN(MAHP)
);
insert into KHOA values
('CNTT',N'Công nghệ thông tin'),
('QTKD',N'Quản trị kinh doanh'),
('QTDL',N'Quản trị du lịch'),
('CNXD',N'Công nghệ xây dựng'),
('CNTP',N'Công nghệ thực phẩm')

insert into GIANGVIEN values
('3145',N'Nguyễn Thị Kim Hoa',N'Nữ','hoa.ntk@ntu.edu.vn','0913456689',N'Tôn Thất Tùng - Vĩnh Thọ - Nha Trang','CNTT'),
('3146',N'Nguyễn Văn Hùng',N'Nữ','hung.nv@ntu.edu.vn','0912472856',N'Nguyễn Đình Chiểu - Vĩnh Phước - Nha Trang','QTKD'),
('3147',N'Trần Văn Trung',N'Nữ','trung.tvk@ntu.edu.vn','0345756689',N'Lộc Thọ - Nha Trang','QTDL'),
('3148',N'Nguyễn Hoàng Huy ',N'Nữ','huy.nhk@ntu.edu.vn','0945621349',N'Vĩnh Thọ - Nha Trang','CNXD'),
('3149',N'Nguyễn Thị Thủy','Nam','hoa.ntk@ntu.edu.vn','0977654629',N'Vĩnh Lương - Nha Trang','CNTP')

INSERT INTO SINHVIEN VALUES
('63134535', N'Huỳnh Thanh Luân','CNTT','63.CNTT', '2003-06-30', N'Nữ','luan.ht.63cntt@ntu.edu.vn','0937724198',N'Vạn Ninh - Khánh Hòa' ),
('63136237', N'Nguyễn Văn An','CNTT', '63.CNTT', '2003-04-30', N'Nữ','an.nv.63cntt@ntu.edu.vn','0931456898',N'Tuy Hòa - Phú Yên' ),
('63134671', N'Trần Thị Mai Thơ','CNTT', '63.CNTT','2003-11-01', 'Nam','tho.ttm.63cntt@ntu.edu.vn','0934124148',N'Ninh Hòa - Khánh Hòa' ),
('63134928', N'Lê Duy Quốc','CNXD', '63.CNXD', '2003-01-09', N'Nữ','quoc.ld.63cnxd@ntu.edu.vn','0324141415',N'Vạn Ninh - Khánh Hòa' ),
('63145672', N'Nguyễn Thị Thu Thảo','CNXD', '63.CNXD', '2003-03-19', 'Nam','thao.ntt.63cnxd@ntu.edu.vn','0341414558',N'Vạn Ninh - Khánh Hòa' ),
('63147875', N'Trần Thị Thu Hà','CNTP', '63.CNTP', '2003-05-13', 'Nam','ha.ttt.63cntp@ntu.edu.vn','0931245198',N'Hoàn Kiếm - Hà Nội' ),
('63134657', N'Trần Quốc Bảo','CNTP', '63.CNTP', '2003-03-03', N'Nữ','bao.tq.63cntp@ntu.edu.vn','0952414515',N'Vạn Ninh - Khánh Hòa' ),
('63134913', N'Nguyễn Văn Hậu','CNTP', '63.CNTP', '2003-02-03', N'Nữ','hau.nv.63cntp@ntu.edu.vn','0351145138',N'Hải Anh - Hải Phòng' ),
('63130285', N'Phạm Thị Quỳnh Như','QTKD', '63.QTKD', '2003-10-20', 'Nam','nhu.ptq.63qtkd@ntu.edu.vn','0563141551',N'TP.Vinh - Khánh Hòa' ),
('63131989', N'Phạm Văn Đồng','QTKD', '63.QTKD', '2003-07-11', N'Nữ','dong.pv.63qtkd@ntu.edu.vn','0941342198',N'Vạn Ninh - Khánh Hòa' ),
('63134580', N'Nguyễn Thị Kim Hương','QTDL', '63.QTDL', '2003-12-21', 'Nam','huong.ntk.63qtdl@ntu.edu.vn','0941525498',N'Quỳnh Lưu - Nghệ An' ),
('63133145', N'Phạm Tú Như', 'QTDL','63.QTDL', '2003-06-25', 'Nam','nhu.pt.63qtdl@ntu.edu.vn','09151414198',N'Hòa Xuân - Khánh Hòa' ),
('63131276', N'Lê Trọng Hậu','QTDL', '63.QTDL', '2003-01-21', 'Nam','hau.lt.63qtdl@ntu.edu.vn','0514141558',N'An Xuyên - Cà Mau' ),
('63134217', N'Lê Văn Luyện','CNTT', '63.CNTT', '2003-01-21', 'Nam','luyen.lv.63cntt@ntu.edu.vn','0512414558',N'Vạn Ninh - Khánh Hòa' )

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
('TRR','LH012','63134535','63.CNTT',N'Đã Đăng Ký'),
('ANQP','LH011','63134535','63.CNTT',N'Chưa Đăng Ký'),
('TRR','LH012','63136237','63.CNTT',N'Đã Đăng Ký'),
('ANQP','LH011','63136237','63.CNTT',N'Đã Đăng Ký'),
('TRR','LH012','63134671','63.CNTT',N'Chưa Đăng Ký'),
('ANQP','LH011','63134671','63.CNTT',N'Đã Đăng Ký'),
('TRR','LH012','63134217','63.CNTT',N'Chưa Đăng Ký'),
('ANQP','LH011','63134217','63.CNTT',N'Đã Đăng Ký'),
('ANQP','LH011','63134928','63.CNXD',N'Đã Đăng Ký'),
('XSTK','LH09','63134928','63.CNXD',N'Chưa Đăng Ký'),
('ANQP','LH011','63145672','63.CNXD',N'Đã Đăng Ký'),
('XSTK','LH09','63145672','63.CNXD',N'Đã Đăng Ký'),
('T2','LH08','63145672','63.CNXD',N'Đã Đăng Ký'),
('T2','LH08','63134928','63.CNXD',N'Đã Đăng Ký'),
('ANQP','LH011','63147875','63.CNTP',N'Chưa Đăng Ký'),
('ANQP','LH011','63134657','63.CNTP',N'Đã Đăng Ký'),
('ANQP','LH011','63134913','63.CNTP',N'Đã Đăng Ký'),
('T1','LH010','63147875','63.CNTP',N'Đã Đăng Ký'),
('T1','LH010','63134657','63.CNTP',N'Đã Đăng Ký'),
('T1','LH010','63134913','63.CNTP',N'Đã Đăng Ký'),
('XSTK','LH09','63147875','63.CNTP',N'Đã Đăng Ký'),
('XSTK','LH09','63134657','63.CNTP',N'Đã Đăng Ký'),
('XSTK','LH09','63134913','63.CNTP',N'Chưa Đăng Ký'),
('ANQP','LH011','63130285','63.QTKD',N'Đã Đăng Ký'),
('XSTK','LH09','63130285','63.QTKD',N'Chưa Đăng Ký'),
('ANQP','LH011','63131989','63.QTKD',N'Đã Đăng Ký'),
('XSTK','LH09','63131989','63.QTKD',N'Đã Đăng Ký'),
('T1','LH010','63130285','63.QTKD',N'Đã Đăng Ký'),
('T1','LH010','63131989','63.QTKD',N'Chưa Đăng Ký'),
('ANQP','LH011','63134580','63.QTDL',N'Đã Đăng Ký'),
('ANQP','LH011','63133145','63.QTDL',N'Đã Đăng Ký'),
('ANQP','LH011','63131276','63.QTDL',N'Chưa Đăng Ký'),
('XSTK','LH09','63134580','63.QTDL',N'Đã Đăng Ký'),
('XSTK','LH09','63133145','63.QTDL',N'Đã Đăng Ký'),
('XSTK','LH09','63131276','63.QTDL',N'Đã Đăng Ký'),
('T2','LH08','63134580','63.QTDL',N'Chưa Đăng Ký'),
('T2','LH08','63133145','63.QTDL',N'Đã Đăng Ký'),
('T2','LH08','63131276','63.QTDL',N'Đã Đăng Ký')

drop table DANGKY;
drop table LICHHOC;
drop table KHHT;
drop table KETQUA;
drop table GIANGDAY;
drop table HOCPHAN;
drop table SINHVIEN;
drop table GIANGVIEN;
drop table KHOA;


-- tạo bảng đăng nhập
create table Dangnhap
(	
	Id varchar(10) primary key,
	pass varchar(15)
)


insert into Dangnhap values
('admin', 123),('giangvien',112),('sinhvien',111)

select* from Dangnhap
--a.	Truy vấn đơn giản: 3 câu
/*1.Truy vấn danh sách tất cả các giảng viên và tên khoa mà họ thuộc về:*/

SELECT GIANGVIEN.MSGV, GIANGVIEN.HOTENGV, KHOA.TENKHOA 
FROM GIANGVIEN 
INNER JOIN KHOA ON GIANGVIEN.MSKHOA = KHOA.MSKHOA;

/*2.Truy vấn danh sách tất cả các lớp học phần và tên giảng viên dạy mỗi lớp:*/

SELECT LICHHOC.MALH as N'Mã lịch học', LICHHOC.MAHP as N'Mã học phần', GIANGVIEN.HOTENGV as 'Họ tên giảng viên'
FROM LICHHOC 
INNER JOIN GIANGDAY ON LICHHOC.MAHP = GIANGDAY.MAHP 
INNER JOIN GIANGVIEN ON GIANGDAY.MSGV = GIANGVIEN.MSGV;

/*3.Truy vấn danh sách tất cả các sinh viên đã đăng ký học phần và lớp học phần tương ứng:*/
SELECT DANGKY.MAHP, DANGKY.MALH, SINHVIEN.MSSV
FROM DANGKY 
INNER JOIN SINHVIEN ON DANGKY.MSSV = SINHVIEN.MSSV;

--b.	Truy vấn với Aggregate Functions: 7 câu 
/*4.Liệt kê danh sách các lớp học phần và số lượng sinh viên đăng ký trong từng lớp, sắp xếp kết quả theo số lượng sinh viên giảm dần.*/

SELECT DANGKY.MAHP, LICHHOC.MALH, COUNT(DANGKY.MSSV) AS SoLuongSinhVienDangKy
FROM DANGKY
INNER JOIN LICHHOC ON DANGKY.MALH = LICHHOC.MALH
GROUP BY DANGKY.MAHP, LICHHOC.MALH
ORDER BY SoLuongSinhVienDangKy DESC;

/*5.Hiển thị điểm trung bình của học phần "QTCSDL" trong năm học 2022-2023.*/

SELECT AVG((DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100)) AS DiemTrungBinh 
FROM KETQUA, HOCPHAN 
WHERE KETQUA.MAHP = HOCPHAN.MAHP AND HOCPHAN.MAHP = 'QTCSDL' 
AND KETQUA.NAMHOC = '2022-2023';


/*6.Hiển thị tên của các học phần mà không có sinh viên nào đăng ký.*/

SELECT TENHP
FROM HOCPHAN
WHERE MAHP NOT IN (SELECT DISTINCT MAHP FROM DANGKY);


/*7.Số lượng sinh viên đã đăng ký học phần "ANQP" .*/

SELECT COUNT(*) AS N'số lượng đã đăng ký' 
FROM DANGKY 
WHERE TRANGTHAIDK =N'Đã Đăng Ký' AND MAHP = 'ANQP';

/*8.Lấy tên của giảng viên và số lượng học phần mà họ đang dạy.*/

SELECT GIANGVIEN.HOTENGV, COUNT(GIANGDAY.MAHP) AS SL_HOCPHAN 
FROM GIANGVIEN 
LEFT JOIN GIANGDAY ON GIANGVIEN.MSGV = GIANGDAY.MSGV 
GROUP BY GIANGVIEN.HOTENGV;

/*9.Liệt kê tên giảng viên, email, số điện thoại, tên khoa mà giảng viên đó đang giảng dạy, 
số lượng học phần mà giảng viên đó đang giảng dạy và tổng số tín chỉ của các học phần đó.*/

SELECT gv.HOTENGV, gv.EMAIL, gv.PHONE, kh.TENKHOA, COUNT(DISTINCT gd.MAHP) AS SO_HP, SUM(hp.SOTC) AS TONG_TC
FROM GIANGVIEN gv
JOIN KHOA kh ON gv.MSKHOA = kh.MSKHOA
JOIN GIANGDAY gd ON gv.MSGV = gd.MSGV
JOIN HOCPHAN hp ON gd.MAHP = hp.MAHP
GROUP BY gv.HOTENGV, gv.EMAIL, gv.PHONE, kh.TENKHOA

/*10.Liệt kê danh sách tên của tất cả các giảng viên kèm theo tổng số tín chỉ mà họ giảng dạy trong học kỳ 1 năm học 2022-2023.*/
SELECT GIANGVIEN.HOTENGV AS N'HỌ TEN GIẢNG VIÊN', SUM(HOCPHAN.SOTC) AS N'TỔNG SỐ TÍN CHỈ'
FROM GIANGVIEN
LEFT JOIN GIANGDAY ON GIANGVIEN.MSGV = GIANGDAY.MSGV
LEFT JOIN HOCPHAN ON GIANGDAY.MAHP = HOCPHAN.MAHP
WHERE GIANGDAY.HOCKY = 1 AND GIANGDAY.NAMHOC = '2022-2023'
GROUP BY GIANGVIEN.MSGV, GIANGVIEN.HOTENGV


/*	Truy vấn với mệnh đề having: 5 câu*/

/*11. Liệt kê các sinh viên có điểm trung bình của học phần 'QTH' nhiều hơn hoặc bằng 8.0.*/

SELECT kq.MSSV, HOTENSV, ROUND((DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100), 1) AS 'DTB_QTH'
FROM KETQUA kq
JOIN SINHVIEN sv ON kq.MSSV = sv.MSSV
WHERE kq.MAHP = 'QTH'
GROUP BY kq.MSSV, HOTENSV, DIEMGK, DIEMBP, DIEMKT
HAVING ROUND((DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100), 1) >= 8.0


/*12.Liệt kê các học phần có số tín chỉ lớn hơn hoặc bằng 3 và số lượng sinh viên đăng ký học nhiều hơn hoặc bằng 10, và được mở trong học kỳ 1 năm 2022*/
SELECT hp.MAHP, hp.TENHP, hp.SOTC, COUNT(*) as SOLUONGDK
FROM HOCPHAN hp JOIN DANGKY dk ON hp.MAHP = dk.MAHP JOIN LICHHOC lh ON dk.MALH = lh.MALH
WHERE lh.HOCKY = 1 AND lh.NAMHOC = '2022'
GROUP BY hp.MAHP, hp.TENHP, hp.SOTC
HAVING hp.SOTC >= 3 AND COUNT(*) >= 10;


/*13.Liệt kê các học phần có số tín chỉ lớn hơn hoặc bằng 2 và điểm trung bình của các sinh viên đạt từ 5 đến 8, và được mở trong học kỳ 2 năm 2023*/

SELECT kq.MAHP, hp.TENHP, hp.SOTC, AVG((DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100)) as DIEMTB
FROM KETQUA kq JOIN HOCPHAN hp ON kq.MAHP = hp.MAHP JOIN DANGKY dk ON kq.MAHP = dk.MAHP JOIN LICHHOC lh ON dk.MALH = lh.MALH
WHERE lh.HOCKY = 2 AND lh.NAMHOC = '2023'
GROUP BY kq.MAHP, hp.TENHP, hp.SOTC
HAVING hp.SOTC >= 2 AND AVG((DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100)) BETWEEN 5 AND 8;

/*14.Tính tổng số tín chỉ các học phần và sắp xếp kết quả theo thứ tự tăng dần của tổng số tín chỉ.*/

SELECT MAHP, SUM(SOTC) AS TongSoTinChi
FROM HOCPHAN
GROUP BY MAHP
HAVING SUM(SOTC) > 0
ORDER BY TongSoTinChi ASC;


/*15.Liệt kê các học phần có số tín chỉ lớn hơn hoặc bằng 3 và số lượng sinh viên đăng ký học ít hơn hoặc bằng 50*/

SELECT KQ.MAHP, HP.TENHP, HP.SOTC, COUNT(DISTINCT KQ.MSSV) AS SoLuongSVDangKy
FROM KETQUA AS KQ
INNER JOIN HOCPHAN AS HP ON KQ.MAHP = HP.MAHP
GROUP BY KQ.MAHP, HP.TENHP, HP.SOTC
HAVING HP.SOTC >= 3 AND COUNT(DISTINCT KQ.MSSV) <= 50;


/*d.	Truy vấn lớn nhất, nhỏ nhất: 3 câu*/

-- 16.Lấy điểm cao nhất và thấp nhất của học phần NNHT
SELECT MAX(DIEMBP) AS DIEM_MAX, MIN(DIEMBP) AS DIEM_MIN
FROM KETQUA
WHERE MAHP = 'NNHT';

--17.số lần đăng ký của một học phần được đăng ký nhiều nhất:

SELECT COUNT(*) AS SO_LAN_DANG_KY 
FROM DANGKY
WHERE MAHP = (SELECT TOP 1 MAHP 
              FROM DANGKY 
              GROUP BY MAHP 
              ORDER BY COUNT(*) DESC);

--18. Truy vấn học phần có điểm trung bình cao nhất của một sinh viên có MSSV = '63134535'
SELECT TOP 1 MAHP, AVG(DIEMBP*20/100 + DIEMGK*30/100 + DIEMKT*50/100) AS 'DIEM_TB'
FROM KETQUA
WHERE MSSV = '63134535'
GROUP BY MAHP
ORDER BY DIEM_TB DESC;


--e.	Truy vấn Không/chưa có: (Not In và left/right join): 5 câu

--19.Liệt kê các sinh viên chưa đăng ký học phần có mã XSTK

SELECT MSSV, HOTENSV
FROM SINHVIEN
WHERE MSSV NOT IN (SELECT DISTINCT MSSV FROM DANGKY WHERE MAHP = 'XSTK')

--20. Liệt kê các sinh viên đã đăng ký học phần nhưng chưa có lịch học.

SELECT SINHVIEN.MSSV, HOTENSV, MAHP
FROM SINHVIEN
INNER JOIN DANGKY ON SINHVIEN.MSSV = DANGKY.MSSV
WHERE CONCAT(DANGKY.MAHP, DANGKY.MALH) NOT IN (SELECT CONCAT(MAHP, MALH) FROM LICHHOC)

--21.Lấy danh sách tất cả các sinh viên không có điểm thi môn "Lập trình hướng đối tượng" (MAHP='LTHDT') trong kỳ học 1 năm 2022

SELECT SV.MSSV, SV.HOTENSV
FROM SINHVIEN AS SV
WHERE SV.MSSV NOT IN (
	SELECT KQ.MSSV 
	FROM KETQUA AS KQ 
	WHERE KQ.MAHP = 'LTHDT' AND KQ.HOCKY = 1 AND KQ.NAMHOC = '2022'
);

--22.Lấy danh sách các sinh viên chưa đăng ký học phần nào trong kỳ học 1 năm 2023.

SELECT SV.MSSV, SV.HOTENSV
FROM SINHVIEN AS SV
WHERE SV.MSSV NOT IN (
	SELECT DK.MSSV
	FROM DANGKY AS DK
	INNER JOIN LICHHOC AS LH ON LH.MALH = DK.MALH AND LH.HOCKY = 1 AND LH.NAMHOC = '2023'
);


--23.Liệt kê các sinh viên đã đăng ký học phần CNXHKH nhưng chưa đăng ký học phần XSTK.

SELECT HOTENSV FROM SINHVIEN
WHERE MSSV IN (
    SELECT MSSV FROM KETQUA
    WHERE MAHP = 'CNXHKH'
)
AND MSSV NOT IN (
    SELECT MSSV FROM KETQUA
    WHERE MAHP = 'XSTK'
);

--f.	Truy vấn Hợp/Giao/Trừ: 3 câu 

--24. Liệt kê thông tin tất cả các học phần được đăng ký trong học kỳ 1 năm học 2022-2023, sắp xếp theo thứ tự tên học phần.

SELECT KETQUA.MAHP, TENHP, SOTC, MSSV, DIEMBP, DIEMGK, DIEMKT 
FROM KETQUA 
JOIN HOCPHAN ON KETQUA.MAHP = HOCPHAN.MAHP 
WHERE HOCKY = 1 AND NAMHOC = '2022-2023' 
ORDER BY TENHP;

--25. Liệt kê thông tin các học phần đã được đăng ký trong học kỳ 2 năm học 2021-2022, mà sinh viên có mã số là '63134217' đã thi không đạt.

SELECT KETQUA.MAHP, TENHP, SOTC, HOCKY, NAMHOC, DIEMBP, DIEMGK, DIEMKT 
FROM KETQUA 
JOIN HOCPHAN ON KETQUA.MAHP = HOCPHAN.MAHP 
WHERE HOCKY = 2 AND NAMHOC = '2021-2022' 
AND MSSV = '63134535' 
AND (DIEMBP < 5 OR DIEMGK < 5 OR DIEMKT < 5);

/*26. Liệt kê tất cả các học phần đã được đăng ký trong học kỳ 1 năm học 2022-2023,
 không bao gồm các học phần thuộc Khoa Công nghệ thông tin.*/

SELECT DISTINCT HOCPHAN.MAHP, TENHP, SOTC 
FROM HOCPHAN 
JOIN KETQUA ON HOCPHAN.MAHP = KETQUA.MAHP 
WHERE HOCKY = 1 AND NAMHOC ='2022-2023'


-- a.	Truy vấn Update, Delete:  7 câu
--27. Cập nhật thông tin của giảng viên mã '3145': Họ và tên giảng viên 'Nguyễn Thị Kim Hoa' thành 'Lê Thị Lan Anh'

UPDATE GIANGVIEN
SET HOTENGV = N'Lê Thị Lan Anh'
WHERE MSGV = '3145';

--28. Xóa thông tin của lớp học phần mã 'T1' khỏi bảng Đăng ký.

DELETE FROM DANGKY
WHERE MAHP = 'T1';

--29. Cập nhật số tín chỉ của học phần mã 'NNHT' thành 4.

UPDATE HOCPHAN
SET SOTC = 4
WHERE MAHP = 'NNHT';


--30. Xóa thông tin của giảng viên mã '3148' khỏi bảng Giảng dạy.

DELETE FROM GIANGDAY
WHERE MSGV = '3148';

/*31.Cập nhật thông tin của sinh viên mã 'SV001': Họ và tên sinh viên 'Nguyễn Thị Anh' thành 'Lê Thị Minh Anh', 
email thành 'minhanh@gmail.com', số điện thoại thành '0912345678'.*/

UPDATE SINHVIEN
SET HOTENSV = N'Lê Thị Minh Anh', EMAIL = 'minhanh@gmail.com', PHONE = '0912345678'
WHERE MSSV = 'SV001';


--32.Xóa thông tin của học phần mã 'T2' khỏi bảng Kết quả học tập.
DELETE FROM KETQUA
WHERE MAHP = 'T2';


--33.Cập nhật trạng thái đăng ký của sinh viên mã '63147875' cho lớp học phần mã 'ANQP' thành 'Đã đăng ký'.

UPDATE DANGKY
SET TRANGTHAIDK = N'Đã Đăng Ký'
WHERE MSSV = '63147875' AND MAHP = 'ANQP';


--Truy vấn sử dụng phép Chia: 2 câu

--34. cho biết những môn mà tất cả các sinh viên theo học trong học kỳ 2

SELECT DISTINCT KQ.MAHP, HP.TENHP
FROM KETQUA KQ
INNER JOIN HOCPHAN HP ON KQ.MAHP = HP.MAHP
WHERE KQ.HOCKY = 1
AND NOT EXISTS (
    SELECT *
    FROM SINHVIEN SV
    WHERE NOT EXISTS (
        SELECT *
        FROM DANGKY DK
        WHERE DK.MSSV = SV.MSSV
        AND DK.MAHP = KQ.MAHP
        AND DK.TRANGTHAIDK = 'Đã đăng ký'
        AND DK.MALH IN (
            SELECT MALH
            FROM LICHHOC
            WHERE MAHP = KQ.MAHP
            AND HOCKY = 2
        )
    )
);


--35 cho biết sinh viên đã học tất cả các môn

SELECT DISTINCT MSSV, HOTENSV
FROM SINHVIEN
WHERE EXISTS (
    SELECT MAHP FROM HOCPHAN
    WHERE NOT EXISTS (
        SELECT MAHP FROM KETQUA
        WHERE KETQUA.MAHP = HOCPHAN.MAHP
        AND KETQUA.MSSV = SINHVIEN.MSSV
    )
);




/*Hàm tìm kiếm thông tin giảng viên theo tên:*/
CREATE FUNCTION search_teacher_by_name(@name NVARCHAR(200))
RETURNS TABLE AS RETURN
SELECT * FROM GIANGVIEN WHERE HOTENGV LIKE '%' + @name + '%'

SELECT * FROM search_teacher_by_name(N'Nguyễn')

/*Hàm thêm một khoa mới:*/
CREATE PROCEDURE add_department(@mskhoa VARCHAR(10), @tenkhoa NVARCHAR(100))
AS
BEGIN
    INSERT INTO KHOA VALUES(@mskhoa, @tenkhoa);
END

EXEC add_department 'TL', N'Khoa Thanh Luân'

/*Hàm cập nhật thông tin giảng viên:*/
CREATE PROCEDURE update_teacher_info(@msgv VARCHAR(10), @hoten NVARCHAR(200), @phai NVARCHAR(10), @email VARCHAR(100), @phone VARCHAR(20), @diachi NVARCHAR(900))
AS
BEGIN
    UPDATE GIANGVIEN SET HOTENGV = @hoten, PHAI = @phai, EMAIL = @email, PHONE = @phone, DIACHI = @diachi WHERE MSGV = @msgv
END

EXEC update_teacher_info '3146', N'Huỳnh Thanh Luân', N'BEDE', 'Luân 1 lằn @ gờ meo chấm cơm', '113', N'Việt Nam'

/*Hàm thêm một sinh viên mới:*/
CREATE PROCEDURE add_student(@mssv VARCHAR(10), @hoten NVARCHAR(100), @mskhoa VARCHAR(10), @lop VARCHAR(10), @ngaysinh DATE, @phai NVARCHAR(10), @email VARCHAR(100), @phone VARCHAR(20), @diachi NVARCHAR(500))
AS
BEGIN
    INSERT INTO SINHVIEN VALUES(@mssv, @hoten, @mskhoa, @lop, @ngaysinh, @phai, @email, @phone, @diachi)
END

EXEC add_student '63131333', N'Nguyễn Văn B', 'CNTT', '18DTHA1', '1999-01-01', N'Nam', 'nguyenvanb@gmail.com', '0987654321', N'456 đường XYZ, quận ABC, TP. Hồ Chí Minh'

/*Hàm thêm một kết quả học tập mới:*/
CREATE PROCEDURE add_study_result(@mssv VARCHAR(10), @mahp VARCHAR(10), @hocky SMALLINT, @namhoc VARCHAR(10), @diembp DECIMAL(2,1), @diemgk DECIMAL(2,1), @diemkt DECIMAL(2,1))
AS
BEGIN
    INSERT INTO KETQUA VALUES(@mssv, @mahp, @hocky, @namhoc, @diembp, @diemgk, @diemkt)
END

EXEC add_study_result '63131333', 'TTHCM', 1, '2022-2023', '9.9', '9.0', '9.0'
