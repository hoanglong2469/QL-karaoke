USE [master]
GO
/****** Object:  Database [QLKaraoke]    Script Date: 10/31/2021 7:40:53 AM ******/
Create database QLKaraoke --Tạo CSDL cho phần mềm
CONTAINMENT = NONE
ON PRIMARY 
(
	NAME = QLyKaraoke,
	FILENAME = "D:\PTUD\QuanLyKaraoke\QLKara_data.mdf",
	SIZE = 8192KB , 
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 65536KB 
)
LOG ON 
(
	NAME = QLyKaraoke_log,
	FILENAME = "D:\PTUD\QuanLyKaraoke\QLKara_log.ldf",
	SIZE = 8192KB , 
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 65536KB 
)
WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLKaraoke] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKaraoke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKaraoke] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKaraoke] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKaraoke] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKaraoke] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKaraoke] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKaraoke] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKaraoke] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKaraoke] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKaraoke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKaraoke] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKaraoke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKaraoke] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKaraoke] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKaraoke] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKaraoke] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKaraoke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKaraoke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKaraoke] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKaraoke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKaraoke] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKaraoke] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKaraoke] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKaraoke] SET RECOVERY FULL 
GO
ALTER DATABASE [QLKaraoke] SET  MULTI_USER 
GO
ALTER DATABASE [QLKaraoke] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKaraoke] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKaraoke] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKaraoke] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLKaraoke] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLKaraoke', N'ON'
GO
ALTER DATABASE [QLKaraoke] SET QUERY_STORE = OFF
GO
USE [QLKaraoke]
GO
/****** Object:  Table [dbo].[Ca]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ca](
	[maCa] [nchar](10) NOT NULL,
	[tenCa] [nvarchar](50) NULL,
	[thoiGian] [time](7)  NULL,
	[luong] [money]  NULL,
 CONSTRAINT [PK_Ca] PRIMARY KEY CLUSTERED 
(
	[maCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonDatPhong]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatPhong](
	[maDonDatPhong] [nchar](10) NOT NULL,
	[maPhong] [nchar](10) NOT NULL,
	[thoiGianDat] [time](7) NULL,
 CONSTRAINT [PK_ChiTietDonDatPhong] PRIMARY KEY CLUSTERED 
(
	[maDonDatPhong] ASC,
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonDichVu]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonDichVu](
	[maHoaDon] [nchar](10) NOT NULL,
	[maDichVu] [nchar](10) NOT NULL,
	[soLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon_1] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonPhong]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonPhong](
	[maHoaDon] [nchar](10) NOT NULL,
	[maPhong] [nchar](10) NOT NULL,
	[gioVao] [time](7) NULL,
	[gioRa] [time](7) NULL,
 CONSTRAINT [PK_ChiTietHoaDonPhong] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[maDichVu] [nchar](10) NOT NULL,
	[tenDichVu] [nvarchar](50)  NULL,
	[giaTien] [money]  NULL,
	[maLoaiDV] [nchar](10) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[maDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatPhong]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatPhong](
	[maDonDatPhong] [nchar](10) NOT NULL,
	[ngayDat] [datetime] NULL,
	[maKhachHang] [nchar](10) NULL,
	[maNhanVien] [nchar](10) NULL,
 CONSTRAINT [PK_DonDatPhong] PRIMARY KEY CLUSTERED 
(
	[maDonDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [nchar](10) NOT NULL,
	[ngayLap] [nchar](10)  NULL,
	[trangThai] [bit]  NULL,
	[maKhachHang] [nchar](10) NULL,
	[maNhanVien] [nchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [nchar](10) NOT NULL,
	[tenKhachHang] [nvarchar](50) NULL,
	[diaChi] [nvarchar](255) NULL,
	[soDienThoai] [nchar](10) NULL,
	[soCMND] [nchar](12) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[maNhanVien] [nchar](10) NOT NULL,
	[maCa] [nchar](10) NOT NULL,
 CONSTRAINT [PK_LichLamViec] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC,
	[maCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[maLoaiDV] [nchar](10) NOT NULL,
	[tenLoaiDV] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[maLoaiDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[maLoaiPhong] [nchar](10) NOT NULL,
	[tenLoai] [nvarchar](50)  NULL,
	[moTa] [ntext]  NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[maLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanVien] [nchar](10) NOT NULL,
	[tenNhanVien] [nvarchar](50)  NULL,
	[gioiTinh] [nvarchar](10)  NULL,
	[ngaySinh] [date]  NULL,
	[dienThoai] [nchar](10)  NULL,
	[soCMND] [nchar](10)  NULL,
	[chucVu] [nvarchar](50)  NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maPhong] [nchar](10) NOT NULL,
	[tenPhong] [nvarchar](50)  NULL,
	[trinhTrang] [bit]  NULL,
	[giaPhong] [money]  NULL,
	[maLoaiPhong] [nchar](10) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/31/2021 7:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maNhanVien] [nchar](10) NOT NULL,
	[tenTaiKhoan] [nvarchar](50) NULL,
	[matKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV001', N'Lê Văn Nam', N'Nam', CAST(N'1992-01-01' AS Date), N'0903234425', N'324654465', N'Nhân viên kế toán')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV002', N'Trần Văn Huy', N'Nam', CAST(N'1996-08-19' AS Date), N'0906746633', N'376358632', N'Nhân viên thu ngân')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV003', N'Trần Ngọc Nghĩa', N'Nam', CAST(N'1998-05-15' AS Date), N'0367474655', N'324659663', N'Nhân viên phục vụ')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV004', N'Nguyễn Thị Lan', N'Nữ', CAST(N'1995-02-20' AS Date), N'0973463325', N'742658632', N'Nhân viên phục vụ')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV005', N'Dương Văn Chính', N'Nam', CAST(N'1999-08-30' AS Date), N'0936746334', N'984658676', N'Nhân viên phục vụ')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV006', N'Lê Thị Huyền', N'Nữ', CAST(N'2001-05-15' AS Date), N'0903674633', N'324658632', N'Nhân viên phục vụ')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV007', N'Lê Văn Khoa', N'Nam', CAST(N'1991-07-22' AS Date), N'0925897685', N'784636637', N'Nhân viên phục vụ ')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV008', N'Nguyễn Minh Đức', N'Nam', CAST(N'1991-12-09' AS Date), N'0925758463', N'678574355', N'Nhân viên thu ngân')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV009', N'Trần Thị Huyền', N'Nữ', CAST(N'1993-11-15' AS Date), N'0908875743', N'368674677', N'Nhân viên kế toán')
INSERT [dbo].[NhanVien] ([maNhanVien],[tenNhanVien],[gioiTinh],[ngaySinh],[dienThoai],[soCMND],[chucVu]) VALUES (N'NV010', N'Phạm Văn Hoài ', N'Nam', CAST(N'1988-02-27' AS Date), N'0917774362', N'895463676', N'Nhân viên bảo vệ')
GO

INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH001',N'Lê Anh Tuấn',N'0905543566',N'656265625',N'111 Nguyễn Văn Bảo, Phường 6, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH002',N'Phạm Duy An',N'0906585847',N'657625267',N'117 Nguyễn Văn Bảo, Phường 7, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH003',N'Lê Văn Trường',N'0905787867',N'867652565',N'114 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH004',N'Lê Hồng Ân',N'0907463685',N'473567675',N'113 Nguyễn Văn Bảo, Phường 8, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH005',N'Phạm Ngọc Thạch',N'0907843657',N'579578735',N'111 Nguyễn Văn Bảo, Phường 5, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH006',N'Bùi Vân Anh',N'0905367668',N'797843535',N'116 Nguyễn Văn Bảo, Phường 3, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH007',N'Đỗ Phương Anh',N'0909768576',N'778463267',N'112 Nguyễn Văn Bảo, Phường 6, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH008',N'Nguyễn Hữu Toàn',N'0906787352',N'769574667',N'114 Nguyễn Văn Bảo, Phường 5, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH009',N'Trần Ngọc Vương',N'0906463677',N'765874667',N'119 Nguyễn Văn Bảo, Phường 7, Quận Gò Vấp, TP HCM')
INSERT [dbo].[KhachHang] ([maKhachHang],[tenKhachHang],[soDienThoai],[soCMND],[diaChi]) VALUES (N'KH010',N'Phạm Tấn Tài',N'0907663677',N'784673688',N'115 Nguyễn Văn Bảo, Phường 3, Quận Gò Vấp, TP HCM')
GO

INSERT [dbo].[LoaiDichVu] ([maLoaiDV],[tenLoai]) VALUES (N'LDV01',N'Nước giải khát')
INSERT [dbo].[LoaiDichVu] ([maLoaiDV],[tenLoai]) VALUES (N'LDV02',N'Thức ăn')
GO

INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV001',N'Bia 333 * 24lon',N'333000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV002',N'Bia Tiger nâu  * 24lon',N'388000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV003',N'Haniken chai',N'30000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV004',N'Haniken lon',N'24000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV005',N'Bò húc',N'18000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV006',N'Coca ',N'12000',N'LDV01')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV007',N'Trái cây',N'120000',N'LDV02')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV008',N'Chả giò',N'10000',N'LDV02')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV009',N'Bò khô',N'200000',N'LDV02')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV010',N'Mực nướng',N'130000',N'LDV02')
INSERT [dbo].[DichVu] ([maDichVu],[tenDichVu],[giaTien],[maLoaiDV]) VALUES (N'DV011',N'Bim bim',N'15000',N'LDV02')
GO

ALTER TABLE [dbo].[ChiTietDonDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatPhong_DonDatPhong] FOREIGN KEY([maDonDatPhong])
REFERENCES [dbo].[DonDatPhong] ([maDonDatPhong])
GO
ALTER TABLE [dbo].[ChiTietDonDatPhong] CHECK CONSTRAINT [FK_ChiTietDonDatPhong_DonDatPhong]
GO
ALTER TABLE [dbo].[ChiTietDonDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatPhong_Phong] FOREIGN KEY([maPhong])
REFERENCES [dbo].[Phong] ([maPhong])
GO
ALTER TABLE [dbo].[ChiTietDonDatPhong] CHECK CONSTRAINT [FK_ChiTietDonDatPhong_Phong]
GO
ALTER TABLE [dbo].[ChiTietHoaDonDichVu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_DichVu] FOREIGN KEY([maDichVu])
REFERENCES [dbo].[DichVu] ([maDichVu])
GO
ALTER TABLE [dbo].[ChiTietHoaDonDichVu] CHECK CONSTRAINT [FK_ChiTietHoaDon_DichVu]
GO
ALTER TABLE [dbo].[ChiTietHoaDonDichVu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonDichVu_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonDichVu] CHECK CONSTRAINT [FK_ChiTietHoaDonDichVu_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonPhong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonPhong_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonPhong] CHECK CONSTRAINT [FK_ChiTietHoaDonPhong_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDonPhong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonPhong_Phong] FOREIGN KEY([maPhong])
REFERENCES [dbo].[Phong] ([maPhong])
GO
ALTER TABLE [dbo].[ChiTietHoaDonPhong] CHECK CONSTRAINT [FK_ChiTietHoaDonPhong_Phong]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDichVu] FOREIGN KEY([maLoaiDV])
REFERENCES [dbo].[LoaiDichVu] ([maLoaiDV])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDichVu]
GO
ALTER TABLE [dbo].[DonDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DonDatPhong_KhachHang1] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[DonDatPhong] CHECK CONSTRAINT [FK_DonDatPhong_KhachHang1]
GO
ALTER TABLE [dbo].[DonDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DonDatPhong_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[DonDatPhong] CHECK CONSTRAINT [FK_DonDatPhong_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_Ca] FOREIGN KEY([maCa])
REFERENCES [dbo].[Ca] ([maCa])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_Ca]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_NhanVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([maLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([maLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QLKaraoke] SET  READ_WRITE 
GO
