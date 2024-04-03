
CREATE DATABASE [LogisticSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogisticSystem', FILENAME = N'your file path\Data\LogisticSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LogisticSystem_log', FILENAME = N'your file path\Data\LogisticSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LogisticSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogisticSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogisticSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogisticSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogisticSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogisticSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogisticSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogisticSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogisticSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogisticSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogisticSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogisticSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogisticSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogisticSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogisticSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogisticSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogisticSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LogisticSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogisticSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogisticSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogisticSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogisticSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogisticSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogisticSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogisticSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [LogisticSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LogisticSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogisticSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogisticSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogisticSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LogisticSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LogisticSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LogisticSystem', N'ON'
GO
ALTER DATABASE [LogisticSystem] SET QUERY_STORE = OFF
GO
USE [LogisticSystem]
GO
/****** Object:  Table [dbo].[tbl_AssignToDriver]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AssignToDriver](
	[AssignToId] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [int] NOT NULL,
	[SecurityTeamId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[Status] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_AssignToId] PRIMARY KEY CLUSTERED 
(
	[AssignToId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Login](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](150) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsAdmin] [int] NULL,
 CONSTRAINT [PK_tbl_Login] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ParcelStatus]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ParcelStatus](
	[ParcelStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ParcelStatusName] [varchar](150) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ParcelStatus] PRIMARY KEY CLUSTERED 
(
	[ParcelStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Route]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Route](
	[RouteId] [int] IDENTITY(1,1) NOT NULL,
	[RouteNumber] [varchar](150) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Route] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SecurityTeam]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SecurityTeam](
	[SecurityTeamId] [int] IDENTITY(1,1) NOT NULL,
	[SecurityTeamName] [varchar](150) NOT NULL,
	[NoOfGuards] [numeric](10, 0) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_SecurityTeam] PRIMARY KEY CLUSTERED 
(
	[SecurityTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vehicle]    Script Date: 25/11/2023 10:03:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vehicle](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleNumber] [varchar](150) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Login] ON 
GO
INSERT [dbo].[tbl_Login] ([UserId], [FullName], [UserName], [Email], [Password], [IsAdmin]) VALUES (1, N'Abdul Wahab', N'admin', N'Test@test.com', N'123456', 1)
GO
INSERT [dbo].[tbl_Login] ([UserId], [FullName], [UserName], [Email], [Password], [IsAdmin]) VALUES (2, N'Adil', N'adil', N'Adil@test.com', N'654321', 0)
GO
INSERT [dbo].[tbl_Login] ([UserId], [FullName], [UserName], [Email], [Password], [IsAdmin]) VALUES (4, N'Astle', N'Astle', N'astle@gmail.com', N'1234', 1)
GO
INSERT [dbo].[tbl_Login] ([UserId], [FullName], [UserName], [Email], [Password], [IsAdmin]) VALUES (6, N'Test', N'Test', N'Test@gmail.com', N'1234', 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Login] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ParcelStatus] ON 
GO
INSERT [dbo].[tbl_ParcelStatus] ([ParcelStatusId], [ParcelStatusName], [CreatedDate]) VALUES (1, N'Out of depot', CAST(N'2023-11-21T21:47:29.770' AS DateTime))
GO
INSERT [dbo].[tbl_ParcelStatus] ([ParcelStatusId], [ParcelStatusName], [CreatedDate]) VALUES (2, N'On the route', CAST(N'2023-11-21T21:47:46.150' AS DateTime))
GO
INSERT [dbo].[tbl_ParcelStatus] ([ParcelStatusId], [ParcelStatusName], [CreatedDate]) VALUES (3, N'Out of service', CAST(N'2023-11-21T21:47:59.677' AS DateTime))
GO
INSERT [dbo].[tbl_ParcelStatus] ([ParcelStatusId], [ParcelStatusName], [CreatedDate]) VALUES (4, N'On destinaiton', CAST(N'2023-11-21T21:48:11.433' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ParcelStatus] OFF
GO
ALTER TABLE [dbo].[tbl_ParcelStatus] ADD  CONSTRAINT [DF_tbl_ParcelStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Route] ADD  CONSTRAINT [DF_tbl_Route_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_SecurityTeam] ADD  CONSTRAINT [DF_tbl_SecurityTeam_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Vehicle] ADD  CONSTRAINT [DF_tbl_Vehicle_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
USE [master]
GO
ALTER DATABASE [LogisticSystem] SET  READ_WRITE 
GO
