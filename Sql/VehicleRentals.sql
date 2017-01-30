USE [master]
GO

/****** Object:  Database [VehicleRentals]    Script Date: 1/29/2017 11:39:23 PM ******/
CREATE DATABASE [VehicleRentals]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VehicleRentals', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VehicleRentals.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VehicleRentals_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\VehicleRentals_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [VehicleRentals] SET COMPATIBILITY_LEVEL = 120
GO


/****** Object:  Table [dbo].[Customer]    Script Date: 1/29/2017 11:39:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleInitial] [char](1) NULL,
	[Address1] [varchar](255) NOT NULL,
	[Address2] [varchar](255) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[Zip] [varchar](20) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Rate]    Script Date: 1/29/2017 11:39:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Rate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleClassificationId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PricePerDay] [decimal](19, 4) NOT NULL,
	[PricePerWeek] [decimal](19, 4) NOT NULL,
	[PricePerMonth] [decimal](19, 4) NOT NULL,
	[PricePerMileOver] [decimal](19, 4) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Vehicle]    Script Date: 1/29/2017 11:40:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Vehicle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleModelId] [int] NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Year] [smallint] NOT NULL,
	[LicensePlate] [varchar](50) NULL,
	[DeleteFlag] [bit] NOT NULL,
	[VIN] [varchar](50) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleModel] FOREIGN KEY([VehicleModelId])
REFERENCES [dbo].[VehicleModel] ([Id])
GO

ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleModel]
GO


/****** Object:  Table [dbo].[VehicleClassification]    Script Date: 1/29/2017 11:40:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VehicleClassification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleClassification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[VehicleMake]    Script Date: 1/29/2017 11:40:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VehicleMake](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Make] [varchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleMake] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[VehicleModel]    Script Date: 1/29/2017 11:40:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VehicleModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleMakeId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[VehicleClassificationId] [int] NULL,
	[Model] [varchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_VehicleClassification] FOREIGN KEY([VehicleClassificationId])
REFERENCES [dbo].[VehicleClassification] ([Id])
GO

ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_VehicleClassification]
GO

ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_VehicleMake] FOREIGN KEY([VehicleMakeId])
REFERENCES [dbo].[VehicleMake] ([Id])
GO

ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_VehicleMake]
GO

ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO

ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_VehicleType]
GO


/****** Object:  Table [dbo].[VehicleRental]    Script Date: 1/29/2017 11:40:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VehicleRental](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[RateId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleRental] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[VehicleRental]  WITH CHECK ADD  CONSTRAINT [FK_VehicleRental_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO

ALTER TABLE [dbo].[VehicleRental] CHECK CONSTRAINT [FK_VehicleRental_Customer]
GO

ALTER TABLE [dbo].[VehicleRental]  WITH CHECK ADD  CONSTRAINT [FK_VehicleRental_Rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([Id])
GO

ALTER TABLE [dbo].[VehicleRental] CHECK CONSTRAINT [FK_VehicleRental_Rate]
GO

ALTER TABLE [dbo].[VehicleRental]  WITH CHECK ADD  CONSTRAINT [FK_VehicleRental_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO

ALTER TABLE [dbo].[VehicleRental] CHECK CONSTRAINT [FK_VehicleRental_Vehicle]
GO


/****** Object:  Table [dbo].[VehicleType]    Script Date: 1/29/2017 11:40:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VehicleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VehicleRentals].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [VehicleRentals] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [VehicleRentals] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [VehicleRentals] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [VehicleRentals] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [VehicleRentals] SET ARITHABORT OFF 
GO

ALTER DATABASE [VehicleRentals] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [VehicleRentals] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [VehicleRentals] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [VehicleRentals] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [VehicleRentals] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [VehicleRentals] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [VehicleRentals] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [VehicleRentals] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [VehicleRentals] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [VehicleRentals] SET  DISABLE_BROKER 
GO

ALTER DATABASE [VehicleRentals] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [VehicleRentals] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [VehicleRentals] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [VehicleRentals] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [VehicleRentals] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [VehicleRentals] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [VehicleRentals] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [VehicleRentals] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [VehicleRentals] SET  MULTI_USER 
GO

ALTER DATABASE [VehicleRentals] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [VehicleRentals] SET DB_CHAINING OFF 
GO

ALTER DATABASE [VehicleRentals] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [VehicleRentals] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [VehicleRentals] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [VehicleRentals] SET  READ_WRITE 
GO


