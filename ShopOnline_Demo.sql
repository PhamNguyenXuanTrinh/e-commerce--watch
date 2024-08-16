USE [master]
GO
/****** Object:  Database [ShopOnline_Demo]    Script Date: 1/9/2022 10:15:20 AM ******/
CREATE DATABASE [ShopOnline_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopOnline_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopOnline_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopOnline_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopOnline_Demo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopOnline_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline_Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopOnline_Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopOnline_Demo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopOnline_Demo] SET QUERY_STORE = OFF
GO
USE [ShopOnline_Demo]
GO
/****** Object:  User [readdata]    Script Date: 1/9/2022 10:15:20 AM ******/
CREATE USER [readdata] FOR LOGIN [readdata] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [readdata]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[maBV] [varchar](10) NOT NULL,
	[tenBV] [nvarchar](250) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[loaiTin] [nvarchar](30) NULL,
	[noiDung] [nvarchar](4000) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[daDuyet] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CtDonHang]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtDonHang](
	[soDH] [varchar](10) NOT NULL,
	[maSP] [varchar](10) NOT NULL,
	[soLuong] [int] NULL,
	[giaBan] [bigint] NULL,
	[giamGia] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC,
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[soDH] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[ngayDat] [datetime] NULL,
	[daKichHoat] [bit] NULL,
	[ngayGH] [datetime] NULL,
	[diaChiGH] [nvarchar](250) NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [varchar](10) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[soDT] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[ngaySinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[maLoai] [int] IDENTITY(1,1) NOT NULL,
	[tenLoai] [nvarchar](88) NOT NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [varchar](10) NOT NULL,
	[tenSP] [nvarchar](500) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[maLoai] [int] NOT NULL,
	[noiDung] [nvarchar](4000) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[dvt] [nvarchar](32) NULL,
	[daDuyet] [bit] NULL,
	[giaBan] [int] NULL,
	[giamGia] [int] NULL,
	[nhaSanXuat] [nvarchar](168) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/9/2022 10:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[taiKhoan] [varchar](20) NOT NULL,
	[matKhau] [varchar](100) NULL,
	[hoDem] [nvarchar](50) NULL,
	[tenTV] [nvarchar](30) NOT NULL,
	[ngaysinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[soDT] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[trangThai] [bit] NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[taiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (1, N'Đồng hồ nam', N'')
INSERT [dbo].[LoaiSP] ([maLoai], [tenLoai], [ghiChu]) VALUES (2, N'Đồng hồ nữ', N'')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'10NOTEP256', N'ĐỒNG HỒ CALVIN KLEIN K2G2714X', N'/Asset/Images/sanPham/DongHoNam1.jpg', N'Mẫu Calvin Klein đôi vỏ máy pin mạ bạc kiểu dáng mỏng trẻ trung chỉ 7mm, phối cùng bộ dây da phiên bản da trơn.', CAST(N'2021-11-30T09:51:50.637' AS DateTime), 1, N'', N'admin', N'Cái', 1, 920000, 0, N'Calvin Klein ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1506749851', N'ĐỒNG HỒ CLAUDE BERNARD 01002.357RM.AIR', N'/Asset/Images/sanPham/DongHoNam3.jpg', N'Là Loại đồng hồ đẹp', CAST(N'2021-11-30T09:51:50.617' AS DateTime), 1, N'', N'admin', N'Cái', 1, 6850000, 8, N'CLASSIC CHRONOGRAPH

')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'1651954962', N'ĐỒNG HỒ CLAUDE BERNARD 01002.3M.AIN', N'/Asset/Images/sanPham/DongHoNam4.jpg', N'Là đồng hồ được ưa chuộn nhất', CAST(N'2021-11-30T09:51:50.633' AS DateTime), 1, N'', N'admin', N'Chiếc', 1, 55000, 0, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'2759614408', N'ĐỒNG HỒ CLAUDE BERNARD 01002.357RM.AIR', N'/Asset/Images/sanPham/DongHoNam6.jpg', N'Đẹp sang trọng', CAST(N'2021-11-30T09:51:50.617' AS DateTime), 1, N'', N'admin', N'Cái', 0, 439000, 10, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'3356017108', N'ĐỒNG HỒ CLAUDE BERNARD 01002.3.NIN', N'/Asset/Images/sanPham/DongHoNam7.jpg', N'Đẹp sang trọng', CAST(N'2021-11-30T09:51:50.630' AS DateTime), 1, N'', N'admin', N'Bộ', 1, 18900000, 0, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'4062373305', N'ĐỒNG HỒ CLAUDE BERNARD 01002.357RM.AIR', N'/Asset/Images/sanPham/DongHoNam8.jpg', N'Đẹp sang trọng', CAST(N'2021-11-30T09:51:50.613' AS DateTime), 1, N'', N'admin', N'Cái', 1, 699000, 10, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'4494738964', N'Đồng Hồ Nữ JA-958B Julius Hàn Quốc 3 Máy', N'/Asset/Images/sanPham/DongHoNu1.jpg', N'Là loại đồng hồ đẹp', CAST(N'2021-11-30T09:51:50.633' AS DateTime), 2, N'', N'admin', N'Cái', 1, 105000, 0, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'5206554981', N'Đồng Hồ Nữ JS-009LC Julius Star ', N'/Asset/Images/sanPham/DongHoNu2.jpg', N'Khung nắn có độ cong lý tưởng cho người dùng một cách tự nhiên. Khung nắn có thể chạm tới tối đa các huyệt đạo có trên lưng, đả thông huyệt, tăng cường tuần hoàn máu, làm bệnh mau thuyên giảm.
						Hỗ trợ định hình cột sống về dạng tự nhiên ban đầu mà không cần phải tác động ngoại lực. Hỗ trợ giảm đau một cách tự nhiên tại nhà.', CAST(N'2021-11-30T09:51:50.630' AS DateTime), 2, N'', N'admin', N'Bộ', 1, 82000, 0, N'OEM')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'5761552897', N'Đồng Hồ Thông Minh AMA Watch S2', N'/Asset/Images/sanPham/DongHoNu4.jpg', N'Đồng Hồ Thông Minh AMA Watch S2 thiết bị tầm trung nhưng sở hữu nhiều công nghệ và và tính năng hiện đại. 
					  Một lựa chọn tuyệt vời dành cho những ai đang tìm kiếm 1 chiếc đồng hồ thông minh, với mức giá hợp lý.', CAST(N'2021-11-30T09:51:50.640' AS DateTime), 2, N'', N'admin', N'Cái', 1, 1387000, 0, N'AMA')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6075086733', N'Đồng Hồ Nữ JA-1339B Julius Hàn Quốc', N'/Asset/Images/sanPham/DongHoNu5.jpg', N'Áo thể thao Body Compression Fitme cao cấp chuyên nghiệp dành cho những ai có nhu cầu luyện tập với cường độ cao
						Phù hợp cho các môn thể thao tập gym, bóng rổ, bóng đá, bóng chuyền, giữ nhiệt. 
						Quần chất co dãn cao, fit cơ thể, tôn dáng người', CAST(N'2021-11-30T09:51:50.627' AS DateTime), 2, N'', N'admin', N'Bộ', 1, 152000, 0, N'Fitme')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6121736387', N'Đồng Hồ Unisex JA-808MC Julius Hàn Quốc Dây', N'/Asset/Images/sanPham/DongHoNu6.jpg', N'Đế sạc Apple này được chế tác tinh xảo từ nhôm bền, thảm cao su chống trượt ở phía dưới giúp tăng cường hoàn hảo sự ổn định của nó.
					  Đế Sạc Không Dây Đa Chức Năng Cho Apple Watch & Iphone & AirPods US02- Hàng chính hãng', CAST(N'2021-11-30T09:51:50.640' AS DateTime), 2, N'', N'admin', N'Bộ', 1, 490000, 0, N'USLION')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [hinhDD], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [dvt], [daDuyet], [giaBan], [giamGia], [nhaSanXuat]) VALUES (N'6681948644', N'Đồng Hồ Nữ Julius Hàn Quốc Dây', N'/Asset/Images/sanPham/DongHoNu7.jpg', N'Mẫu váy nhẹ nhàng tiểu thư cho các nàng bánh bèo vừa về kho Lê Sang nha!. Mã mới xưởng bên mới thiết kế chào hàng các nàng luôn ạ.
						+ Thiết kế cổ tròn phối nơ, đuôi cá.
						+ Vải đũi xốp trắng mịn dày dặn.', CAST(N'2021-11-30T09:51:50.630' AS DateTime), 2, N'', N'admin', N'Cái', 1, 109000, 0, N'Lê Sang')
GO
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'admin', N'A6-65-A4-59-20-42-2F-9D-41-7E-48-67-EF-DC-4F-B8-A0-4A-1F-3F-FF-1F-A0-7E-99-8E-86-F7-F7-A2-7A-E3', N'Nguyễn Quang', N'Hưng', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1, N'935694223', N'nqhung@gmail.com', N'472 CMT8, P.11,Q3, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'minh', N'BA-78-16-BF-8F-01-CF-EA-41-41-40-DE-5D-AE-22-23-B0-03-61-A3-96-17-7A-9C-B4-10-FF-61-F2-00-15-AD', N'Nguyễn Minh', N'Quang', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1, N'935694223', N'minhminh@gmail.com', N'472 CMT8, P.11,Q3, TP.HCM', 1, N'')
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((1)) FOR [daKichHoat]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[LoaiSP] ADD  DEFAULT ('') FOR [ghiChu]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [hinhDD]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [ndTomTat]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [ngayDang]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [noiDung]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (N'Cái') FOR [dvt]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [giaBan]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [giamGia]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('') FOR [nhaSanXuat]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [trangThai]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([soDH])
REFERENCES [dbo].[DonHang] ([soDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiSP] ([maLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([giamGia]>=(0) AND [giamGia]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [ShopOnline_Demo] SET  READ_WRITE 
GO
