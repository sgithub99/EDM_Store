USE [master]
GO
/****** Object:  Database [Electronic_Device]    Script Date: 7/18/2021 8:34:13 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/18/2021 8:34:13 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 7/18/2021 8:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusId] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/18/2021 8:34:13 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 7/18/2021 8:34:13 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/18/2021 8:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[ProId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderr]    Script Date: 7/18/2021 8:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderr](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfPayment] [datetime] NULL,
	[EmployeeName] [nvarchar](30) NULL,
	[CustomerName] [nvarchar](30) NULL,
	[NameShipment] [nvarchar](50) NULL,
	[NamePayment] [nvarchar](50) NULL,
	[ShipmentId] [int] NULL,
	[PaymentId] [int] NULL,
	[OrderDetailId] [int] NULL,
	[CusId] [int] NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/18/2021 8:34:13 PM ******/
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
/****** Object:  Table [dbo].[Producer]    Script Date: 7/18/2021 8:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerId] [varchar](10) NOT NULL,
	[ProducerName] [varchar](50) NULL,
	[Address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/18/2021 8:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[ProducerId] [varchar](10) NULL,
	[ImageUrl] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 7/18/2021 8:34:13 PM ******/
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
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([CusId])
REFERENCES [dbo].[Customer] ([CusId])
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([EmpId])
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([OrderDetailId])
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([ShipmentId])
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
