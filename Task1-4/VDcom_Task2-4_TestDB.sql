USE [master]
GO
/****** Object:  Database [VDCom_DB_Test]    Script Date: 14.08.2023 21:18:24 ******/
CREATE DATABASE [VDCom_DB_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VDCom_DB_Test', FILENAME = N'C:\Users\Yurii_S\VDCom_DB_Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VDCom_DB_Test_log', FILENAME = N'C:\Users\Yurii_S\VDCom_DB_Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VDCom_DB_Test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VDCom_DB_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VDCom_DB_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VDCom_DB_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VDCom_DB_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VDCom_DB_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VDCom_DB_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VDCom_DB_Test] SET  MULTI_USER 
GO
ALTER DATABASE [VDCom_DB_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VDCom_DB_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VDCom_DB_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VDCom_DB_Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VDCom_DB_Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VDCom_DB_Test] SET QUERY_STORE = OFF
GO
USE [VDCom_DB_Test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VDCom_DB_Test]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 14.08.2023 21:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[CounterpartyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[CounterpartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Period]    Script Date: 14.08.2023 21:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period](
	[PeriodID] [int] NULL,
	[Value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 14.08.2023 21:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBook] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookInLibrary]    Script Date: 14.08.2023 21:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookInLibrary](
	[BookID] [int] NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 14.08.2023 21:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransID] [int] NOT NULL,
	[TransDate] [date] NULL,
	[RcvID] [int] NULL,
	[SndID] [int] NULL,
	[AssetID] [int] NULL,
	[Quantity] [numeric](19, 8) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([CounterpartyID], [Name], [IsActive]) VALUES (1, N'Иванов', 1)
INSERT [dbo].[Account] ([CounterpartyID], [Name], [IsActive]) VALUES (2, N'Петров', 0)
INSERT [dbo].[Account] ([CounterpartyID], [Name], [IsActive]) VALUES (3, N'Сидоров', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (1, 10)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (3, 10)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (5, 20)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (6, 20)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (7, 30)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (9, 40)
INSERT [dbo].[Period] ([PeriodID], [Value]) VALUES (10, 40)
GO
SET IDENTITY_INSERT [dbo].[tblBook] ON 

INSERT [dbo].[tblBook] ([BookID], [Name]) VALUES (1, N'Война и мир')
INSERT [dbo].[tblBook] ([BookID], [Name]) VALUES (2, N'Преступление и наказание')
INSERT [dbo].[tblBook] ([BookID], [Name]) VALUES (3, N'Мастер и Маргарита')
INSERT [dbo].[tblBook] ([BookID], [Name]) VALUES (4, N'Тихий дон')
SET IDENTITY_INSERT [dbo].[tblBook] OFF
GO
INSERT [dbo].[tblBookInLibrary] ([BookID], [Date]) VALUES (1, CAST(N'2006-05-01' AS Date))
INSERT [dbo].[tblBookInLibrary] ([BookID], [Date]) VALUES (3, CAST(N'2004-07-05' AS Date))
GO
INSERT [dbo].[Transaction] ([TransID], [TransDate], [RcvID], [SndID], [AssetID], [Quantity]) VALUES (1, CAST(N'2012-01-01' AS Date), 1, 2, 1, CAST(100.00000000 AS Numeric(19, 8)))
INSERT [dbo].[Transaction] ([TransID], [TransDate], [RcvID], [SndID], [AssetID], [Quantity]) VALUES (2, CAST(N'2012-01-02' AS Date), 1, 3, 2, CAST(150.00000000 AS Numeric(19, 8)))
INSERT [dbo].[Transaction] ([TransID], [TransDate], [RcvID], [SndID], [AssetID], [Quantity]) VALUES (3, CAST(N'2012-01-03' AS Date), 3, 1, 1, CAST(300.00000000 AS Numeric(19, 8)))
INSERT [dbo].[Transaction] ([TransID], [TransDate], [RcvID], [SndID], [AssetID], [Quantity]) VALUES (4, CAST(N'2012-01-04' AS Date), 2, 1, 3, CAST(50.00000000 AS Numeric(19, 8)))
GO
ALTER TABLE [dbo].[tblBookInLibrary]  WITH CHECK ADD  CONSTRAINT [FK_tblBookInLibrary_tblBook] FOREIGN KEY([BookID])
REFERENCES [dbo].[tblBook] ([BookID])
GO
ALTER TABLE [dbo].[tblBookInLibrary] CHECK CONSTRAINT [FK_tblBookInLibrary_tblBook]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account_RevID] FOREIGN KEY([RcvID])
REFERENCES [dbo].[Account] ([CounterpartyID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account_RevID]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account_SndID] FOREIGN KEY([SndID])
REFERENCES [dbo].[Account] ([CounterpartyID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account_SndID]
GO
USE [master]
GO
ALTER DATABASE [VDCom_DB_Test] SET  READ_WRITE 
GO
