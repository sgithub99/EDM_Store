USE [master]
GO
/****** Object:  Database [Electronic_Device]    Script Date: 8/23/2021 2:10:09 PM ******/
CREATE DATABASE [Electronic_Device]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Electronic_Device', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Electronic_Device.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Electronic_Device_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Electronic_Device_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Electronic_Device] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Electronic_Device].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Electronic_Device] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Electronic_Device] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Electronic_Device] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Electronic_Device] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Electronic_Device] SET ARITHABORT OFF 
GO
ALTER DATABASE [Electronic_Device] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Electronic_Device] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Electronic_Device] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Electronic_Device] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Electronic_Device] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Electronic_Device] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Electronic_Device] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Electronic_Device] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Electronic_Device] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Electronic_Device] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Electronic_Device] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Electronic_Device] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Electronic_Device] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Electronic_Device] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Electronic_Device] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Electronic_Device] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Electronic_Device] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Electronic_Device] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Electronic_Device] SET  MULTI_USER 
GO
ALTER DATABASE [Electronic_Device] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Electronic_Device] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Electronic_Device] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Electronic_Device] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Electronic_Device] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Electronic_Device] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Electronic_Device] SET QUERY_STORE = OFF
GO
USE [Electronic_Device]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](45) NULL,
	[password] [varchar](200) NULL,
	[enabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accounts_roles]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusId] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Username] [varchar](20) NULL,
	[Password] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
	[Link] [text] NULL,
	[ProId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[ProId] [int] NULL,
	[PaymentId] [int] NULL,
	[ShipmentId] [int] NULL,
	[OrderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderr]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderr](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfPayment] [datetime] NULL,
	[CustomerName] [nvarchar](30) NULL,
	[CusId] [int] NULL,
	[Address] [nvarchar](1000) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](20) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Method] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerId] [varchar](10) NOT NULL,
	[ProducerName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](1000) NULL,
	[CategoryId] [int] NULL,
	[ProducerId] [varchar](10) NULL,
	[ImageUrl] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 8/23/2021 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Fee] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([id], [username], [password], [enabled]) VALUES (1, N'admin', N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1)
INSERT [dbo].[accounts] ([id], [username], [password], [enabled]) VALUES (2, N'user', N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1)
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[accounts_roles] ON 

INSERT [dbo].[accounts_roles] ([id], [userId], [roleId]) VALUES (1, 1, 1)
INSERT [dbo].[accounts_roles] ([id], [userId], [roleId]) VALUES (2, 1, 2)
INSERT [dbo].[accounts_roles] ([id], [userId], [roleId]) VALUES (3, 2, 2)
SET IDENTITY_INSERT [dbo].[accounts_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (1, N'Điện thoại')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (2, N'Máy tính')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (3, N'Tablet')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (4, N'Đồng hồ')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (5, N'Phụ kiện')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (38, N'Đoàn Xuân Sơn', CAST(N'1999-06-20T00:00:00.000' AS DateTime), N'xuansondoan99@gmail.com', N'Hà Nội', N'0385296775', N'sondx', N'$2a$12$xAQ2p1Dvy4FuJieFYcSrC./.UIkeilt8BZUmkXsMIXdYziPWB3o7O')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (39, N'Đặng Thị Hồng Gấm', CAST(N'2001-02-22T00:00:00.000' AS DateTime), N'dangthihonggam@gmail.com', N'Hưng Yên', N'013214132', N'honggam', N'$2a$12$xYEVWx3xSrt4/u2ks7L0XOOe8rK7nbQJh/bqpY1XiaLWBhwHWElYu')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (40, N'Nguyễn Thành Đạt', CAST(N'1999-01-13T00:00:00.000' AS DateTime), N'thanhdat@gmail.com', N'Hà Nội', N'0984213412', N'thanhdat', N'$2a$12$ajTyMVVcuZlIYMNJqKrPNeE7hypvNI4D6/WWSnole68Fd/wSfwAt6')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (41, N'Nguyễn Huy Hoàng ', CAST(N'1999-03-06T00:00:00.000' AS DateTime), N'huyhoang@gmail.com', N'Nam Định', N'038234567', N'huyhoang', N'$2a$12$SEa0Uy.LRknupe8PcGYYE.9JUUlH5dNSKibfLfuzVo5V/ig2AC09a')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (42, N'Trần Quốc Nam', CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'quocnam@gmail.com', N'Hà Nội', N'098123446', N'quocnam', N'$2a$12$gJ2HOctUeE6TrrZYbvuwdusofaQiGBKaaTzawwpVMxApTWq2ki4ES')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (43, N'Trần Đình Vinh', CAST(N'1999-06-22T00:00:00.000' AS DateTime), N'trandinhvinh@gmail.com', N'Thái Bình', N'012345691', N'dinhvinh', N'$2a$12$Ahw4hlJV/hMrcW9XfRcNEeoLmhI/8yr2BewcSGNb1UXmAylF2xUF.')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (44, N'Nguyễn Lương Đức', CAST(N'1999-03-12T00:00:00.000' AS DateTime), N'luongduc@gmail.com', N'Hà Nội', N'098743123', N'luongduc@gmail.com', N'$2a$12$mVyrL5fZqJHM9ibA4cC8ve75FTviVQdFLNpXyikX8IWGzB4BbYehu')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (45, N'Nguyễn Văn Sơn', CAST(N'1999-09-22T00:00:00.000' AS DateTime), N'vanson@gmail.com', N'Hà Nội', N'08412354', N'vanson', N'$2a$12$Tic8JcMclUYoGY0.S8kmKuZSHlnJ6LooiKQkBRE4boatwBcwF3pEm')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (46, N'Nguyễn Hoàng Hà ', CAST(N'1999-08-23T00:00:00.000' AS DateTime), N'hoangha@gmail.com', N'Hà Nội', N'0812351324', N'hoangha', N'$2a$12$z4DUpG6g/5buBRJBSMproOdbxX0DDPkFn0ZI8FIoYL8lZDe8AGFWO')
INSERT [dbo].[Customer] ([CusId], [CusName], [Birthday], [Email], [Address], [Phone], [Username], [Password]) VALUES (47, N'Đoàn Xuân Hải', CAST(N'2005-01-16T00:00:00.000' AS DateTime), N'xuanhai@gmail.com', N'Hà Nội ', N'09123412431', N'xuanhai', N'$2a$12$n4js82LXpWzoJMBM2/cdBuh8CDFyEfORLbVxgoIdS5.osXxDLz.q2')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Orderr] ON 

INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (1, NULL, N'Đoàn Xuân Hải', NULL, N'Hà Nội', N'xuanhai@gmail.com', N'098314123', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (2, NULL, N'Đoàn Xuân Sơn', NULL, N'Ngo 4 Ham Nghi', N'xuansondoan99@gmail.com', N'0385296774', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (3, NULL, N'Đặng ', NULL, N'', N'dangthihonggam@gmail.com', N'', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (4, NULL, N'Trần Đình Vinh', NULL, N'Thái Bình', N'trandinhvinh@gmail.com', N'0912314123', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (5, NULL, N'Đoàn Xuân Sơn', NULL, N'Hà Nội', N'xuansondoan99@gmail.com', N'012341412', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (6, NULL, N'Đoàn Xuân Sơn', NULL, N'Ngo 4 Ham Nghi', N'xuansondoan99@gmail.com', N'0385296774', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (7, NULL, N'Đoàn Xuân Sơn', NULL, N'Nam Tu Liem, Ha Noi
Nam Tu Liem', N'xuansondoan99@gmail.com', N'0385296775', 0)
INSERT [dbo].[Orderr] ([OrderId], [DateOfPayment], [CustomerName], [CusId], [Address], [Email], [Telephone], [Status]) VALUES (8, NULL, N'', NULL, N'', N'', N'', 0)
SET IDENTITY_INSERT [dbo].[Orderr] OFF
GO
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DH1', N'Đồng hồ Watch', N'Quận 1, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DH2', N'Đồng hồ Samsung', N'Huyện Yên Phong, tỉnh Bắc Ninh')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DT1', N'Điện thoại Iphone', N'Quận 1, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DT2', N'Điện thoại Samsung', N'Huyện Yên Phong, tỉnh Bắc Ninh')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DT3', N'Điện thoại Oppo', N'Quảng Đông, Trung Quốc')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'DT4', N'Điện thoại Xiaomi', N'Quận Tân Phú, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'MT1', N'Máy tính Macbook', N'Quận 1, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'MT2', N'Máy tính Asus', N'Trung Liệt, Đống Đa, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'MT3', N'Máy tính Lenovo', N'Ngã Tư Sở, Đống Đa, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'MT4', N'Máy tính Dell', N'123 Chùa Bộc, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'MT5', N'Máy tính Acer', N'Phương Liên, Đống Đa, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK1', N'Phụ kiện Apple', N'Quận 1, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK2', N'Phụ kiện Samsung', N'Huyện Yên Phong, tỉnh Bắc Ninh')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK3', N'Phụ kiện Sony', N'93 Nguy?n Du, Qu?n 1. Tp. HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK4', N'Phụ kiện JBL', N'Quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK5', N'Phụ kiện Anker', N'180D Thái Thịnh, Đống Đa, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'PK6', N'Phụ kiện Aukey', N'Tương Mai, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'T1', N'Máy tính bảng Ipad', N'Quận 1, TP HCM')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'T2', N'Máy tính bảng Samsung', N'Huyện Yên Phong, tỉnh Bắc Ninh')
INSERT [dbo].[Producer] ([ProducerId], [ProducerName], [Address]) VALUES (N'T3', N'Máy tính bảng Huewei', N'P.Mễ Trì, Q. Nam Từ Liêm, Hà Nội')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (28, N'Điện thoại Samsung Galaxy A32', 6690000, N'Màn hình: Super AMOLED6.4"Full HD+; 
Hệ điều hành: Android 11; 
Camera sau: Chính 64 MP & Phụ 8 MP, 5MP, 5MP; 
Camera trước: 20 MP; 
Chip: MediaTek Helio G80; 
RAM: 6 GB; 
Bộ nhớ trong: 128 GB; 
SIM: 2 Nano SIMHỗ trợ 4G; 
Pin, Sạc: 5000 mAh15 W', 1, N'DT2', N'galaxy_a32.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (29, N'Điện thoại OPPO A74', 9000000, N'Màn hình:

AMOLED6.43"Full HD+
Hệ điều hành:

Android 11
Camera sau:

Chính 48 MP & Phụ 2 MP, 2 MP
Camera trước:

16 MP
Chip:

Snapdragon 662
RAM:

8 GB
Bộ nhớ trong:

128 GB
SIM:

2 Nano SIMHỗ trợ 4G
Pin, Sạc:

5000 mAh33 W', 1, N'DT3', N'oppo-a74.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (30, N'Điện thoại Samsung Galaxy Z Fold2 5G Đặc Biệt', 50000000, N'Màn hình:	Chính: Dynamic AMOLED, Phụ: Super AMOLED, Chính 7.59" & Phụ 6.23", Full HD+', 1, N'DT2', N'galaxy-z-fold2-5g.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (31, N'Điện thoại Samsung Galaxy A52 5G', 9340000, N'Màn hình: Super AMOLED, 6.5", Full HD+", Full HD+', 1, N'DT2', N'samsung-galaxy-a52.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (32, N'Laptop Lenovo IdeaPad Slim 3 15IIL05 i3 ', 12490000, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz", Full HD+', 2, N'MT3', N'lenovo-ideapad-slim-3-15iil05-i3.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (33, N'Laptop Acer Aspire 7 A715', 19990000, N'CPU: AMD Ryzen 5, 5500U, 2.10 GHz', 2, N'MT5', N'acer-aspire-7-a715.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (34, N'Laptop Dell G3 15 3500 i5 ', 22490000, N'CPU:	Intel Core i5 Ice Lake, 10300H, 2.50 GHz', 2, N'MT4', N'dell-g3-15-3500-i5.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (35, N'Laptop Lenovo Yoga Duet 7 13IML05 i7 ', 29990000, N'CPU: Intel Core i7 Comet Lake, 10510U, 1.80 GHz', 2, N'MT3', N'lenovo-yoga-duet-7-13iml05-i7.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (36, N'Laptop Lenovo YOGA Slim 7 Carbon', 25990000, N'CPU: Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz', 2, N'MT3', N'YOGA.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (37, N'Điện thoại OPPO Reno5', 8690000, N'Màn hình: AMOLED, 6.43", Full HD+', 1, N'DT3', N'oppo-reno-5.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (38, N'Điện thoại OPPO A74 5G', 7990000, N'Màn hình:	IPS LCD, 6.5", Full HD+', 1, N'DT3', N'oppo-a74-5g.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (39, N'Máy tính bảng Samsung Galaxy Tab A7 (2020)', 5140000, N'Màn hình: 10.1"IPS LCD', 3, N'T2', N'samsung-galaxy-tab-a7-2020.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (40, N'Máy tính bảng iPad Air 4 Wifi 64GB (2020)', 16190000, N'Màn hình:10.9"Liquid Retina', 3, N'T1', N'ipad-4-cellular-den-new.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (41, N'Máy tính bảng iPad Pro 12.9 (2020)', 31190000, N'Màn hình: 12.9"Liquid Retina', 3, N'T1', N'ipad-pro-12-9-inch-wifi-128gb-2020.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (42, N'Máy tính bảng iPad Air 4 Wifi 256GB (2020)', 20690000, N'Màn hình:10.9"Liquid Retina', 3, N'T1', N'ipad-air-4-wifi-64gb-2020.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (43, N'Apple Watch S3 GPS 38mm viền nhôm dây cao su đen', 4690000, N'Màn hình:Super AMOLED, 6.4", Full HD+', 4, N'DH1', N'apple-watch-3-phien-ban-38-mm.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (44, N'Apple Watch SE 40mm viền nhôm dây cao su hồng', 6890000, N'Màn hình: OLED1.57 inch', 4, N'DH1', N'se-40mm-vien-nhom-day-cao-su-hong.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (45, N'Apple Watch S5 44mm viền nhôm dây cao su đen', 9990000, N'Màn hình:OLED1.78 inch', 4, N'DH1', N'apple-watch-s5-44mm-vien-nhom-day-cao-su.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (46, N'Apple Watch S6 40mm viền nhôm dây cao su hồng', 11990000, N'Màn hình: OLED1.57 inch', 4, N'DH1', N'apple-watch-s6-40mm-vien-nhom-day-cao-su.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (47, N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone', 4990000, N'Màn hình: SUPER AMOLED 1.4 inch', 4, N'DH2', N'samsung-galaxy-watch-active-2-44-mm-sillicon.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (48, N'Samsung Galaxy Watch 3 41mm viền thép hồng dây da', 5990000, N'Màn hình: SUPER AMOLED 1.2 inch', 4, N'DH2', N'samsung-galaxy-watch-3-41mmava.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (49, N'Samsung Galaxy Watch 3 LTE 41mm viền thép dây da', 6690000, N'Màn hình:SUPER AMOLED 1.2 inch', 4, N'DH2', N'samsung-galaxy-watch-3-lte-41mmava.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (50, N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone đen', 2990000, N'Màn hình:SUPER AMOLED 1.2 inch', 4, N'DH2', N'samsung-galaxy-watch-active-2-40-mm-den.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (51, N'Thiết bị định vị thông minh AirTag 4 Pack MX542', 2790000, N'Theo dõi chính xác vị trí nhờ công nghệ Ultra-Wideband, chip U1 Apple', 5, N'PK1', N'thiet-bi-dinh-vi-thong-minh-airtag-4-pack.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (52, N'Ốp lưng iPhone 12 Pro Max da Apple MHKK3 Xanh navy', 1790000, N'Kiểu dáng tinh tế, màu xanh navy trẻ trung, thiết kế chuyên dụng cho iPhone 12 Pro Max', 5, N'PK1', N'op-lung-iphone-12-pro-max-da-apple-mhkk3-xanh-navy.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (53, N'Bàn phím Smart Keyboard Folio 4 cho iPad Pro 12.9 inch Apple MXNL2', 5790000, N'Tính năng: Bàn phím kiêm ốp bảo vệ', 5, N'PK1', N'smart-keyboard-folio-4-ipad-pro-mxnl2.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (54, N'Bàn phím Magic Keyboard US Apple MLA22', 3190000, N'Trọng lượng: Khoảng 231g', 5, N'PK1', N'ban-phim-magic-keyboard-us-apple-mla22.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (55, N'Ốp lưng Galaxy A22 LTE nhựa dẻo Soft Clear Samsung Trong', 180000, N'Hàng chất lượng cao, bền theo thời gian', 5, N'PK2', N'op-lung-galaxy-a22-lte-deo-soft-clear-samsung.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (56, N'Bao da Galaxy S21 Ultra Nắp Gập Clear View kèm S-Pen Samsung Đen', 2090000, N'Kiểu dáng hiện đại, ôm trọn Galaxy S21 Ultra.', 5, N'PK2', N'bao-da-galaxy-s21-ultra-clear-view-kem-s-pen.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (57, N'Tai nghe Bluetooth True Wireless Galaxy Buds Pro Bạc', 3390000, N'Thời gian tai nghe: Dùng 8 giờ - Sạc 3 giờ', 5, N'PK2', N'bluetooth-true-wireless-galaxy-buds-pro-bac.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (58, N'Cáp chuyển đổi Type C sang 3.5mm Samsung EE-UC10JUW Trắng', 220000, N'Chức năng: Chuyển đổi cổng kết nối', 5, N'PK2', N'cap-chuyen-doi-type-c-sang-35mm-samsung-ee.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (59, N'Tai nghe Bluetooth True Wireless Sony WF-1000XM4', 6490000, N'Thời gian tai nghe: Dùng 8 giờ - Sạc 1.5 giờ', 5, N'PK3', N'bluetooth-true-wireless-sony-wf-1000xm4.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (60, N'Loa Bluetooth Sony Extra Bass SRS-XB23', 1990000, N'Thời gian sử dụng: Dùng khoảng 12 tiếngSạc khoảng 4 tiếng', 5, N'PK3', N'loa-bluetooth-sony-extra-bass-srs-xb23.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (61, N'Tai nghe chụp tai Bluetooth Sony WH-1000XM4', 8490000, N'Pin: Dùng 30 giờ - Sạc 3 giờ', 5, N'PK3', N'tai-nghe-chup-tai-bluetooth-sony-wh-1000xm4.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (62, N'Tai nghe EP Bluetooth Sony WI-1000XM2', 6990000, N'Pin: Dùng 10 giờ - Sạc 3.5 giờ', 5, N'PK3', N'tai-nghe-ep-bluetooth-sony-wi-1000xm2.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (63, N'Tai nghe Bluetooth True Wireless JBL T115TWS', 1490000, N'Thời gian tai nghe: Dùng 6 giờ - Sạc 2 giờ', 5, N'PK4', N'bluetooth-true-wireless-jbl-t115twswhtas.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (64, N'Loa Bluetooth JBL Go 3', 821000, N'Tổng công suất: 4.2W', 5, N'PK4', N'bluetooth-jbl-go-3.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (65, N'Loa Bluetooth JBL Partybox 100 Đen', 8500000, N'Tổng công suất: 160W', 5, N'PK4', N'bluetooth-jbl-partybox-100-den.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (66, N'Loa Bluetooth JBL Boombox 2 Đen', 9690000, N'Tổng công suất: 60W', 5, N'PK4', N'loa-bluetooth-jbl-boombox-2-den.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (67, N'Pin sạc dự phòng Polymer 10.000 mAh Type C PD Anker PowerCore Slim A1231', 1000000, N'Hiệu suất sạc: 65%', 5, N'PK5', N'anker-powercore-slim-a1231.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (68, N'Cáp Type C - Type C 0.9m Anker PowerLine III A8852 Đen', 250000, N'Công nghệ/Tiện ích: Power Delivery', 5, N'PK5', N'cap-type-c-type-c-anker-powerline-iii-a8852.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (69, N'Adapter Sạc Type C PD 20W Anker PowerPort III Nano A2633 Trắng', 400000, N'Model: A2633', 5, N'PK5', N'Sac_anker_powerportIII.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (70, N'Adapter sạc 4 cổng USB Type C PD 65W Anker PowerPort Atom III Slim A2045 Đen', 1100000, N'Model: A2045', 5, N'PK5', N'adapter-4-cong-65w-anker-powerport-atom.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (71, N'Tai nghe Bluetooth True Wireless Aukey EP-K01 Đen', 1490000, N'Thời gian tai nghe: Dùng 5 giờ - Sạc 1.5 giờ', 5, N'PK6', N'tai-nghe-bluetooth-tws-aukey-ep-k01-den.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (72, N'Pin sạc dự phòng Polymer 10.000 mAh Type C AUKEY PB-XN10', 490000, N'Hiệu suất sạc: 65%', 5, N'PK6', N'AukeyPB_XN10.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (73, N'Adapter sạc 2 cổng USB 2.4A Aukey PA-U32 Đen', 220000, N'Model: PA-U32', 5, N'PK6', N'adapter-sac-2-cong-usb-24a-aukey.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (74, N'Cáp Micro USB 1.2m Aukey CB-AM1 Đen Trắng', 119000, N'Chức năng: SạcTruyền dữ liệu', 5, N'PK6', N'cap-micro-usb-12m-aukey-cb-am1-den-trang.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (76, N'Điện thoại đểu', 120000, N'Điện thoại thật là đểu', 1, N'DT3', N'95641527_3026734597349825_999786434237825024_n.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (79, N'Đặng Thị Hồng Gấm', 99999, N'abc', 2, N'MT1', N'118798741_1526120870928890_6367140123895827657_n.jpg')
INSERT [dbo].[Product] ([ProId], [ProName], [Price], [Description], [CategoryId], [ProducerId], [ImageUrl]) VALUES (80, N'Máy Tính cực kỳ xịn', 1000000, N'hello', 2, N'MT3', N'76961421_153282332717074_3324344608825016320_o.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
ALTER TABLE [dbo].[accounts_roles]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[accounts_roles]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orderr] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_payment]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([ShipmentId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_shipment]
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([CusId])
REFERENCES [dbo].[Customer] ([CusId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producer] ([ProducerId])
GO
USE [master]
GO
ALTER DATABASE [Electronic_Device] SET  READ_WRITE 
GO
