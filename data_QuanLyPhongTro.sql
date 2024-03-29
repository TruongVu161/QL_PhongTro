USE [QuanLyPhongTro]
GO
/****** Object:  DatabaseRole [QuanTriVien]    Script Date: 12/22/2022 10:32:13 PM ******/
CREATE ROLE [QuanTriVien]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaHoaDon]()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MaHoaDon) FROM HOADON) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHoaDon, 3)) FROM HOADON
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 10 THEN 'HDon00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 10 THEN 'HDon0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHopDong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaHopDong]()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MaHopDong) FROM HOPDONG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHopDong, 3)) FROM HOPDONG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 10 THEN 'HDong00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 10 THEN 'HDong0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaKhachThue]()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MaKhachThue) FROM KHACHTHUETRO) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaKhachThue, 3)) FROM KHACHTHUETRO
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 10 THEN 'Khach00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 10 THEN 'Khach0' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[fu_getMaPhongTro]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fu_getMaPhongTro] (@TaiKhoan_KH VARCHAR(30))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @getMaPhongTro VARCHAR(10)
	SET @getMaPhongTro = (SELECT MaPhongTro FROM HOPDONG WHERE TaiKhoan_KH = @TaiKhoan_KH)
	RETURN @getMaPhongTro
END
GO
/****** Object:  Table [dbo].[PHONGTRO]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGTRO](
	[MaPhongTro] [varchar](10) NOT NULL,
	[ToaNha] [varchar](1) NOT NULL,
	[Tang] [varchar](1) NOT NULL,
	[PhongSo] [varchar](1) NOT NULL,
	[GiaThue] [int] NOT NULL,
	[SoLuongMAX] [smallint] NOT NULL,
	[SoLuongHienTai] [smallint] NULL,
	[TrangThaiPhong] [varchar](1) NULL,
	[MoTaPhong] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhongTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[DS_PhongTrong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[DS_PhongTrong]()
RETURNS TABLE
AS
	RETURN 
		SELECT MaPhongTro, ToaNha, Tang, PhongSo, GiaThue, SoLuongMAX, MoTaPhong
		FROM PHONGTRO
		WHERE TrangThaiPhong = 'N'
GO
/****** Object:  UserDefinedFunction [dbo].[DS_AllPhong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[DS_AllPhong]()
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM PHONGTRO
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[TaiKhoan_KH] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[HoTenKH] [nvarchar](30) NOT NULL,
	[CCCD] [bigint] NULL,
	[SDT] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoan_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[DS_AllKhachHang]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[DS_AllKhachHang]()
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM KHACHHANG
--
GO
/****** Object:  Table [dbo].[HOPDONG]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOPDONG](
	[MaHopDong] [varchar](10) NOT NULL,
	[MaPhongTro] [varchar](10) NULL,
	[TaiKhoan_KH] [varchar](30) NULL,
	[NgayKyHD] [date] NULL,
	[NgayKetThucHD] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[DS_AllHopDong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Danh sách tất cả Hợp đồng
CREATE   FUNCTION [dbo].[DS_AllHopDong]()
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM HOPDONG
--
GO
/****** Object:  Table [dbo].[KHACHTHUETRO]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHTHUETRO](
	[MaKhachThue] [varchar](10) NOT NULL,
	[MaPhongTro] [varchar](10) NULL,
	[HoTenKhachThue] [nvarchar](30) NOT NULL,
	[CCCD] [bigint] NULL,
	[SDT] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[DS_AllKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Danh sách tất cả Khách thuê
CREATE   FUNCTION [dbo].[DS_AllKhachThue]()
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM KHACHTHUETRO
--
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHoaDon] [varchar](10) NOT NULL,
	[MaPhongTro] [varchar](10) NULL,
	[NgayHoaDon] [date] NULL,
	[TienDien] [int] NOT NULL,
	[TienNuoc] [int] NOT NULL,
	[PhiDichVu] [int] NOT NULL,
	[TongTien] [int] NULL,
	[TrangThaiHD] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[DS_AllHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Danh sách tất cả Hóa đơn
CREATE   FUNCTION [dbo].[DS_AllHoaDon]()
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM HOADON
--
GO
/****** Object:  UserDefinedFunction [dbo].[fu_DSKhachThue_Phong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fu_DSKhachThue_Phong] (@TaiKhoan_KH VARCHAR(30))
RETURNS TABLE
AS
	RETURN
		SELECT MaKhachThue, HoTenKhachThue, CCCD, SDT
		FROM HOPDONG JOIN KHACHTHUETRO ON HOPDONG.MaPhongTro = KHACHTHUETRO.MaPhongTro
		WHERE TaiKhoan_KH = @TaiKhoan_KH
GO
/****** Object:  UserDefinedFunction [dbo].[fu_DSHoaDon_Phong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fu_DSHoaDon_Phong] (@TaiKhoan_KH VARCHAR(30))
RETURNS TABLE
AS
	RETURN
		SELECT MaHoaDon, NgayHoaDon, TienDien, TienNuoc, PhiDichVu, TongTien, TrangThaiHD
		FROM HOPDONG JOIN HOADON ON HOPDONG.MaPhongTro = HOADON.MaPhongTro
		WHERE TaiKhoan_KH = @TaiKhoan_KH
GO
/****** Object:  UserDefinedFunction [dbo].[fu_ChiTietPhong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fu_ChiTietPhong] (@TaiKhoan_KH VARCHAR(30))
RETURNS TABLE
AS
	RETURN
		SELECT PHONGTRO.MaPhongTro, ToaNha, Tang, PhongSo, GiaThue, SoLuongMAX, MoTaPhong
		FROM HOPDONG JOIN PHONGTRO ON HOPDONG.MaPhongTro = PHONGTRO.MaPhongTro
		WHERE TaiKhoan_KH = @TaiKhoan_KH
GO
INSERT [dbo].[HOADON] ([MaHoaDon], [MaPhongTro], [NgayHoaDon], [TienDien], [TienNuoc], [PhiDichVu], [TongTien], [TrangThaiHD]) VALUES (N'HDon001', N'B44', CAST(N'2020-02-02' AS Date), 50000, 100000, 30000, 3180000, N'Y')
INSERT [dbo].[HOADON] ([MaHoaDon], [MaPhongTro], [NgayHoaDon], [TienDien], [TienNuoc], [PhiDichVu], [TongTien], [TrangThaiHD]) VALUES (N'HDon002', N'B44', CAST(N'2020-03-03' AS Date), 50000, 120000, 50000, 3220000, N'N')
INSERT [dbo].[HOADON] ([MaHoaDon], [MaPhongTro], [NgayHoaDon], [TienDien], [TienNuoc], [PhiDichVu], [TongTien], [TrangThaiHD]) VALUES (N'HDon003', N'A55', CAST(N'2020-03-03' AS Date), 150000, 320000, 50000, 3020000, N'N')
INSERT [dbo].[HOADON] ([MaHoaDon], [MaPhongTro], [NgayHoaDon], [TienDien], [TienNuoc], [PhiDichVu], [TongTien], [TrangThaiHD]) VALUES (N'HDon004', N'C22', CAST(N'2022-01-11' AS Date), 200000, 300000, 100000, 6600000, N'Y')
INSERT [dbo].[HOADON] ([MaHoaDon], [MaPhongTro], [NgayHoaDon], [TienDien], [TienNuoc], [PhiDichVu], [TongTien], [TrangThaiHD]) VALUES (N'HDon005', N'C22', CAST(N'2022-01-12' AS Date), 500000, 500000, 200000, 7200000, N'N')
GO
INSERT [dbo].[HOPDONG] ([MaHopDong], [MaPhongTro], [TaiKhoan_KH], [NgayKyHD], [NgayKetThucHD]) VALUES (N'HDong001', N'B44', N'khachhang02', CAST(N'2022-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[HOPDONG] ([MaHopDong], [MaPhongTro], [TaiKhoan_KH], [NgayKyHD], [NgayKetThucHD]) VALUES (N'HDong002', N'A55', N'khachhang03', CAST(N'2022-06-06' AS Date), CAST(N'2023-06-06' AS Date))
INSERT [dbo].[HOPDONG] ([MaHopDong], [MaPhongTro], [TaiKhoan_KH], [NgayKyHD], [NgayKetThucHD]) VALUES (N'HDong003', N'C22', N'truongvu2001', CAST(N'2022-01-10' AS Date), CAST(N'2023-01-10' AS Date))
INSERT [dbo].[HOPDONG] ([MaHopDong], [MaPhongTro], [TaiKhoan_KH], [NgayKyHD], [NgayKetThucHD]) VALUES (N'HDong004', N'B55', N'vulinh2001', CAST(N'2022-01-10' AS Date), CAST(N'2023-01-06' AS Date))
GO
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'khachhang01', N'123456', N'Nguyễn Văn Anh', 111222333, 123412344)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'khachhang02', N'123456', N'Nguyễn Thị Châu', 444555666, 456456456)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'khachhang03', N'123456', N'Trần Văn Dinh', 777888999, 789789789)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'khnguyenhong2', N'123456', N'Trần Thị Hồng', 809070123456, 195375648)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'khvanchinh3', N'123456', N'Hồ Văn Chính', 258369147159, 963852741)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'truongvu2001', N'123456', N'Nguyễn Trường Vũ', 999888777000, 397979790)
INSERT [dbo].[KHACHHANG] ([TaiKhoan_KH], [MatKhau], [HoTenKH], [CCCD], [SDT]) VALUES (N'vulinh2001', N'123456', N'Nguyễn Vũ Linh', 666555444999, 148635792)
GO
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach001', N'B44', N'Nguyễn Thị Châu', 906030888777, 456456456)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach002', N'A55', N'Trần Văn Dinh', 777888999, 789789789)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach003', N'A55', N'Đinh Thị Hồng', 159159159, 1591591459)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach004', N'A55', N'Lê Văn Tú', 357357357, 357357357)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach005', N'C22', N'Nguyễn Trường Vũ', 999888777000, 397979790)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach006', N'C22', N'Trần Thanh Minh', 704010805020, 759486321)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach007', N'C22', N'Lê Khương', 906030605040, 624531987)
INSERT [dbo].[KHACHTHUETRO] ([MaKhachThue], [MaPhongTro], [HoTenKhachThue], [CCCD], [SDT]) VALUES (N'Khach008', N'B55', N'Nguyễn Vũ Linh', 666555444999, 148635792)
GO
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A11', N'A', N'1', N'1', 1200000, 1, 0, N'N', N'1 phòng ngủ, 1 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A12', N'A', N'1', N'2', 1400000, 1, 0, N'N', N'1 phòng ngủ, 1 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A13', N'A', N'1', N'3', 1600000, 1, 0, N'N', N'1 phòng ngủ, 1 tolet, có ban công')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A22', N'A', N'2', N'2', 2000000, 2, 0, N'N', N'1 phòng ngủ, 1 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A23', N'A', N'2', N'3', 2200000, 2, 0, N'N', N'1 phòng ngủ, 1 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A33', N'A', N'3', N'3', 300000, 2, 0, N'N', N'2 phòng ngủ, 2 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A44', N'A', N'4', N'4', 3500000, 3, 0, N'N', N'2 phòng ngủ, 2 tolet, có ban công')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'A55', N'A', N'5', N'5', 5200000, 4, 3, N'Y', N'2 phòng ngủ có gác lửng, 2 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'B22', N'B', N'2', N'2', 1500000, 1, 0, N'N', N'1 phòng ngủ, 1 tolet, có ban công')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'B33', N'B', N'3', N'3', 2000000, 2, 0, N'N', N'1 phòng ngủ có gác lửng, 1 tolet')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'B44', N'B', N'4', N'4', 2500000, 1, 1, N'Y', N'(VIP) 1 phòng ngủ, 1 tolet, FULL nội thất')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'B55', N'B', N'5', N'5', 3000000, 1, 1, N'Y', N'(VIP) 1 phòng ngù, 1 tolet, có ban công, FULL nội thất')
INSERT [dbo].[PHONGTRO] ([MaPhongTro], [ToaNha], [Tang], [PhongSo], [GiaThue], [SoLuongMAX], [SoLuongHienTai], [TrangThaiPhong], [MoTaPhong]) VALUES (N'C22', N'C', N'2', N'2', 6000000, 4, 3, N'Y', N'2 phòng ngủ có gác lửng, 2 tolet')
GO
ALTER TABLE [dbo].[HOADON] ADD  CONSTRAINT [IDHoaDon]  DEFAULT ([dbo].[AUTO_MaHoaDon]()) FOR [MaHoaDon]
GO
ALTER TABLE [dbo].[HOPDONG] ADD  CONSTRAINT [IDHopDong]  DEFAULT ([dbo].[AUTO_MaHopDong]()) FOR [MaHopDong]
GO
ALTER TABLE [dbo].[KHACHTHUETRO] ADD  CONSTRAINT [IDKhachThue]  DEFAULT ([dbo].[AUTO_MaKhachThue]()) FOR [MaKhachThue]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [HoaDon_PhongTro] FOREIGN KEY([MaPhongTro])
REFERENCES [dbo].[PHONGTRO] ([MaPhongTro])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [HoaDon_PhongTro]
GO
ALTER TABLE [dbo].[HOPDONG]  WITH CHECK ADD  CONSTRAINT [HD_PhongTro] FOREIGN KEY([MaPhongTro])
REFERENCES [dbo].[PHONGTRO] ([MaPhongTro])
GO
ALTER TABLE [dbo].[HOPDONG] CHECK CONSTRAINT [HD_PhongTro]
GO
ALTER TABLE [dbo].[HOPDONG]  WITH CHECK ADD  CONSTRAINT [HD_TK] FOREIGN KEY([TaiKhoan_KH])
REFERENCES [dbo].[KHACHHANG] ([TaiKhoan_KH])
GO
ALTER TABLE [dbo].[HOPDONG] CHECK CONSTRAINT [HD_TK]
GO
ALTER TABLE [dbo].[KHACHTHUETRO]  WITH CHECK ADD  CONSTRAINT [KhachThue_PhongTro] FOREIGN KEY([MaPhongTro])
REFERENCES [dbo].[PHONGTRO] ([MaPhongTro])
GO
ALTER TABLE [dbo].[KHACHTHUETRO] CHECK CONSTRAINT [KhachThue_PhongTro]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_CapNhatHoaDon]	@MaHoaDon VARCHAR(10), 
										@MaPhongTro VARCHAR(10),
										@NgayHoaDon DATE,
										@TienDien INT,
										@TienNuoc INT,
										@PhiDichVu INT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TongTien INT
			SET @TongTien = (SELECT GiaThue FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro) + @TienDien + @TienNuoc + @PhiDichVu

			UPDATE HOADON
			SET NgayHoaDon = @NgayHoaDon, TienDien = @TienDien, TienNuoc = @TienNuoc, PhiDichVu = @PhiDichVu, TongTien = @TongTien
			WHERE MaHoaDon = @MaHoaDon
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatHopDong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_CapNhatHopDong]	@MaHopDong VARCHAR(10),
										@NgayKyHD DATE,
										@NgayKetThucHD DATE
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			UPDATE HOPDONG
			SET NgayKyHD = @NgayKyHD, NgayKetThucHD = @NgayKetThucHD
			WHERE MaHopDong = @MaHopDong
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatKhachHang]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.2. Cập nhật Khách hàng
CREATE   PROC [dbo].[sp_CapNhatKhachHang] @TaiKhoan_KH VARCHAR(30), 
									  @MatKhau VARCHAR(30), 
									  @HoTenKH NVARCHAR(30),
									  @CCCD BIGINT,
									  @SDT BIGINT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			UPDATE KHACHHANG
			SET MatKhau = @MatKhau, HoTenKH = @HoTenKH, CCCD = @CCCD, SDT =@SDT
			WHERE TaiKhoan_KH = @TaiKhoan_KH
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_CapNhatKhachThue] @MaKhachThue VARCHAR(10),
										 @HoTenKhachThue NVARCHAR(30),
										 @CCCD BIGINT,
										 @SDT BIGINT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			UPDATE KHACHTHUETRO
			SET HoTenKhachThue = @HoTenKhachThue, CCCD = @CCCD, SDT = @SDT
			WHERE MaKhachThue = @MaKhachThue
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatPhongTro]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_CapNhatPhongTro] @MaPhongTro VARCHAR(10),
										@GiaThue INT,
										@SoLuongMAX SMALLINT,
										@MoTaPhong NVARCHAR(100)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			UPDATE PHONGTRO 
			SET GiaThue = @GiaThue, SoLuongMAX = @SoLuongMAX, MoTaPhong = @MoTaPhong
			WHERE MaPhongTro = @MaPhongTro
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietHopDong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 3.1.3.10. Xem chi tiết hợp đồng
CREATE   PROC [dbo].[sp_ChiTietHopDong] @MaHopDong VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM HOPDONG WHERE MaHopDong = @MaHopDong)
				BEGIN
					RAISERROR('Hợp đồng này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					SELECT *
					FROM HOPDONG
					WHERE MaHopDong = @MaHopDong
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietPhongTro]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.6. Xem chi tiết phòng trọ
CREATE   PROC [dbo].[sp_ChiTietPhongTro] @MaPhongTro VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Phòng này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					SELECT *
					FROM PHONGTRO 
					WHERE MaPhongTro = @MaPhongTro
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_DangNhap] @TaiKhoan_KH VARCHAR(30),
								 @MatKhau VARCHAR(30)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN 
		BEGIN TRY
			IF (@TaiKhoan_KH = 'admin' AND @MatKhau = 'admin')
				SELECT 0 AS code
			ELSE IF EXISTS (SELECT * FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH AND MatKhau = @MatKhau)
				SELECT 1 as code
			ELSE 
				SELECT 2 as code
		END TRY 
		BEGIN CATCH 
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThanhToanHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.19. Thanh toán Hóa đơn
CREATE   PROC [dbo].[sp_ThanhToanHoaDon] @MaHoaDon VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM HOADON  WHERE MaHoaDon = @MaHoaDon)
				BEGIN
					RAISERROR('Không tìm thấy hóa đơn',16,1)
					RETURN
				END
			ELSE
				BEGIN				
					UPDATE HOADON
					SET TrangThaiHD = 'Y'
					WHERE MaHoaDon = @MaHoaDon
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.15. Tạo hóa đơn thanh toán
CREATE   PROC [dbo].[sp_ThemHoaDon] @MaPhongTro VARCHAR(10), 
								   @NgayHoaDon DATE,
								   @TienDien INT,
								   @TienNuoc INT,
								   @PhiDichVu INT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO  WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Không tìm thấy phòng trọ',16,1)
					RETURN
				END
			ELSE
				BEGIN
					DECLARE @TongTien INT
					SET @TongTien = (SELECT GiaThue FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro) + @TienDien + @TienNuoc + @PhiDichVu

					INSERT INTO HOADON (MaPhongTro, NgayHoaDon, TienDien, TienNuoc, PhiDichVu, TongTien, TrangThaiHD)
					VALUES (@MaPhongTro, @NgayHoaDon, @TienDien, @TienNuoc, @PhiDichVu, @TongTien, 'N')
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHopDong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.8. Lập hợp đồng
CREATE   PROC [dbo].[sp_ThemHopDong]	@MaPhongTro VARCHAR(10),
									@TaiKhoan_KH NVARCHAR(30),
									@NgayKyHD DATE,
									@NgayKetThucHD DATE
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH)
				BEGIN
					RAISERROR('Khách hàng không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
						BEGIN
							RAISERROR('Phòng không tồn tại',16,1)
							RETURN
						END
					ELSE
						BEGIN
							DECLARE @HoTenKhachThue NVARCHAR(30), @CCCD BIGINT, @SDT BIGINT
							SET @HoTenKhachThue = (SELECT HoTenKH FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH)
							SET @CCCD = (SELECT CCCD FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH)
							SET @SDT = (SELECT SDT FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH)
							
							INSERT INTO HOPDONG (MaPhongTro, TaiKhoan_KH, NgayKyHD, NgayKetThucHD)
							VALUES (@MaPhongTro, @TaiKhoan_KH, @NgayKyHD, @NgayKetThucHD)
							
							INSERT INTO KHACHTHUETRO(MaPhongTro, HoTenKhachThue, CCCD, SDT)
							VALUES (@MaPhongTro, @HoTenKhachThue, @CCCD, @SDT)

							UPDATE PHONGTRO 
							SET SoLuongHienTai = '1' 
							WHERE MaPhongTro = @MaPhongTro

							UPDATE PHONGTRO
							SET TrangThaiPhong = 'Y'
							WHERE MaPhongTro = @MaPhongTro
						END
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhachHang]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_ThemKhachHang] @TaiKhoan_KH VARCHAR(30), 
									  @MatKhau VARCHAR(30), 
									  @HoTenKH NVARCHAR(30),
									  @CCCD BIGINT,
									  @SDT BIGINT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE TaiKhoan_KH = @TaiKhoan_KH)
				BEGIN
					IF (@MatKhau = '')
						BEGIN
							RAISERROR('Mật khẩu không được để trống',16,1)
							RETURN
						END
					ELSE
						BEGIN
							INSERT INTO KHACHHANG   
							VALUES(@TaiKhoan_KH, @MatKhau, @HoTenKH, @CCCD, @SDT)
						END				
				END
			 ELSE
				BEGIN
					RAISERROR('Tài khoản đã tồn tại',16,1)
					RETURN
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 3.1.3.11. Thêm khách thuê
CREATE   PROC [dbo].[sp_ThemKhachThue] @MaPhongTro VARCHAR(10),
									  @HoTenKhachThue NVARCHAR(30),
									  @CCCD BIGINT,
									  @SDT BIGINT
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Không tìm thấy phòng trọ',16,1)
					RETURN
				END
			ELSE 
				BEGIN
					IF ((SELECT SoLuongHienTai FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro) 
					>= (SELECT SoLuongMax FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro))
						BEGIN
							RAISERROR('Số lượng khách thuê đã tối đa',16,1)
							RETURN							
						END
					ELSE
						BEGIN
							INSERT INTO KHACHTHUETRO (MaPhongTro, HoTenKhachThue, CCCD, SDT)
							VALUES (@MaPhongTro, @HoTenKhachThue, @CCCD, @SDT)
							UPDATE PHONGTRO
							SET SoLuongHienTai = SoLuongHienTai + 1
							WHERE MaPhongTro = @MaPhongTro
						END
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhongTro]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.4. Thêm phòng trọ
CREATE   PROC [dbo].[sp_ThemPhongTro] @ToaNha VARCHAR(1),
									 @Tang VARCHAR(1),
									 @PhongSo VARCHAR(1),
									 @GiaThue INT,
									 @SoLuongMAX SMALLINT,
									 @MoTaPhong NVARCHAR(100)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE ToaNha = @ToaNha AND Tang = @Tang AND PhongSo = @PhongSo)
				BEGIN
					DECLARE @MaPhongTro VARCHAR(10)
					SET @MaPhongTro = @ToaNha+@Tang+@PhongSo
					INSERT INTO PHONGTRO
					VALUES (@MaPhongTro, @ToaNha, @Tang, @PhongSo, @GiaThue, @SoLuongMAX, '0', 'N', @MoTaPhong)
				END	
			ELSE
				BEGIN
					RAISERROR('Phòng này đã tồn tại',16,1)
					RETURN
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongTinHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.17. Xem thông tin hóa đơn của phòng trọ
CREATE   PROC [dbo].[sp_ThongTinHoaDon] @MaPhongTro VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Phòng này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					SELECT MaHoaDon, NgayHoaDon, TienDien, TienNuoc, PhiDichVu, TongTien, TrangThaiHD
					FROM HOADON JOIN PHONGTRO ON HOADON.MaPhongTro = PHONGTRO.MaPhongTro
					WHERE HOADON.MaPhongTro = @MaPhongTro
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongTinKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.13. Xem thông tin khách thuê trong phòng trọ
CREATE   PROC [dbo].[sp_ThongTinKhachThue] @MaPhongTro VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Phòng này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					SELECT MaKhachThue, HoTenKhachThue, CCCD, SDT
					FROM KHACHTHUETRO JOIN PHONGTRO ON KHACHTHUETRO.MaPhongTro = PHONGTRO.MaPhongTro
					WHERE KHACHTHUETRO.MaPhongTro = @MaPhongTro
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_TraPhong]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.20 Trả phòng
CREATE   PROC [dbo].[sp_TraPhong] @MaPhongTro VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF EXISTS (SELECT * FROM HOADON  WHERE MaPhongTro = @maphongtro AND TrangThaiHD = 'N')
				BEGIN
					RAISERROR('Phòng này có hóa đơn chưa thanh toán, không thể trả phòng',16,1)
					RETURN
				END
			ELSE
				BEGIN
					DELETE FROM HOADON WHERE MaPhongTro = @MaPhongTro
					DELETE FROM KHACHTHUETRO WHERE MaPhongTro = @MaPhongTro
					DELETE FROM HOPDONG WHERE MaPhongTro = @MaPhongTro

					UPDATE PHONGTRO
					SET SoLuongHienTai = 0
					WHERE MaPhongTro = @MaPhongTro

					UPDATE PHONGTRO
					SET TrangThaiPhong = 'N'
					WHERE MaPhongTro = @MaPhongTro
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaHoaDon]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.18. Xóa hóa đơn
CREATE   PROC [dbo].[sp_XoaHoaDon] @MaHoaDon VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM HOADON WHERE MaHoaDon = @MaHoaDon)
				BEGIN
					RAISERROR('Hóa đơn này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					DELETE FROM HOADON WHERE MaHoaDon = @MaHoaDon
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhachHang]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.3. Xóa tài khoản khách hàng
CREATE   PROC [dbo].[sp_XoaKhachHang] @TaiKhoan_KH VARCHAR(30)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN 
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM HOPDONG WHERE TaiKhoan_KH = @TaiKhoan_KH)
				BEGIN
					DELETE FROM KHACHHANG
					WHERE TaiKhoan_KH = @TaiKhoan_KH
				END
			ELSE
				BEGIN
					RAISERROR('Khách hàng đang ở trọ, không thể xóa',16,1)
					RETURN
				END
		END TRY 
		BEGIN CATCH 
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhachThue]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.14. Xóa khách thuê
CREATE   PROC [dbo].[sp_XoaKhachThue] @MaKhachThue VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM KHACHTHUETRO WHERE MaKhachThue = @MaKhachThue)
				BEGIN
					RAISERROR('Khách thuê không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					UPDATE PHONGTRO
					SET SoLuongHienTai = SoLuongHienTai - 1
					WHERE MaPhongTro = (SELECT MaPhongTro FROM KHACHTHUETRO WHERE MaKhachThue = @MaKhachThue)

					DELETE FROM KHACHTHUETRO
					WHERE MaKhachThue = @MaKhachThue
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
--
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaPhongTro]    Script Date: 12/22/2022 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- 5.1.3.7. Xóa phòng trọ
CREATE   PROC [dbo].[sp_XoaPhongTro] @MaPhongTro VARCHAR(10)
AS
BEGIN 
	SET XACT_ABORT ON
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro)
				BEGIN
					RAISERROR('Phòng này không tồn tại',16,1)
					RETURN
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT * FROM HOADON  WHERE MaPhongTro = @MaPhongTro AND TrangThaiHD = 'N')
						BEGIN
							RAISERROR('Phòng này có hóa đơn chưa thanh toán, không thể xóa',16,1)
							RETURN
						END
					ELSE
						BEGIN
							IF EXISTS (SELECT * FROM KHACHTHUETRO WHERE MaPhongTro = @MaPhongTro)
								BEGIN
									RAISERROR('Phòng này có khách thuê đang ở, không thể xóa',16,1)
									RETURN
								END
							ELSE
								BEGIN
									IF EXISTS (SELECT * FROM HOPDONG WHERE MaPhongTro = @MaPhongTro)
										BEGIN
											RAISERROR('Phòng này có hợp đồng thuê, không thể xóa',16,1)
											RETURN
										END
									ELSE
										BEGIN
											DELETE FROM PHONGTRO WHERE MaPhongTro = @MaPhongTro
										END
								END
						END
				END
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			DECLARE @ERRORMESSAGE VARCHAR(2000)
			SELECT @ERRORMESSAGE = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR (@ERRORMESSAGE,16,1)
		END CATCH
	COMMIT TRAN
END
----
GO
