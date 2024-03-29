DROP DATABASE SV;
CREATE DATABASE SV;
GO

USE SV
GO

CREATE TABLE MonHoc (
  MaMon nvarchar(5) PRIMARY KEY,
  TenMon nvarchar(255)
)

CREATE TABLE GiangVien (
  MaGV nvarchar(3) PRIMARY KEY,
  TenGV nvarchar(255),
  MatKhau nvarchar(255)
)

CREATE TABLE Lop (
  MaLop nvarchar(6) PRIMARY KEY,
  TenLop nvarchar(255)
)

CREATE TABLE SinhVien (
  MaSV nvarchar(6) PRIMARY KEY,
  HoSV nvarchar(255),
  TenSV nvarchar(255),
  MaLop nvarchar(6),
  
  FOREIGN KEY (MaLop) REFERENCES dbo.Lop(MaLop)
)

CREATE TABLE HocPhan (
  MaHP int IDENTITY(1,1) PRIMARY KEY,
  MaGV nvarchar(3),
  MaLop nvarchar(6),
  MaMon nvarchar(5),
  UNIQUE (MaMon, MaGV, MaLop),
  
  FOREIGN KEY (MaGV) REFERENCES dbo.GiangVien(MaGV),
  FOREIGN KEY (MaLop) REFERENCES dbo.Lop(MaLop),
  FOREIGN KEY (MaMon) REFERENCES dbo.MonHoc(MaMon)
)


CREATE TABLE Diem (
  MaDiem int IDENTITY(1,1) PRIMARY KEY,
  MaSV nvarchar(6),
  MaHP integer,
  GiaTri float,
  
  FOREIGN KEY (MaSV) REFERENCES dbo.SinhVien(MaSV),
  FOREIGN KEY (MaHP) REFERENCES dbo.HocPhan(MaHP)
)

INSERT INTO MonHoc VALUES
    ('CT101', N'Lập trình căn bản'),
    ('CT103', N'Cấu trúc dữ liệu'),
    ('CT251', N'Phát triển ứng dụng trên Windows')

INSERT INTO Lop VALUES
    ('K44-01', 'CNPM 01'),
    ('K44-02', 'CNPM 02'),
    ('K44-03', 'CNPM 03')
    
INSERT INTO GiangVien VALUES
    ('001', N'Nguyễn Văn Cường', '123'),
    ('002', N'Huỳnh Minh Phương', '123'),
    ('003', N'Thái Cẩm Nhung', '123')

INSERT INTO SinhVien VALUES
    ('B18001', N'Phạm Thị Bảo', N'Nhiên', 'K44-01'),
    ('B18002', N'Nguyễn Văn', N'An', 'K44-01'),
    ('B18003', N'Lê Hoài', N'Anh', 'K44-01'),
    ('B18004', N'Nguyễn Lâm Hoàng', N'Anh', 'K44-01'),
    ('B18005', N'Lê Minh', N'Bằng', 'K44-01'),
    ('B18006', N'Vương Thừa', N'Chấn', 'K44-02'),
    ('B18007', N'Cao Công', N'Danh', 'K44-02'),
    ('B18008', N'Trịnh Lê Long', N'Đức', 'K44-02'),
    ('B18009', N'Dương Lê Minh', N'Hậu', 'K44-02'),
    ('B18010', N'Nguyễn Vũ', N'Hoàng', 'K44-02'),
    ('B18011', N'Nguyễn Hoàng Thái', N'Học', 'K44-03'),
    ('B18012', N'Nguyễn Quốc', N'Huy', 'K44-03'),
    ('B18013', N'Võ Đoàn Gia', N'Huy', 'K44-03'),
    ('B18014', N'Vũ Thị Bích', N'Huyền', 'K44-03'),
    ('B18015', N'Hồ Việt', N'Hưng', 'K44-03')
    
INSERT INTO HocPhan (MaGV, MaMon, MaLop) VALUES
    ('001', 'CT101', 'K44-01'),
    ('001', 'CT101', 'K44-02'),
    ('001', 'CT103', 'K44-01'),
    ('001', 'CT103', 'K44-03'),
    ('002', 'CT101', 'K44-03'),
    ('002', 'CT103', 'K44-02'),
    ('003', 'CT251', 'K44-01'),
    ('003', 'CT251', 'K44-02'),
    ('003', 'CT251', 'K44-03')

SELECT * FROM HocPhan;    
SELECT DISTINCT m.MaMon AS MaMon, m.TenMon AS TenMon
	
	FROM MonHoc AS m JOIN HocPhan AS h ON m.MaMon = h.MaMon 
	JOIN Lop AS l ON l.malop = h.Malop WHERE h.MaGV = 001;
--SELECT DISTINCT m.MaMon AS MaMon, m.TenMon AS TenMon, " +
   --                 " h.malop as MaLop, h.tenlop as TenLop, h.mahp as mahp"+
   --            "FROM MonHoc AS m JOIN HocPhan AS h ON m.MaMon = h.MaMon " +
     --          "JOIN Lop AS l ON l.malop = h.Malop " +
      --         "WHERE h.MaGV = '" + MaGV + "';";
SELECT s.MaSV as 'MSSV', s.HoSV as 'Họ', s.TenSV as 'Tên', l.TenLop as 'Lớp',c.MaMon+ '-'+cast(c.MaHP as nvarchar) as 'Mã HP',
	p.GiaTri as 'Điểm'
	FROM SinhVien AS s JOIN HocPhan AS c ON c.MaLop = s.MaLop
						JOIN Lop AS l ON l.MaLop = c.MaLop
						LEFT JOIN Diem AS p ON (p.MaSV = s.MaSV AND p.MaHP = c.MaHP)
						WHERE c.MaMon = 'CT103' and c.MaGV='001';
SELECT s.MaSV as 'MSSV'
	FROM SinhVien AS s JOIN HocPhan AS c ON c.MaLop = s.MaLop
						JOIN Lop AS l ON l.MaLop = c.MaLop
						LEFT JOIN Diem AS p ON (p.MaSV = s.MaSV AND p.MaHP = c.MaHP)
						WHERE c.MaMon = 'CT101' and c.MaGV='001';						
select * from Diem;
delete from Diem where MaSV = 'b18002';
select * from hocphan where magv='001';
insert into Diem (MaHP, MaSV, GiaTri) values ('1','B18001' ,9);
select giatri from Diem where MaSV = 'B18001' and MaHP = '1';
delete from Diem where GiaTri = 9;