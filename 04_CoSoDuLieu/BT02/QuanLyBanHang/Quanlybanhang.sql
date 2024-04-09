USE QLBH


SET DATEFORMAT dmy;


CREATE TABLE KHACHHANG(
	MAKH INT PRIMARY KEY,
	HOTEN NVARCHAR(100),
	DCHI NVARCHAR(300),
	SODT VARCHAR(200),
	NGSINH DATE,
	DOANHSO DECIMAL(18,2),
	NGDK DATE
);

ALTER TABLE KHACHHANG
DROP CONSTRAINT PK__KHACHHAN__603F592CD8093B74;

ALTER TABLE KHACHHANG
ALTER COLUMN MAKH VARCHAR(100) NOT NULL;

ALTER TABLE KHACHHANG
ADD CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH);

CREATE TABLE NHANVIEN (
    MANV INT PRIMARY KEY,
    HOTEN VARCHAR(100),
    NGVL DATE,
    SODT VARCHAR(20)
);



ALTER TABLE NHANVIEN
DROP CONSTRAINT [PK__NHANVIEN__603F51141DDA7AA8] ;
ALTER TABLE NHANVIEN
ALTER COLUMN MANV VARCHAR(100) NOT NULL;
ALTER TABLE NHANVIEN
ADD CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV);

CREATE TABLE SANPHAM(
	MASP VARCHAR(10) PRIMARY KEY NOT NULL,
	TENSP VARCHAR(100),
	DVT VARCHAR(100),
	NUOCSX VARCHAR(100),
	GIA DECIMAL(18,2),

);

ALTER TABLE SANPHAM
ADD  CONSTRAINT PK_SANPHAM PRIMARY KEY (MASP);

ALTER TABLE SANPHAM
ALTER COLUMN MASP VARCHAR(10) NOT NULL

CREATE TABLE HOADON(
	SOHD INT PRIMARY KEY NOT NULL,
	NGHD DATE,
	MAKH VARCHAR(100) ,
	MANV VARCHAR(100),
	TRIGIA DECIMAL(18,2)
);

ALTER TABLE HOADON
ADD CONSTRAINT FK_MAKH_HOADON
FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);

ALTER TABLE HOADON
ADD CONSTRAINT FK_MANV_HOADON
FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);

CREATE TABLE CTHD(
	SOHD INT,
	MASP VARCHAR(100),
	SL INT,
	PRIMARY KEY (SOHD,MASP)
);

ALTER TABLE CTHD
ALTER COLUMN MASP VARCHAR(10) NOT NULL

ALTER TABLE CTHD
DROP CONSTRAINT [FK_SOHD_CTHD];

ALTER TABLE CTHD
ADD CONSTRAINT PK_CTHD PRIMARY KEY(SOHD,MASP)

ALTER TABLE CTHD 
ADD CONSTRAINT FK_SOHD_CTHD
FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD);

ALTER TABLE CTHD
ADD CONSTRAINT FK_MASP_CTHD
FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);

-- 1. Bài tập 1
-- Sinh viên tiến hành viết câu lệnh nhập dữ liệu cho CSDL QuanLyBanHang (Phần II, câu 1 bài tập thực hành trang 4).

INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES 
('NV01', 'Nguyen Nhu Nhut', '0987567389', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '0987567391', '2006-04-27'),
('NV04', 'Ngo Thanh Tuan', '0987567392', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0987567393', '2006-07-20');

-- BANG KHACHHANG
INSERT INTO KHACHHANG(MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES
    ('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', '13060000', '2006-07-22'),
    ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '08823452', '1992-07-27', '280000', '2006-07-30'),
    ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '08823453', '1961-06-29', '3860000', '2006-07-22'),
    ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '08823454', '1988-08-23', '250000', '2006-07-22'),
    ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08823455', '1939-05-18', '21000', '2006-10-28'),
    ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08823456', '1981-12-31', '915000', '2006-11-24'),
    ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '08823457', '1988-06-26', '12500', '2006-07-22'),
    ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '08823458', '1988-07-26', '365000', '2006-12-13'),
    ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08823459', '1923-09-28', '70000', '2007-01-14'),
    ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08823460', '1952-01-30', '67500', '2007-01-16');

	--- SANPHAM
	INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES
		('BC01', 'But chi', 'cay', 'Singapore', 3000),
		('BC02', 'But chi', 'cay', 'Singapore', 5000),
		('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
		('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
		('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
		('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
		('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
		('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
		('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
		('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
		('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
		('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
		('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
		('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000),
		('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
		('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
		('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
		('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
		('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
		('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
		('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
		('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
		('ST09', 'But long', 'cay', 'Viet Nam', 5000),
		('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

--- BANG HOADON
		INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
			(1001, '2006-07-23', 'KH01', 'NV01', 320000),
			(1002, '2006-08-12', 'KH01', 'NV02', 840000),
			(1003, '2006-08-23', 'KH02', 'NV01', 100000),
			(1004, '2006-09-01', 'KH02', 'NV01', 180000),
			(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
			(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
			(1007, '2006-10-28', 'KH03', 'NV03', 510000),
			(1008, '2006-10-28', 'KH01', 'NV03', 440000),
			(1009, '2006-10-28', 'KH03', 'NV04', 200000),
			(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
			(1011, '2006-11-04', 'KH04', 'NV03', 250000),
			(1012, '2006-11-30', 'KH05', 'NV03', 21000),
			(1013, '2006-12-12', 'KH06', 'NV01', 5000),
			(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
			(1015, '2007-01-01', 'KH06', 'NV01', 910000),
			(1016, '2007-01-01', 'KH07', 'NV02', 12500),
			(1017, '2007-01-02', 'KH08', 'NV03', 35000),
			(1018, '2007-01-13', 'KH08', 'NV03', 330000),
			(1019, '2007-01-13', 'KH01', 'NV03', 30000),
			(1020, '2007-01-14', 'KH09', 'NV04', 70000),
			(1021, '2007-01-16', 'KH10', 'NV03', 67500),
			(1022, '2007-01-16', NULL, 'NV03', 7000),
			(1023, '2007-01-17', NULL, 'NV01', 330000);


-- Bang CTHD
			-- CTHD1
			INSERT INTO CTHD (SOHD, MASP, SL) VALUES
			(1001, 'TV02', 10),
			(1001, 'ST01', 5),
			(1001, 'BC01', 5),
			(1001, 'BC02', 10),
			(1001, 'ST08', 10),
			(1002, 'BC04', 20),
			(1002, 'BB01', 20),
			(1002, 'BB02', 20),
			(1003, 'BB03', 10),
			(1004, 'TV01', 20),
			(1004, 'TV02', 10),
			(1004, 'TV03', 10),
			(1004, 'TV04', 10),
			(1005, 'TV05', 50),
			(1005, 'TV06', 50),
			(1006, 'TV07', 20),
			-- CTHD2
			(1006, 'ST01', 30),
			(1006, 'ST02', 10),
			(1007, 'ST03', 10),
			(1008, 'ST04', 8),
			(1009, 'ST05', 10),
			(1010, 'TV07', 50),
			(1010, 'ST07', 50),
			(1010, 'ST08', 100),
			(1010, 'ST04', 50),
			(1010, 'TV03', 100),
			(1011, 'ST06', 50),
			(1012, 'ST07', 3),
			(1013, 'ST08', 5),
			(1014, 'BC02', 80),
			(1014, 'BB02', 100),
			(1014, 'BC04', 60),
			-- CTHD3
			(1014, 'BB01', 50),
			(1015, 'BB02', 30),
			(1015, 'BB03', 7),
			(1016, 'TV01', 5),
			(1017, 'TV02', 1),
			(1017, 'TV03', 1),
			(1017, 'TV04', 5),
			(1018, 'ST04', 6),
			(1019, 'ST05', 1),
			(1019, 'ST06', 2),
			(1020, 'ST07', 10),
			(1021, 'ST08', 5),
			(1021, 'TV01', 7),
			(1021, 'TV02', 10),
			(1022, 'ST07', 1),
			(1023, 'ST04', 6);

SELECT * FROM KHACHHANG

SET DATEFORMAT DMY
SELECT * FROM NHANVIEN;
SELECT MANV, HOTEN, SODT, CONVERT(VARCHAR(10), NGVL, 103) AS NGVL_DMY
FROM NHANVIEN;
SELECT MANV, HOTEN, SODT, FORMAT(NGVL, 'dd/MM/yyyy') AS NGVL_DMY
FROM NHANVIEN;
DELETE FROM NHANVIEN WHERE MANV IN ('NV01', 'NV02', 'NV03', 'NV04', 'NV05');



-- Cau 2 : 2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM
ADD GHICHU VARCHAR(20);

-- Cau 3 : 3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG
ADD LOAIKH VARCHAR(100)
ALTER TABLE KHACHHANG
DROP COLUMN LOAIKH
ALTER TABLE KHACHHANG
DROP CONSTRAINT CK_LOAIKH
-- Câu 4 : 4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100)

-- Cau 5 : 5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM
DROP COLUMN GHICHU

-- Cau 6 : 6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”…
ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_LOAIKH CHECK (LOAIKH IN ('Vang lai','Thuong xuyen', 'VIP'))

-- Cau 7 : 7.	Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_DVT CHECK(DVT IN('cay','hop','cai','quyen','chuc'))

-- Cau 8 : 8.	Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_GIABAN CHECK(GIA >= 500)

-- Cau 9 : 9.	Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE CTHD
ADD CONSTRAINT CK_SLHD CHECK(SL >0)

-- CAU 10 : 10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG
ADD CONSTRAINT CT_CHECK_NGDK CHECK(NGDK > NGSINH)

SELECT * FROM NHANVIEN
SELECT * FROM HOADON

SELECT * FROM 
NHANVIEN LEFT JOIN HOADON
ON NHANVIEN.MANV = HOADON.MANV

/* 
	Bài tập 3
Sinh viên hoàn thành Phần II bài tập QuanLyBanHang từ câu 2 đến câu 5.
*/

-- 2.	Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM  KHACHHANG


-- 3.	Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM 
SET
GIA = GIA * 0.05
WHERE NUOCSX = 'Thai Lan'


-- 4.	Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM
SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000
-- 5.	Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 
-- có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau 
-- có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).

UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE (NGDK < '1/1/2007' AND DOANHSO >= 10000000) OR (NGDK > '1/1/2007' AND DOANHSO  >= 2000000)

/* 

5. Bài tập 5
Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 1 đến câu 11.
*/

-- 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP , TENSP 
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- 2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
	
	SELECT MASP,TENSP
	FROM SANPHAM
	WHERE DVT = 'cay' OR DVT = 'quyen'

-- 3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

	SELECT MASP, TENSP
	FROM SANPHAM
	WHERE MASP LIKE 'B%01'

-- 4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
	
		SELECT MASP AS 'Mã sản phảm', TENSP AS 'Tên sản phẩm'
		FROM SANPHAM
		WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000

-- 5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.

		SELECT MASP AS 'Mã sản phảm', TENSP AS 'Tên sản phẩm'
		FROM SANPHAM
		WHERE NUOCSX = 'Thai lan' AND GIA BETWEEN 30000 AND 40000

--6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
		
		SELECT SOHD AS 'Số hóa đơn' , TRIGIA AS 'Trị giá'
		FROM HOADON
		WHERE NGHD >= '1/1/2007' AND NGHD <= '2/1/2007'

-- 7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
			
		SELECT SOHD AS 'Số hóa đơn' , TRIGIA AS 'Trị giá'
		FROM HOADON
		WHERE NGHD = '1/1/2007'
		ORDER BY NGHD ASC, TRIGIA DESC

-- 8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
	SELECT k.MAKH , k.HOTEN
	FROM KHACHHANG k LEFT JOIN HOADON h
	ON k.MAKH = h.MAKH
	WHERE h.NGHD = '1/1/2007'
-- 9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.	

SET DATEFORMAT DMY
		
		SELECT h.SOHD, h.TRIGIA
		FROM HOADON h LEFT JOIN NHANVIEN n
		ON h.MANV = n.MANV
		WHERE h.NGHD = '28/10/2006'


-- 10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
		
		SELECT sp.MASP , sp.TENSP, hd.NGHD
		FROM KHACHHANG kh JOIN HOADON hd
		ON kh.MAKH = hd.MAKH JOIN CTHD ct
		ON hd.SOHD = ct.SOHD JOIN SANPHAM sp
		ON ct.MASP = sp.MASP
		WHERE kh.HOTEN = 'Nguyen Van A'
		AND MONTH(hd.NGHD) = 10
		AND YEAR(hd.NGHD) = 2006



-- 11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT hd.SOHD , sp.MASP
FROM HOADON hd JOIN CTHD ct
ON hd.SOHD = ct.SOHD JOIN SANPHAM sp
ON sp.MASP = ct.MASP
WHERE sp.MASP = 'BB01' OR sp.MASP = 'BB02'