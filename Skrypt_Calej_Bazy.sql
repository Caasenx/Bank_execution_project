USE [master]
GO
/****** Object:  Database [bank_executinv3]    Script Date: 12.12.2019 15:59:20 ******/
CREATE DATABASE [bank_executinv3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bank_executinv3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bank_executinv3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bank_executinv3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bank_executinv3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bank_executinv3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bank_executinv3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bank_executinv3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bank_executinv3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bank_executinv3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bank_executinv3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bank_executinv3] SET ARITHABORT OFF 
GO
ALTER DATABASE [bank_executinv3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bank_executinv3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bank_executinv3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bank_executinv3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bank_executinv3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bank_executinv3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bank_executinv3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bank_executinv3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bank_executinv3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bank_executinv3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bank_executinv3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bank_executinv3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bank_executinv3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bank_executinv3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bank_executinv3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bank_executinv3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bank_executinv3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bank_executinv3] SET RECOVERY FULL 
GO
ALTER DATABASE [bank_executinv3] SET  MULTI_USER 
GO
ALTER DATABASE [bank_executinv3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bank_executinv3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bank_executinv3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bank_executinv3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bank_executinv3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bank_executinv3', N'ON'
GO
ALTER DATABASE [bank_executinv3] SET QUERY_STORE = OFF
GO
USE [bank_executinv3]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_client_id] [int] NOT NULL,
	[account_number] [varchar](28) NOT NULL,
	[account_create_data] [date] NOT NULL,
	[account_close_data] [date] NULL,
	[account_type] [varchar](50) NOT NULL,
	[account_balance] [decimal](38, 2) NOT NULL,
	[account_currency] [varchar](50) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_bridge_procedures]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_bridge_procedures](
	[account_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_first_name] [varchar](50) NOT NULL,
	[client_last_name] [varchar](50) NOT NULL,
	[client_PESEL] [varchar](11) NOT NULL,
	[client_city] [varchar](50) NULL,
	[client_address] [varchar](256) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_bridge_procedures]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_bridge_procedures](
	[client_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[debt]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[debt](
	[debt_id] [int] IDENTITY(1,1) NOT NULL,
	[debt_date] [datetime] NOT NULL,
	[debt_type] [varchar](50) NOT NULL,
	[debt_amount] [decimal](38, 2) NOT NULL,
	[debt_procedure_id] [int] NOT NULL,
	[debt_status] [bit] NOT NULL,
 CONSTRAINT [PK_debt] PRIMARY KEY CLUSTERED 
(
	[debt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_first_name] [varchar](50) NOT NULL,
	[employee_last_name] [varchar](50) NOT NULL,
	[employee_create_date] [date] NOT NULL,
	[employee_login] [varchar](50) NOT NULL,
	[employee_password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organ]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[organ](
	[organ_id] [int] IDENTITY(1,1) NOT NULL,
	[organ_name] [varchar](256) NOT NULL,
	[organ_address] [varchar](256) NOT NULL,
	[organ_type] [varchar](50) NOT NULL,
	[organ_account_number] [varchar](28) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[organ_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[procedures]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedures](
	[procedure_id] [int] IDENTITY(1,1) NOT NULL,
	[procedure_organ_id] [int] NOT NULL,
	[procedure_sign] [varchar](50) NOT NULL,
	[procedure_start_date] [datetime] NOT NULL,
	[procedure_end_date] [datetime] NULL,
	[procedure_status] [varchar](50) NOT NULL,
	[procedure_employee_id] [int] NOT NULL,
 CONSTRAINT [PK_procedure] PRIMARY KEY CLUSTERED 
(
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transfer]    Script Date: 12.12.2019 15:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transfer](
	[transfer_id] [int] IDENTITY(1,1) NOT NULL,
	[transfer_date] [datetime] NOT NULL,
	[transfer_from_account_id] [int] NOT NULL,
	[transfer_to_account_number] [varchar](28) NOT NULL,
	[transfer_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_transfer] PRIMARY KEY CLUSTERED 
(
	[transfer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (2, 1, N'PL60370900550000000000000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (3, 2, N'PL60370900550000000000000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (4, 3, N'PL60370900550000000000000003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (5, 4, N'PL60370900550000000000000004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (6, 5, N'PL60370900550000000000000005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (7, 6, N'PL60370900550000000000000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (8, 7, N'PL60370900550000000000000007', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (9, 8, N'PL60370900550000000000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (10, 9, N'PL60370900550000000000000009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (11, 10, N'PL60370900550000000000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (12, 11, N'PL60370900557880004933376777', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (13, 12, N'PL60370900550000090576555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (14, 13, N'PL60370900555551091198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (15, 14, N'PL60370900552659600055594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (16, 15, N'PL60370900550000543337895345', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (17, 16, N'PL60370900558888666777006034', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (18, 17, N'PL60370900554589053267789235', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (19, 18, N'PL60370900554589053267700803', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (20, 19, N'PL60370900559088866111122145', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (21, 20, N'PL60370900555567844400006098', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (22, 11, N'PL60370900550000550000000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (23, 12, N'PL60370900550000000990000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (24, 13, N'PL60370900550000000000110003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (25, 14, N'PL60370900550000000000099004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (26, 15, N'PL60370900550000000000440005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (27, 16, N'PL60370900550000066000000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (28, 17, N'PL60370900550000000000008807', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (29, 18, N'PL60370900550000770000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (30, 19, N'PL60370900550000000000980009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (31, 20, N'PL60370900550000340000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (32, 21, N'PL60370900555454591198777095', CAST(N'2010-03-13' AS Date), NULL, N'PER', CAST(10000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (33, 22, N'PL60370900554679600055594876', CAST(N'2010-03-15' AS Date), NULL, N'PER', CAST(13000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (34, 23, N'PL60370900550000543337868645', CAST(N'2010-04-10' AS Date), NULL, N'PER', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (35, 24, N'PL60370900545688666777006034', CAST(N'2009-05-11' AS Date), NULL, N'PER', CAST(5000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (36, 25, N'PL60370900554589053267777235', CAST(N'2009-04-13' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (37, 26, N'PL60370900554589053267700345', CAST(N'2009-11-14' AS Date), NULL, N'PER', CAST(7000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (38, 27, N'PL60370900533388866111122145', CAST(N'2010-10-16' AS Date), NULL, N'PER', CAST(3000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (39, 28, N'PL60370900555567844467806098', CAST(N'2010-09-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (40, 29, N'PL60370900550000550000567001', CAST(N'2010-09-16' AS Date), NULL, N'PER', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (41, 30, N'PL60370900550567000990000002', CAST(N'2010-06-10' AS Date), NULL, N'PER', CAST(3500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (42, 21, N'PL60370900550000550000077001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (43, 22, N'PL60370900550000000234000002', CAST(N'2019-10-01' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (44, 23, N'PL60370900550000008900110003', CAST(N'2019-09-10' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (45, 24, N'PL60370900550000045600099004', CAST(N'2019-08-21' AS Date), NULL, N'TBL', CAST(200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (46, 25, N'PL60370900550005670000440005', CAST(N'2019-03-09' AS Date), NULL, N'TBL', CAST(300.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (47, 26, N'PL60370900550000066000454006', CAST(N'2019-04-09' AS Date), NULL, N'TBL', CAST(450.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (48, 27, N'PL60370900550005680000008807', CAST(N'2019-04-28' AS Date), NULL, N'TBL', CAST(340.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (49, 28, N'PL60370900550000770098800008', CAST(N'2019-05-27' AS Date), NULL, N'TBL', CAST(700.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (50, 29, N'PL60370900550004560000980009', CAST(N'2018-11-03' AS Date), NULL, N'TBL', CAST(320.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (51, 30, N'PL60370900550000348900000010', CAST(N'2019-07-14' AS Date), NULL, N'TBL', CAST(140.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (52, 31, N'PL60370900557880004777376909', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (53, 32, N'PL60370900550099966676555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (54, 33, N'PL60370900555656211198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (55, 34, N'PL60370900551119090055594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (56, 35, N'PL60370900550009993337895641', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (57, 36, N'PL60370900558888699977006666', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (58, 37, N'PL60370900554589053267799994', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (59, 38, N'PL60370900554589999267700007', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (60, 39, N'PL60370900559088866166622232', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (61, 40, N'PL60370900555567846760006657', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (62, 31, N'PL60370900550000000567000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (63, 32, N'PL60370900550000095200000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (64, 33, N'PL60370900550000000345000003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (65, 34, N'PL60370900550094300000000004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (66, 35, N'PL60370900550000000005430005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (67, 36, N'PL60370900550000045600000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (68, 37, N'PL60370900550000001230000007', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (69, 38, N'PL60370900550001230000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (70, 39, N'PL60370900550567000000000009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (71, 40, N'PL60370900550004540000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (72, 41, N'PL60370900557880004765376777', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (73, 42, N'PL60370900550000093436555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (74, 43, N'PL60370900555551456198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (75, 44, N'PL60370900552659600878594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (76, 45, N'PL60370900550000543334595345', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (77, 46, N'PL60370900558888666778506034', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (78, 47, N'PL60370900554799053267789235', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (79, 48, N'PL60370900554589053299900803', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (80, 49, N'PL60370900559088834511122145', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (81, 50, N'PL60370900555567844406786098', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (82, 41, N'PL60370900550000550009870001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (83, 42, N'PL60370900550000000990348002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (84, 43, N'PL60370900550000494000110003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (85, 44, N'PL60370900550000000059499004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (86, 45, N'PL60370900550005730000440005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (87, 46, N'PL60370900550000066000568006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (88, 47, N'PL60370900550000005790008807', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (89, 48, N'PL60370900550000774670000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (90, 49, N'PL60370900550000895000980009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (91, 50, N'PL60370900550000340045600010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (92, 51, N'PL60370900555454571198777095', CAST(N'2010-03-13' AS Date), NULL, N'PER', CAST(10000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (93, 52, N'PL60370900554679604615594876', CAST(N'2010-03-15' AS Date), NULL, N'PER', CAST(13000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (94, 53, N'PL60370900550000543458868645', CAST(N'2010-04-10' AS Date), NULL, N'PER', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (95, 54, N'PL60370900545688666765006034', CAST(N'2009-05-11' AS Date), NULL, N'PER', CAST(5000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (96, 55, N'PL60370900554589053200077235', CAST(N'2009-04-13' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (97, 56, N'PL60370900554589000267700345', CAST(N'2009-11-14' AS Date), NULL, N'PER', CAST(7000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (98, 57, N'PL60370900533388860001122145', CAST(N'2010-10-16' AS Date), NULL, N'PER', CAST(3000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (99, 58, N'PL60370900550007844467806098', CAST(N'2010-09-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (100, 59, N'PL60370900550000555640567001', CAST(N'2010-09-16' AS Date), NULL, N'PER', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
GO
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (101, 60, N'PL60370900550567087690000002', CAST(N'2010-06-10' AS Date), NULL, N'PER', CAST(3500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (102, 51, N'PL60370900550000654000077001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (103, 52, N'PL60370900550067500234000002', CAST(N'2019-10-01' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (104, 53, N'PL60370900550000067400110003', CAST(N'2019-09-10' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (105, 54, N'PL60370900550567045600099004', CAST(N'2019-08-21' AS Date), NULL, N'TBL', CAST(200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (106, 55, N'PL60370900550005670777440005', CAST(N'2019-03-09' AS Date), NULL, N'TBL', CAST(300.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (107, 56, N'PL60370900550099966000454006', CAST(N'2019-04-09' AS Date), NULL, N'TBL', CAST(450.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (108, 57, N'PL60370900550005655500008807', CAST(N'2019-04-28' AS Date), NULL, N'TBL', CAST(340.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (109, 58, N'PL60370900550000789098800008', CAST(N'2019-05-27' AS Date), NULL, N'TBL', CAST(700.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (110, 59, N'PL60370900550004560089080009', CAST(N'2018-11-03' AS Date), NULL, N'TBL', CAST(320.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (111, 60, N'PL60370900550000348956400010', CAST(N'2019-07-14' AS Date), NULL, N'TBL', CAST(140.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (112, 1, N'PL60370900550000000000000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (113, 2, N'PL60370900550000000000000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (114, 3, N'PL60370900550000000000000003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (115, 4, N'PL60370900550000000000000004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (116, 5, N'PL60370900550000000000000005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (117, 6, N'PL60370900550000000000000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (118, 7, N'PL60370900550000000000000007', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (119, 8, N'PL60370900550000000000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (120, 9, N'PL60370900550000000000000009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (121, 10, N'PL60370900550000000000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (122, 11, N'PL60370900557880004933376777', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (123, 12, N'PL60370900550000090576555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (124, 13, N'PL60370900555551091198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (125, 14, N'PL60370900552659600055594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (126, 15, N'PL60370900550000543337895345', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (127, 16, N'PL60370900558888666777006034', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (128, 17, N'PL60370900554589053267789235', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (129, 18, N'PL60370900554589053267700803', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (130, 19, N'PL60370900559088866111122145', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (131, 20, N'PL60370900555567844400006098', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (132, 11, N'PL60370900550000550000000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (133, 12, N'PL60370900550000000990000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (134, 13, N'PL60370900550000000000110003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (135, 14, N'PL60370900550000000000099004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (136, 15, N'PL60370900550000000000440005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (137, 16, N'PL60370900550000066000000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (138, 17, N'PL60370900550000000000008807', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (139, 18, N'PL60370900550000770000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (140, 19, N'PL60370900550000000000980009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (141, 20, N'PL60370900550000340000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (142, 21, N'PL60370900555454591198777095', CAST(N'2010-03-13' AS Date), NULL, N'PER', CAST(10000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (143, 22, N'PL60370900554679600055594876', CAST(N'2010-03-15' AS Date), NULL, N'PER', CAST(13000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (144, 23, N'PL60370900550000543337868645', CAST(N'2010-04-10' AS Date), NULL, N'PER', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (145, 24, N'PL60370900545688666777006034', CAST(N'2009-05-11' AS Date), NULL, N'PER', CAST(5000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (146, 25, N'PL60370900554589053267777235', CAST(N'2009-04-13' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (147, 26, N'PL60370900554589053267700345', CAST(N'2009-11-14' AS Date), NULL, N'PER', CAST(7000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (148, 27, N'PL60370900533388866111122145', CAST(N'2010-10-16' AS Date), NULL, N'PER', CAST(3000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (149, 28, N'PL60370900555567844467806098', CAST(N'2010-09-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (150, 29, N'PL60370900550000550000567001', CAST(N'2010-09-16' AS Date), NULL, N'PER', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (151, 30, N'PL60370900550567000990000002', CAST(N'2010-06-10' AS Date), NULL, N'PER', CAST(3500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (152, 21, N'PL60370900550000550000077001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (153, 22, N'PL60370900550000000234000002', CAST(N'2019-10-01' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (154, 23, N'PL60370900550000008900110003', CAST(N'2019-09-10' AS Date), NULL, N'TBL', CAST(100.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (155, 24, N'PL60370900550000045600099004', CAST(N'2019-08-21' AS Date), NULL, N'TBL', CAST(200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (156, 25, N'PL60370900550005670000440005', CAST(N'2019-03-09' AS Date), NULL, N'TBL', CAST(300.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (157, 26, N'PL60370900550000066000454006', CAST(N'2019-04-09' AS Date), NULL, N'TBL', CAST(450.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (158, 27, N'PL60370900550005680000008807', CAST(N'2019-04-28' AS Date), NULL, N'TBL', CAST(340.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (159, 28, N'PL60370900550000770098800008', CAST(N'2019-05-27' AS Date), NULL, N'TBL', CAST(700.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (160, 29, N'PL60370900550004560000980009', CAST(N'2018-11-03' AS Date), NULL, N'TBL', CAST(320.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (161, 30, N'PL60370900550000348900000010', CAST(N'2019-07-14' AS Date), NULL, N'TBL', CAST(140.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (162, 31, N'PL60370900557880004777376909', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (163, 32, N'PL60370900550099966676555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (164, 33, N'PL60370900555656211198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (165, 34, N'PL60370900551119090055594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (166, 35, N'PL60370900550009993337895641', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (167, 36, N'PL60370900558888699977006666', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (168, 37, N'PL60370900554589053267799994', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (169, 38, N'PL60370900554589999267700007', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (170, 39, N'PL60370900559088866166622232', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (171, 40, N'PL60370900555567846760006657', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (172, 31, N'PL60370900550000000567000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (173, 32, N'PL60370900550000095200000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (174, 33, N'PL60370900550000000345000003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (175, 34, N'PL60370900550094300000000004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (176, 35, N'PL60370900550000000005430005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (177, 36, N'PL60370900550000045600000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (178, 37, N'PL60370900550000001230000007', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (179, 38, N'PL60370900550001230000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (180, 39, N'PL60370900550567000000000009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (181, 40, N'PL60370900550004540000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (182, 41, N'PL60370900557880004765376777', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (183, 42, N'PL60370900550000093436555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (184, 43, N'PL60370900555551456198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (185, 44, N'PL60370900552659600878594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (186, 45, N'PL60370900550000543334595345', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (187, 46, N'PL60370900558888666778506034', CAST(N'2010-11-09' AS Date), NULL, N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (188, 47, N'PL60370900554799053267789235', CAST(N'2000-11-09' AS Date), NULL, N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (189, 48, N'PL60370900554589053299900803', CAST(N'2009-07-08' AS Date), NULL, N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (190, 49, N'PL60370900559088834511122145', CAST(N'2006-07-02' AS Date), NULL, N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (191, 50, N'PL60370900555567844406786098', CAST(N'2000-07-02' AS Date), NULL, N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (192, 41, N'PL60370900550000550009870001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (193, 42, N'PL60370900550000000990348002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (194, 43, N'PL60370900550000494000110003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (195, 44, N'PL60370900550000000059499004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (196, 45, N'PL60370900550005730000440005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (197, 46, N'PL60370900550000066000568006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (198, 47, N'PL60370900550000005790008807', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (199, 48, N'PL60370900550000774670000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (200, 49, N'PL60370900550000895000980009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
GO
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (201, 50, N'PL60370900550000340045600010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
SET IDENTITY_INSERT [dbo].[account] OFF
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (11, 1)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (12, 2)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (13, 3)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (14, 4)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (15, 5)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (16, 6)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (17, 7)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (18, 8)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (19, 9)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (20, 10)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (31, 11)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (32, 12)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (33, 13)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (34, 14)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (35, 15)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (36, 16)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (37, 17)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (38, 18)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (39, 19)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (40, 20)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (51, 21)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (52, 22)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (53, 23)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (54, 24)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (55, 25)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (56, 26)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (57, 27)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (58, 28)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (59, 29)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (60, 30)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (71, 31)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (72, 32)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (73, 33)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (74, 34)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (75, 35)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (76, 36)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (77, 37)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (78, 38)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (79, 39)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (80, 40)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (91, 41)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (92, 42)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (93, 43)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (94, 44)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (95, 45)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (96, 46)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (97, 47)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (98, 48)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (99, 49)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (100, 50)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (112, 52)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (113, 53)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (114, 54)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (115, 55)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (116, 56)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (117, 57)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (118, 58)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (119, 59)
INSERT [dbo].[account_bridge_procedures] ([account_id], [procedure_id]) VALUES (120, 60)
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (1, N'Andrzej', N'Grechuta', N'90071585642', N'Dobromierz', N'Kolorowa 13, 58-200')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (2, N'Marek', N'Niziołek', N'88071585401', N'Nowy Sącz', N'Bolesława Krzywoustego 23/8, 87-201')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (3, N'Elżbieta', N'Druga', N'50121285497', N'Smolec', N'Rzeczna 20/9, 86-890')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (4, N'Mateusz', N'Nowak', N'90120908559', N'Kraków', N'Serdeczna 11/4, 34-160')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (5, N'Konstancja', N'Sienkiewicz', N'86091390875', N'Zakopane', N'Henryka Sienkiewicza 45, 68-320')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (6, N'Zygmunt', N'Kasprowicz', N'58091398455', N'Nowa Ruda', N'Tęczowa 34/7, 70-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (7, N'Albert', N'Krasicki', N'45062404983', N'Legnica', N'Henryka Brodatego 68/2, 53-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (8, N'Dagmara', N'Prus', N'78062104523', N'Warszawa', N'Długa 14, 60-350')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (9, N'Aleksander', N'Poniatowski', N'84122178533', N'Darłowo', N'Krótka 34, 54-150')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (10, N'Agnieszka', N'Poniatowska', N'80121673402', N'Łódź', N'Kręta 23, 50-130')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (11, N'Edward', N'Kloc', N'90071585649', N'Dobromierz', N'Kolorowa 10, 58-200')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (12, N'Marek', N'Niski', N'88071585001', N'Nowy Sącz', N'Bolesława Chrobrego 23/8, 87-201')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (13, N'Elżbieta', N'Smok', N'50121205497', N'Smolec', N'Czerwona 20/9, 86-890')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (14, N'Mateusz', N'Stary', N'90120908550', N'Kraków', N'Serdeczna 11/4, 34-160')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (15, N'Grażyna', N'Krzak', N'86091390870', N'Warszawa', N'Puszysta 45, 68-700')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (16, N'Zygmunt', N'Tuwim', N'58091398454', N'Nowa Ruda', N'Tęczowa 34/7, 70-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (17, N'Albert', N'Krzywousty', N'45062404984', N'Legnica', N'Henryka Brodatego 68/2, 53-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (18, N'Dagmara', N'Pisarz', N'78062104521', N'Warszawa', N'Boczna 14, 60-350')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (19, N'Zygmunt', N'Biały', N'84122178530', N'Rzeszów', N'Świdnicka 34, 54-150')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (20, N'Agnieszka', N'Szewc', N'80121673407', N'Łódź', N'Owalna 23, 50-130')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (21, N'Konstancja', N'Nowa', N'86091390866', N'Warszawa', N'Wałbrzyska 49, 68-326')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (22, N'Mateusz', N'Jeleń', N'58091397755', N'Gdynia', N'Serdeczna 38/7, 76-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (23, N'Michał', N'Milel', N'45062405583', N'Sopot', N'Henryka Sienkiewicza 62, 59-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (24, N'Dorota', N'Ewart', N'78062104588', N'Smolec', N'Długa 10, 60-359')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (25, N'Aleksander', N'Nosacz', N'84122178522', N'Świdnica', N'Wrocławska 34, 54-180')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (26, N'Agnieszka', N'Wanda', N'80121634402', N'Wałbrzych', N'Jeleniogórska 29, 50-145')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (27, N'Edward', N'Jagiel', N'90071585600', N'Karpacz', N'Górska 10, 58-289')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (28, N'Robert', N'Robert', N'88071534001', N'Jelenia Góra', N'Bolesława Chrobrego 8, 87-245')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (29, N'Agnieszka', N'Wielc', N'50121289497', N'Legnica', N'Wrocławska 20, 86-567')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (30, N'Kacper', N'Foka', N'90120908511', N'Zielona Góra', N'Wiejska 71/4, 94-156')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (31, N'Mirosław', N'Chodura', N'90071585666', N'Dobromierz', N'Kolorowa 10, 58-200')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (32, N'Marek', N'Cholewczyński', N'88071585222', N'Nowy Sącz', N'Bolesława Krzywoustego 8, 87-201')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (33, N'Elżbieta', N'Chomicki', N'50121285000', N'Smolec', N'Rzeczna 9, 86-890')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (34, N'Mateusz', N'Chuchrowski', N'90120907779', N'Kraków', N'Serdeczna 11/9, 34-160')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (35, N'Klementyna', N'Chudziński', N'86091390563', N'Zakopane', N'Henryka Sienkiewicza 49, 68-320')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (36, N'Zygmunt', N'Godlewski', N'58091398433', N'Nowa Ruda', N'Tęczowa 38/7, 70-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (37, N'Albert', N'Gogolewski', N'45062404678', N'Legnica', N'Henryka Brodatego 60/2, 53-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (38, N'Dagmara', N'Golka', N'78062104444', N'Warszawa', N'Długa 10, 60-350')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (39, N'Aleksander', N'Gołębiewski', N'84122178888', N'Darłowo', N'Krótka 39, 54-150')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (40, N'Agata', N'Gombrowicz', N'80121673444', N'Łódź', N'Kręta 29, 50-130')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (41, N'Edward', N'Adamkiewicz', N'90071454649', N'Dobromierz', N'Kolorowa 4, 58-200')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (42, N'Michał', N'Adamowicz', N'88071585878', N'Nowy Sącz', N'Bolesława Chrobrego 45, 87-201')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (43, N'Krystyna', N'Adamowski', N'50121205111', N'Smolec', N'Czerwona 29, 86-890')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (44, N'Kajetan', N'Burzyński', N'90120908999', N'Kraków', N'Serdeczna 74, 34-160')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (45, N'Mirosława', N'Butrymowicz', N'86091356570', N'Warszawa', N'Puszysta 40, 68-700')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (46, N'Zygmunt', N'Dołęga-Zakrzewski', N'58091333354', N'Nowa Ruda', N'Tęczowa 7, 70-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (47, N'Albert', N'Domachowski', N'45062403334', N'Legnica', N'Henryka Brodatego 64/2, 53-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (48, N'Dagmara', N'Domagalski', N'78062123321', N'Warszawa', N'Boczna 10, 60-350')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (49, N'Zygmunt', N'Drągowski', N'84122455530', N'Rzeszów', N'Świdnicka 30, 54-150')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (50, N'Agnieszka', N'Drewniowski', N'80121674567', N'Łódź', N'Owalna 29, 50-130')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (51, N'Amelia', N'Drewnowicz', N'86091395676', N'Warszawa', N'Wałbrzyska 40, 68-326')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (52, N'Jerzy', N'Drewnowski', N'58091393455', N'Gdynia', N'Serdeczna 88/7, 76-310')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (53, N'Michał', N'Drzewiecki', N'45062407773', N'Sopot', N'Henryka Sienkiewicza 92, 59-120')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (54, N'Małgorzata', N'Błach', N'78062156788', N'Smolec', N'Długa 80, 60-359')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (55, N'Kazimierz', N'Błachowski', N'84122145622', N'Świdnica', N'Wrocławska 37, 54-180')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (56, N'Agnieszka', N'Błaszczykowski', N'80121633452', N'Wałbrzych', N'Jeleniogórska 20, 50-145')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (57, N'Andrzej', N'Błażowski', N'90071545600', N'Karpacz', N'Górska 50, 58-289')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (58, N'Robert', N'Bodurka', N'88071534888', N'Jelenia Góra', N'Bolesława Chrobrego 45, 87-245')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (59, N'Agnieszka', N'Boguski', N'50121289567', N'Legnica', N'Wrocławska 26, 86-567')
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (60, N'Kajetan', N'Fikus', N'90120908333', N'Zielona Góra', N'Wiejska 71/9, 94-156')
SET IDENTITY_INSERT [dbo].[client] OFF
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (1, 1)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (2, 2)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (3, 3)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (4, 4)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (5, 5)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (6, 6)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (7, 7)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (8, 8)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (9, 9)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (10, 10)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (11, 11)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (12, 12)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (13, 13)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (14, 14)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (15, 15)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (16, 16)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (17, 17)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (18, 18)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (19, 19)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (20, 20)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (21, 21)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (22, 22)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (23, 23)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (24, 24)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (25, 25)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (26, 26)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (27, 27)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (28, 28)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (29, 29)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (30, 30)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (31, 31)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (32, 32)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (33, 33)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (34, 34)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (35, 35)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (36, 36)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (37, 37)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (38, 38)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (39, 39)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (40, 40)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (41, 41)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (42, 42)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (43, 43)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (44, 44)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (45, 45)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (46, 46)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (47, 47)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (48, 48)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (49, 49)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (50, 50)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (52, 52)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (53, 53)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (54, 54)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (55, 55)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (56, 56)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (57, 57)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (58, 58)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (59, 59)
INSERT [dbo].[client_bridge_procedures] ([client_id], [procedure_id]) VALUES (60, 60)
SET IDENTITY_INSERT [dbo].[debt] ON 

INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (1, CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'MAIN', CAST(300.00 AS Decimal(38, 2)), 1, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (2, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'MAIN', CAST(150.00 AS Decimal(38, 2)), 2, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (3, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 3, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (4, CAST(N'2019-08-14T00:00:00.000' AS DateTime), N'COU', CAST(50.00 AS Decimal(38, 2)), 4, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (5, CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 5, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (6, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'COU', CAST(400.00 AS Decimal(38, 2)), 6, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (7, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'INT', CAST(130.00 AS Decimal(38, 2)), 7, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (8, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'MAIN', CAST(1000.00 AS Decimal(38, 2)), 8, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (9, CAST(N'2018-12-04T00:00:00.000' AS DateTime), N'BTC', CAST(5.00 AS Decimal(38, 2)), 9, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (10, CAST(N'2019-07-24T00:00:00.000' AS DateTime), N'MAIN', CAST(2000.00 AS Decimal(38, 2)), 10, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (11, CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'MAIN', CAST(400.00 AS Decimal(38, 2)), 11, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (12, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'MAIN', CAST(250.00 AS Decimal(38, 2)), 12, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (13, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 13, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (14, CAST(N'2019-08-14T00:00:00.000' AS DateTime), N'COU', CAST(50.00 AS Decimal(38, 2)), 14, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (15, CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 15, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (16, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'COU', CAST(480.00 AS Decimal(38, 2)), 16, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (17, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'INT', CAST(190.00 AS Decimal(38, 2)), 17, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (18, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'MAIN', CAST(100.00 AS Decimal(38, 2)), 18, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (19, CAST(N'2018-12-04T00:00:00.000' AS DateTime), N'BTC', CAST(200.00 AS Decimal(38, 2)), 19, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (20, CAST(N'2019-07-24T00:00:00.000' AS DateTime), N'MAIN', CAST(1000.00 AS Decimal(38, 2)), 20, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (21, CAST(N'2018-11-03T00:00:00.000' AS DateTime), N'COU', CAST(100.00 AS Decimal(38, 2)), 21, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (22, CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 22, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (23, CAST(N'2019-09-15T00:00:00.000' AS DateTime), N'INT', CAST(100.00 AS Decimal(38, 2)), 23, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (24, CAST(N'2019-09-21T00:00:00.000' AS DateTime), N'MAIN', CAST(10.00 AS Decimal(38, 2)), 24, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (25, CAST(N'2019-05-09T00:00:00.000' AS DateTime), N'BTC', CAST(500.00 AS Decimal(38, 2)), 25, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (26, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'MAIN', CAST(200.00 AS Decimal(38, 2)), 26, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (27, CAST(N'2019-04-30T00:00:00.000' AS DateTime), N'MAIN', CAST(420.00 AS Decimal(38, 2)), 27, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (28, CAST(N'2019-06-27T00:00:00.000' AS DateTime), N'MAIN', CAST(20.00 AS Decimal(38, 2)), 28, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (29, CAST(N'2018-12-03T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 29, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (30, CAST(N'2019-07-20T00:00:00.000' AS DateTime), N'COU', CAST(300.00 AS Decimal(38, 2)), 30, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (31, CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'MAIN', CAST(300.00 AS Decimal(38, 2)), 31, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (32, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'MAIN', CAST(150.00 AS Decimal(38, 2)), 32, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (33, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 33, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (34, CAST(N'2019-08-14T00:00:00.000' AS DateTime), N'COU', CAST(50.00 AS Decimal(38, 2)), 34, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (35, CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 35, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (36, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'COU', CAST(400.00 AS Decimal(38, 2)), 36, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (37, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'INT', CAST(130.00 AS Decimal(38, 2)), 37, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (38, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'MAIN', CAST(1000.00 AS Decimal(38, 2)), 38, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (39, CAST(N'2018-12-04T00:00:00.000' AS DateTime), N'BTC', CAST(5.00 AS Decimal(38, 2)), 39, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (40, CAST(N'2019-07-24T00:00:00.000' AS DateTime), N'MAIN', CAST(2000.00 AS Decimal(38, 2)), 40, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (41, CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'MAIN', CAST(400.00 AS Decimal(38, 2)), 41, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (42, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'MAIN', CAST(250.00 AS Decimal(38, 2)), 42, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (43, CAST(N'2019-09-10T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 43, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (44, CAST(N'2019-08-14T00:00:00.000' AS DateTime), N'COU', CAST(50.00 AS Decimal(38, 2)), 44, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (45, CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 45, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (46, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'COU', CAST(480.00 AS Decimal(38, 2)), 46, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (47, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'INT', CAST(190.00 AS Decimal(38, 2)), 47, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (48, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'MAIN', CAST(100.00 AS Decimal(38, 2)), 48, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (49, CAST(N'2018-12-04T00:00:00.000' AS DateTime), N'BTC', CAST(200.00 AS Decimal(38, 2)), 49, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (50, CAST(N'2019-07-24T00:00:00.000' AS DateTime), N'MAIN', CAST(1000.00 AS Decimal(38, 2)), 50, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (52, CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'COU', CAST(200.00 AS Decimal(38, 2)), 52, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (53, CAST(N'2019-09-15T00:00:00.000' AS DateTime), N'INT', CAST(100.00 AS Decimal(38, 2)), 53, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (54, CAST(N'2019-09-21T00:00:00.000' AS DateTime), N'MAIN', CAST(10.00 AS Decimal(38, 2)), 54, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (55, CAST(N'2019-05-09T00:00:00.000' AS DateTime), N'BTC', CAST(500.00 AS Decimal(38, 2)), 55, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (56, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'MAIN', CAST(200.00 AS Decimal(38, 2)), 56, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (57, CAST(N'2019-04-30T00:00:00.000' AS DateTime), N'MAIN', CAST(420.00 AS Decimal(38, 2)), 57, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (58, CAST(N'2019-06-27T00:00:00.000' AS DateTime), N'MAIN', CAST(20.00 AS Decimal(38, 2)), 58, 1)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (59, CAST(N'2018-12-03T00:00:00.000' AS DateTime), N'INT', CAST(50.00 AS Decimal(38, 2)), 59, 0)
INSERT [dbo].[debt] ([debt_id], [debt_date], [debt_type], [debt_amount], [debt_procedure_id], [debt_status]) VALUES (60, CAST(N'2019-07-20T00:00:00.000' AS DateTime), N'COU', CAST(300.00 AS Decimal(38, 2)), 60, 1)
SET IDENTITY_INSERT [dbo].[debt] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (1, N'Ludwig', N'Beethoven', CAST(N'2010-10-10' AS Date), N'beethoven.l', N'ludwig123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (2, N'Bolesław', N'Prus', CAST(N'2012-05-10' AS Date), N'prus.b', N'boleslaw123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (3, N'Janusz', N'Panasewicz', CAST(N'2012-05-05' AS Date), N'panasewicz.j', N'janusz123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (4, N'Dawid', N'Podsiadło', CAST(N'2009-03-10' AS Date), N'podsiadlo.d', N'dawid123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (5, N'Krystyna', N'Pońko', CAST(N'2003-03-10' AS Date), N'pronko.k', N'krystyna123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (6, N'Magdalena', N'Różdżka', CAST(N'2014-10-01' AS Date), N'rozdzka.m', N'magdalena123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (7, N'Andrzej', N'Duda', CAST(N'2010-10-01' AS Date), N'duda.a', N'andrzej123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (8, N'Julia', N'Roberts', CAST(N'2014-12-07' AS Date), N'roberts.j', N'julia123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (9, N'Kinga', N'Rusin', CAST(N'2010-10-07' AS Date), N'rusin.k', N'kinga123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (10, N'Bruce', N'Wayne', CAST(N'2016-06-06' AS Date), N'wayne.b', N'bruce123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (11, N'Edward', N'Wielki', CAST(N'2010-10-10' AS Date), N'wielki.e', N'Edward456')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (12, N'Bolesław', N'Łotr', CAST(N'2012-05-10' AS Date), N'lotr.b', N'Bolesław863')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (13, N'Dariusz', N'Potocki', CAST(N'2012-05-05' AS Date), N'potocki.j', N'Dariusz962')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (14, N'Dawid', N'Mokradło', CAST(N'2009-03-10' AS Date), N'mokradlo.d', N'Dawid943')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (15, N'Krystyna', N'Wędzikowska', CAST(N'2003-03-10' AS Date), N'wedzikowska.k', N'Krystyna732')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (16, N'Katarzyna', N'Twarda', CAST(N'2014-10-01' AS Date), N'twarda.m', N'Katarzyna853')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (17, N'Mieczysław', N'Morawiecki', CAST(N'2010-10-01' AS Date), N'morawiecki.a', N'Mieczysław943')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (18, N'Julia', N'Pstrąg', CAST(N'2014-12-07' AS Date), N'pstrag.j', N'Julia942')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (19, N'Marta', N'Nerwicka', CAST(N'2010-10-07' AS Date), N'nerwicka.k', N'Marta732')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (20, N'Tomasz', N'August', CAST(N'2016-06-06' AS Date), N'august.b', N'Tomasz864')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (21, N'Danuta', N'Krzywa', CAST(N'2008-03-10' AS Date), N'krzywa.j', N'Danuta342')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (22, N'Marta', N'Migdał', CAST(N'2011-10-01' AS Date), N'migdał.k', N'Marta532')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (23, N'Seweryn', N'Dudak', CAST(N'2011-10-01' AS Date), N'dudak.l', N'Seweryn783')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (24, N'Jolanta', N'Zielona', CAST(N'2014-10-07' AS Date), N'zielona.g', N'Jolanta842')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (25, N'Katarzyna', N'Mongolska', CAST(N'2010-10-24' AS Date), N'mongolska.f', N'Katarzyna673')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (26, N'Bartosz', N'Got', CAST(N'2015-06-06' AS Date), N'got.i', N'Bartosz123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (27, N'Emil', N'Waleczny', CAST(N'2009-10-10' AS Date), N'waleczny.l', N'Emil844')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (28, N'Karol', N'Tępak', CAST(N'2011-05-10' AS Date), N'tępak.k', N'Karol842')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (29, N'Dawid', N'Roztoczny', CAST(N'2011-05-05' AS Date), N'roztoczny.n', N'Dawid377')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (30, N'Cezary', N'Zera', CAST(N'2008-03-10' AS Date), N'zera.c', N'Cezary543')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (31, N'Damian', N'Boguszewski', CAST(N'2010-10-10' AS Date), N'Boguszewski642', N'Damian123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (32, N'Damiana', N'Bohosiewicz', CAST(N'2012-05-10' AS Date), N'Bohosiewicz672', N'Damiana123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (33, N'Damroka', N'Bojanowski', CAST(N'2012-05-05' AS Date), N'Bojanowski533', N'Damroka123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (34, N'Daniel', N'Borawski', CAST(N'2009-03-10' AS Date), N'Borawski333', N'Daniel123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (35, N'Amir', N'Borowski', CAST(N'2003-03-10' AS Date), N'Borowski888', N'Amir123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (36, N'Anastazy', N'Janicki', CAST(N'2014-10-01' AS Date), N'Janicki999', N'Anastazy123')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (37, N'Anatol', N'Janiszewski', CAST(N'2010-10-01' AS Date), N'Janiszewski452', N'Anatol654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (38, N'Andrzej', N'Jank', CAST(N'2014-12-07' AS Date), N'Jank643', N'Andrzej654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (39, N'Antoni', N'Jankowski', CAST(N'2010-10-07' AS Date), N'Jankowski643', N'Antoni654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (40, N'Błażej', N'Janowski', CAST(N'2016-06-06' AS Date), N'Janowski222', N'Błażej765')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (41, N'Bogumił', N'Jarczyński', CAST(N'2010-10-10' AS Date), N'Jarczyński764', N'Bogumił876')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (42, N'Bolesław', N'Jarmakowski', CAST(N'2012-05-10' AS Date), N'Jarmakowski865', N'Bolesław654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (43, N'Cyprian', N'Hernik', CAST(N'2012-05-05' AS Date), N'Hernik341', N'Cyprian654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (44, N'Cyryl', N'Hrycyk', CAST(N'2009-03-10' AS Date), N'Hrycyk754', N'Cyryl422')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (45, N'Czesław', N'Dąbkowski', CAST(N'2003-03-10' AS Date), N'Dąbkowski865', N'Czesław765')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (46, N'Erwin', N'Dąbrowski', CAST(N'2014-10-01' AS Date), N'Dąbrowski976', N'Erwin865')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (47, N'Eryk', N'Dębicki', CAST(N'2010-10-01' AS Date), N'Dębicki422', N'Eryk764')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (48, N'Eugeniusz', N'Dębiński', CAST(N'2014-12-07' AS Date), N'Dębiński111', N'Eugeniusz754')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (49, N'Florian', N'Adamkiewicz', CAST(N'2010-10-07' AS Date), N'Adamkiewicz986', N'Florian876')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (50, N'Franciszek', N'Adamowicz', CAST(N'2016-06-06' AS Date), N'Adamowicz976', N'Franciszek854')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (51, N'Fryderyk', N'Adamowski', CAST(N'2008-03-10' AS Date), N'Adamowski753', N'Fryderyk765')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (52, N'Gniewomir', N'Aleksandrowicz', CAST(N'2011-10-01' AS Date), N'Aleksandrowicz986', N'Gniewomir754')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (53, N'Gracjan', N'Alexandrowicz', CAST(N'2011-10-01' AS Date), N'Alexandrowicz422', N'Gracjan543')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (54, N'Grzegorz', N'Gałczyński', CAST(N'2014-10-07' AS Date), N'Gałczyński666', N'Grzegorz433')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (55, N'Gustaw', N'Gałecki', CAST(N'2010-10-24' AS Date), N'Gałecki454', N'Gustaw999')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (56, N'Jerzy', N'Gancarczyk', CAST(N'2015-06-06' AS Date), N'Gancarczyk965', N'Jerzy543')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (57, N'Jędrzej', N'Garbowski', CAST(N'2009-10-10' AS Date), N'Garbowski542', N'Jędrzej654')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (58, N'Joachim', N'Gardocki', CAST(N'2011-05-10' AS Date), N'Gardocki653', N'Joachim321')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (59, N'Joda', N'Gawkowski', CAST(N'2011-05-05' AS Date), N'Gawkowski764', N'Joda543')
INSERT [dbo].[employee] ([employee_id], [employee_first_name], [employee_last_name], [employee_create_date], [employee_login], [employee_password]) VALUES (60, N'Juliusz', N'Dancewicz', CAST(N'2008-03-10' AS Date), N'Dancewicz432', N'Juliusz432')
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[organ] ON 

INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (1, N'Pierwszy Urząd Skarbowy we Wrocławiu', N'Klimasa 34, 50-515 Wrocław', N'administrative', N'PL51101016740000392222000000')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (2, N'ZUS Oddział we Wrocławiu', N'Bernarda Pretficza 11, 50-930 Wrocław', N'administrative', N'PL98007896555000098769000098')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (3, N'Sąd Okręgowy we Wrocławiu', N'Sądowa 1, 50-046 Wrocław', N'judicial', N'PL67800008666688089004335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (4, N'Sąd Okręgowy w Świdnicy', N'plac Grunwaldzki 14, 58-100 Świdnica', N'judicial', N'PL45000978906543200988890007')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (5, N'Sąd Rejonowy w Świdnicy', N'Generała Leopolda Okulickiego 2/4, 58-100 Świdnica', N'judicial', N'PL78999000654334567897775509')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (6, N'Sąd Rejonowy w Wałbrzychu', N'Juliusza Słowackiego 10, 58-300 Wałbrzych', N'judicial', N'PL56999000777766654567890088')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (7, N'ZUS Oddział w Wałbrzychu', N'Kasztanowa 1, 58-390 Wałbrzych', N'administrative', N'PL76990000007775674445678900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (8, N'ZUS Oddział w Legnicy', N'Władysława Grabskiego 26, 59-220 Legnica', N'administrative', N'PL67555000987775554478000066')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (9, N'Urząd Skarbowy w Wałbrzychu', N'Uczniowska 21, 58-306 Wałbrzych', N'administrative', N'PL45666888000098712333455009')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (10, N'Urząd Skarbowy w Świdnicy', N'Marii Skłodowskiej-Curie 1/3, 58-100 Świdnica', N'administrative', N'PL79000766543356789900066756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (11, N'Pierwszy Urząd Skarbowy we Warszawie', N'Tęczowa 34, 60-515 Warszawa', N'administrative', N'PL51101016740000392222000555')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (12, N'ZUS Oddział w Warszawie', N'Bernarda Pretficza 11, 60-930 Warszawa', N'administrative', N'PL98007896555000098769000345')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (13, N'Sąd Okręgowy we Warszawie', N'Różana 1, 60-046 Warszawa', N'judicial', N'PL67800008666689999004335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (14, N'Sąd Okręgowy w Świebodzinie', N'Kolorowa 14, 50-134 Świebodzin', N'judicial', N'PL45000978906543200065890007')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (15, N'Sąd Rejonowy w Strzegomiu', N'Ryżowa 2/4, 59-100 Strzegom', N'judicial', N'PL78999000654334567897775333')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (16, N'Sąd Rejonowy w Łodzi', N'Juliusza Słowackiego 10, 54-300 Łódź', N'judicial', N'PL56999000777766654567890045')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (17, N'ZUS Oddział w Rzeszowie', N'Kasztanowa 1, 67-390 Rzeszów', N'administrative', N'PL76990000007755574445678900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (18, N'ZUS Oddział w Gdańsku', N'Władysława Łokietka 26, 45-220 Gdańsk', N'administrative', N'PL67555000987775554478000454')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (19, N'Urząd Skarbowy w Nowym Sączu', N'Brzoskwiniowa 21, 98-300 Nowy Sącz', N'administrative', N'PL45666888000098712333455356')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (20, N'Urząd Skarbowy w Katowice', N'Bolesława Chrobrego 1/3, 96-190 Katowice', N'administrative', N'PL79000766543335389900066756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (21, N'Sąd Rejonowy w Gdyni', N'Rzeczna 2/7, 88-136 Gdynia', N'judicial', N'PL78999000654334447897775509')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (22, N'Sąd Rejonowy w Sopocie', N'Juliusza Słowackiego 10, 88-399 Sopot', N'judicial', N'PL56999000567766654567890088')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (23, N'ZUS Oddział w Dobromierzu', N'Flagowa 1, 48-376 Dobromierz', N'administrative', N'PL76990000007775446445678900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (24, N'ZUS Oddział w Zielonej Górze', N'Krzaczasta 24, 56-229 Zielona Góra', N'administrative', N'PL67555000987775554347000066')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (25, N'Urząd Skarbowy w Smolcu', N'Uczniowska 81, 77-306 Smolec', N'administrative', N'PL45666888000098712336735009')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (26, N'Urząd Skarbowy w Karpaczu', N'Marii Skłodowskiej-Curie 1, 78-190 Karpacz', N'administrative', N'PL79000766534756789900066756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (27, N'Pierwszy Urząd Skarbowy w Krakowie', N'Drzewna 34, 67-515 Kraków', N'administrative', N'PL51101016740000392257800555')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (28, N'ZUS Oddział w Krakowie', N'Prusa 11, 70-930 Kraków', N'administrative', N'PL98007896555000098345000345')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (29, N'Sąd Okręgowy w Rawiczu', N'Kazimierza Wielkiego 43, 68-146 Rawicz', N'judicial', N'PL67800008665849999004335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (30, N'Sąd Okręgowy w Jeleniej Górze', N'Kolorowa 15, 51-131 Jelenia Góra', N'judicial', N'PL45000978906543211165890007')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (31, N'Pierwszy Urząd Skarbowy w Jeleniej Górze', N'Klimasa 34, 55-515 Jelenia Góra', N'administrative', N'PL51101016740000392222000111')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (32, N'ZUS Oddział w Opolu', N'Bernarda Pretficza 11, 50-930 Opole', N'administrative', N'PL98007896555000034569000098')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (33, N'Sąd Okręgowy w Opolu', N'Sądowa 1, 50-046 Opole', N'judicial', N'PL67800008666685559004335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (34, N'Sąd Okręgowy w Świnoujściu', N'plac Grunwaldzki 14, 58-100 Świnoujście', N'judicial', N'PL45000978906543255588890007')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (35, N'Sąd Rejonowy w Głogowie', N'Generała Leopolda Okulickiego 2/4, 58-100 Głogów', N'judicial', N'PL78999000667834567897775509')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (36, N'Sąd Rejonowy w Lesznie', N'Juliusza Słowackiego 10, 58-300 Leszno', N'judicial', N'PL56999000777766667867890088')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (37, N'ZUS Oddział w Lesznie', N'Kasztanowa 1, 58-390 Leszno', N'administrative', N'PL76990000897775674445678900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (38, N'ZUS Oddział w Sosnowcu', N'Władysława Grabskiego 26, 59-220 Sosnowiec', N'administrative', N'PL67555000987775554475430066')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (39, N'Urząd Skarbowy w Górze', N'Uczniowska 21, 58-306 Góra', N'administrative', N'PL45666888067998712333455009')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (40, N'Urząd Skarbowy w Otwocku', N'Marii Skłodowskiej-Curie 1/3, 58-100 Otwock', N'administrative', N'PL79000766543356789903336756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (41, N'Pierwszy Urząd Skarbowy w Lublinie', N'Tęczowa 34, 60-515 Lublin', N'administrative', N'PL51101016740000392543000555')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (42, N'ZUS Oddział w Lublinie', N'Bernarda Pretficza 11, 60-930 Lublin', N'administrative', N'PL98007896555023598769000345')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (43, N'Sąd Okręgowy w Szczecinie', N'Różana 1, 60-046 Szczecin', N'judicial', N'PL67800008666689994444335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (44, N'Sąd Okręgowy w Jarosławcu', N'Kolorowa 14, 50-134 Jarosławiec', N'judicial', N'PL45000978906544440065890007')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (45, N'Sąd Rejonowy w Trzebnicy', N'Ryżowa 2/4, 59-100 Trzebnica', N'judicial', N'PL78999000654334567897674333')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (46, N'Sąd Rejonowy w Tarnobrzegu', N'Juliusza Słowackiego 10, 54-300 Tarnobrzeg', N'judicial', N'PL56999000777766285567890045')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (47, N'ZUS Oddział w Imbramowicach', N'Kasztanowa 1, 67-390 Imbramowice', N'administrative', N'PL76990000007755574969678900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (48, N'ZUS Oddział w Mietkowie', N'Władysława Łokietka 26, 45-220 Mietków', N'administrative', N'PL67555000987775554038000454')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (49, N'Urząd Skarbowy w Szczecinie', N'Brzoskwiniowa 21, 98-300 Szczecin', N'administrative', N'PL45666888000098712333455556')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (50, N'Urząd Skarbowy w Zakopanem', N'Bolesława Chrobrego 1/3, 96-190 Zakopane', N'administrative', N'PL79000766543335389900345756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (51, N'Sąd Rejonowy w Białce Tatrzańskiej', N'Rzeczna 2/7, 88-136 Białka Tatrzańska', N'judicial', N'PL78999000654334447897767609')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (52, N'Sąd Rejonowy w Szklarskiej Porębie', N'Juliusza Słowackiego 10, 88-399 Szklarska Poręba', N'judicial', N'PL56999000567766654567123088')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (53, N'ZUS Oddział w Chwaliszowie', N'Flagowa 1, 48-376 Chwaliszów', N'administrative', N'PL76990000007775446447778900')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (54, N'ZUS Oddział w Bukowinie Tatrzańskiej', N'Krzaczasta 24, 56-229 Bukowina Tatrzańska', N'administrative', N'PL67555000987775553957000066')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (55, N'Urząd Skarbowy w Żarowie', N'Uczniowska 81, 77-306 Żarów', N'administrative', N'PL45666888004448712336735009')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (56, N'Urząd Skarbowy w Białym Stoku', N'Marii Skłodowskiej-Curie 1, 78-190 Biały Stok', N'administrative', N'PL79000766534756765400066756')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (57, N'Pierwszy Urząd Skarbowy w Lubinie', N'Drzewna 34, 67-515 Lubin', N'administrative', N'PL51101016740453392257800555')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (58, N'ZUS Oddział w Marcinowicach', N'Prusa 11, 70-930 Marcinowice', N'administrative', N'PL98007896555076398345000345')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (59, N'Sąd Okręgowy w Boguszowie', N'Kazimierza Wielkiego 43, 68-146 Boguszów', N'judicial', N'PL67800008662999999004335600')
INSERT [dbo].[organ] ([organ_id], [organ_name], [organ_address], [organ_type], [organ_account_number]) VALUES (60, N'Sąd Okręgowy w Sandomierzu', N'Kolorowa 15, 51-131 Sandomierz', N'judicial', N'PL45000978906543211165222007')
SET IDENTITY_INSERT [dbo].[organ] OFF
SET IDENTITY_INSERT [dbo].[procedures] ON 

INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (1, 1, N'US 150/34', CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (2, 2, N'ZUS 123/39', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 2)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (3, 3, N'SO 111/45', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'ended', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (4, 4, N'SO 110/40', CAST(N'2019-08-14T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (5, 5, N'SR 568/49', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (6, 6, N'SR 400/47', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'canceled', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (7, 7, N'ZUS 700/23', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'canceled', 4)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (8, 8, N'ZUS 790/28', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'ended', 4)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (9, 9, N'US 560/24', CAST(N'2018-12-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (10, 10, N'US 500/33', CAST(N'2019-07-24T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (11, 11, N'US 150/56', CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'ended', 5)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (12, 12, N'ZUS 123/09', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 5)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (13, 13, N'SO 111/33', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'ended', 12)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (14, 14, N'SO 110/12', CAST(N'2019-08-14T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 14)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (15, 15, N'SR 568/08', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 5)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (16, 16, N'SR 900/47', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'canceled', 11)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (17, 17, N'ZUS 799/23', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'canceled', 14)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (18, 18, N'ZUS 890/28', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'ended', 10)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (19, 19, N'US 560/99', CAST(N'2018-12-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'ended', 9)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (20, 20, N'US 500/56', CAST(N'2019-07-24T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'ended', 7)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (21, 21, N'SR 568/47', CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 22)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (22, 22, N'SR 408/47', CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2020-06-10T00:00:00.000' AS DateTime), N'canceled', 23)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (23, 23, N'ZUS 700/26', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-07-16T00:00:00.000' AS DateTime), N'canceled', 22)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (24, 24, N'ZUS 660/28', CAST(N'2019-08-21T00:00:00.000' AS DateTime), CAST(N'2019-11-13T00:00:00.000' AS DateTime), N'ended', 30)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (25, 25, N'US 560/89', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-08-10T00:00:00.000' AS DateTime), N'ended', 30)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (26, 26, N'US 599/33', CAST(N'2019-04-09T00:00:00.000' AS DateTime), CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'ended', 11)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (27, 27, N'US 144/56', CAST(N'2019-04-28T00:00:00.000' AS DateTime), CAST(N'2019-02-19T00:00:00.000' AS DateTime), N'ended', 10)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (28, 28, N'ZUS 123/88', CAST(N'2019-05-27T00:00:00.000' AS DateTime), CAST(N'2020-02-17T00:00:00.000' AS DateTime), N'in_process', 9)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (29, 29, N'SO 155/33', CAST(N'2018-11-03T00:00:00.000' AS DateTime), CAST(N'2019-12-10T00:00:00.000' AS DateTime), N'ended', 21)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (30, 30, N'SO 110/66', CAST(N'2019-07-14T00:00:00.000' AS DateTime), CAST(N'2020-05-10T00:00:00.000' AS DateTime), N'in_process', 21)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (31, 31, N'US 150/45', CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (32, 32, N'ZUS 145/39', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 2)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (33, 33, N'SO 189/45', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'ended', 14)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (34, 34, N'SO 110/44', CAST(N'2019-08-14T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (35, 35, N'SR 538/49', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (36, 36, N'SR 470/47', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'canceled', 10)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (37, 37, N'ZUS 700/20', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'canceled', 4)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (38, 38, N'ZUS 790/26', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'ended', 8)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (39, 39, N'US 564/24', CAST(N'2018-12-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (40, 40, N'US 570/33', CAST(N'2019-07-24T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (41, 41, N'US 155/56', CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'ended', 8)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (42, 42, N'ZUS 123/07', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 5)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (43, 43, N'SO 118/33', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'ended', 12)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (44, 44, N'SO 710/12', CAST(N'2019-08-14T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 60)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (45, 45, N'SR 568/07', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 5)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (46, 46, N'SR 906/47', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'canceled', 11)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (47, 47, N'ZUS 769/23', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'canceled', 50)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (48, 48, N'ZUS 830/28', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'ended', 34)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (49, 49, N'US 567/99', CAST(N'2018-12-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'ended', 57)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (50, 50, N'US 540/56', CAST(N'2019-07-24T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'ended', 45)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (52, 52, N'SR 403/47', CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2020-06-10T00:00:00.000' AS DateTime), N'canceled', 42)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (53, 53, N'ZUS 740/26', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-07-16T00:00:00.000' AS DateTime), N'canceled', 13)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (54, 54, N'ZUS 610/28', CAST(N'2019-08-21T00:00:00.000' AS DateTime), CAST(N'2019-11-13T00:00:00.000' AS DateTime), N'ended', 27)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (55, 55, N'US 565/89', CAST(N'2019-03-09T00:00:00.000' AS DateTime), CAST(N'2019-08-10T00:00:00.000' AS DateTime), N'ended', 60)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (56, 56, N'US 539/33', CAST(N'2019-04-09T00:00:00.000' AS DateTime), CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'ended', 57)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (57, 57, N'US 144/59', CAST(N'2019-04-28T00:00:00.000' AS DateTime), CAST(N'2019-02-19T00:00:00.000' AS DateTime), N'ended', 54)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (58, 58, N'ZUS 123/80', CAST(N'2019-05-27T00:00:00.000' AS DateTime), CAST(N'2020-02-17T00:00:00.000' AS DateTime), N'in_process', 42)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (59, 59, N'SO 155/32', CAST(N'2018-11-03T00:00:00.000' AS DateTime), CAST(N'2019-12-10T00:00:00.000' AS DateTime), N'ended', 49)
INSERT [dbo].[procedures] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (60, 60, N'SO 110/61', CAST(N'2019-07-14T00:00:00.000' AS DateTime), CAST(N'2020-05-10T00:00:00.000' AS DateTime), N'in_process', 35)
SET IDENTITY_INSERT [dbo].[procedures] OFF
SET IDENTITY_INSERT [dbo].[transfer] ON 

INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (1, CAST(N'2018-11-10T00:00:00.000' AS DateTime), 11, N'PL51101016740000392222000000', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (2, CAST(N'2019-10-10T00:00:00.000' AS DateTime), 2, N'PL60370900550000000000000002', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (3, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 13, N'PL67800008666688089004335600', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (4, CAST(N'2019-09-01T00:00:00.000' AS DateTime), 4, N'PL60370900550000000000000004', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (5, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 5, N'PL60370900550000000000000005', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (6, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 6, N'PL60370900550000000000000006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (7, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 7, N'PL60370900550000000000000007', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (8, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 18, N'PL67555000987775554478000066', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (9, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 19, N'PL45666888000098712333455009', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (10, CAST(N'2019-08-10T00:00:00.000' AS DateTime), 20, N'PL79000766543356789900066756', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (11, CAST(N'2018-11-15T00:00:00.000' AS DateTime), 40, N'PL79000766543335389900066756', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (12, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 25, N'PL60370900550000000000440005', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (13, CAST(N'2019-09-10T00:00:00.000' AS DateTime), 39, N'PL45666888000098712333455356', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (14, CAST(N'2019-09-05T00:00:00.000' AS DateTime), 24, N'PL60370900550000000000099004', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (15, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 25, N'PL60370900550000000000440005', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (16, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 26, N'PL60370900550000066000000006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (17, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 27, N'PL60370900550000000000008807', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (18, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 36, N'PL56999000777766654567890045', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (19, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 37, N'PL76990000007755574445678900', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (20, CAST(N'2019-08-10T00:00:00.000' AS DateTime), 38, N'PL67555000987775554478000454', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (21, CAST(N'2018-11-08T00:00:00.000' AS DateTime), 48, N'PL60370900550000770098800008', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (22, CAST(N'2019-10-26T00:00:00.000' AS DateTime), 49, N'PL60370900550004560000980009', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (23, CAST(N'2019-09-19T00:00:00.000' AS DateTime), 50, N'PL60370900550000348900000010', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (24, CAST(N'2019-09-28T00:00:00.000' AS DateTime), 41, N'PL78999000654334447897775509', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (25, CAST(N'2019-04-09T00:00:00.000' AS DateTime), 42, N'PL56999000567766654567890088', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (26, CAST(N'2019-09-11T00:00:00.000' AS DateTime), 43, N'PL76990000007775446445678900', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (27, CAST(N'2019-05-06T00:00:00.000' AS DateTime), 44, N'PL67555000987775554347000066', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (28, CAST(N'2019-06-29T00:00:00.000' AS DateTime), 46, N'PL60370900550000066000454006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (29, CAST(N'2018-12-09T00:00:00.000' AS DateTime), 56, N'PL45666888000098712336735009', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (30, CAST(N'2019-07-27T00:00:00.000' AS DateTime), 47, N'PL60370900550005680000008807', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (31, CAST(N'2018-11-10T00:00:00.000' AS DateTime), 120, N'PL45000978906543211165222007', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (32, CAST(N'2019-10-10T00:00:00.000' AS DateTime), 109, N'PL60370900550004560089080009', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (33, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 118, N'PL98007896555076398345000345', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (34, CAST(N'2019-09-01T00:00:00.000' AS DateTime), 104, N'PL60370900550567045600099004', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (35, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 105, N'PL60370900550005670777440005', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (36, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 106, N'PL60370900550099966000454006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (37, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 107, N'PL60370900550005655500008807', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (38, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 114, N'PL67555000987775553957000066', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (39, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 115, N'PL45666888004448712336735009', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (40, CAST(N'2019-08-10T00:00:00.000' AS DateTime), 116, N'PL79000766534756765400066756', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (41, CAST(N'2018-11-15T00:00:00.000' AS DateTime), 117, N'PL51101016740453392257800555', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (42, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 103, N'PL60370900550000067400110003', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (43, CAST(N'2019-09-10T00:00:00.000' AS DateTime), 100, N'PL79000766543335389900345756', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (44, CAST(N'2019-09-05T00:00:00.000' AS DateTime), 86, N'PL60370900550000066000568006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (45, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 87, N'PL60370900550000005790008807', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (46, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 88, N'PL60370900550000774670000008', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (47, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 89, N'PL60370900550000895000980009', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (48, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 96, N'PL56999000777766285567890045', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (49, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 97, N'PL76990000007755574969678900', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (50, CAST(N'2019-08-10T00:00:00.000' AS DateTime), 98, N'PL67555000987775554038000454', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (51, CAST(N'2018-11-08T00:00:00.000' AS DateTime), 80, N'PL60370900550000550009870001', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (52, CAST(N'2019-10-26T00:00:00.000' AS DateTime), 81, N'PL60370900550000000990348002', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (53, CAST(N'2019-09-19T00:00:00.000' AS DateTime), 82, N'PL60370900550000494000110003', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (54, CAST(N'2019-09-28T00:00:00.000' AS DateTime), 41, N'PL78999000654334447897775509', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (55, CAST(N'2019-04-09T00:00:00.000' AS DateTime), 42, N'PL56999000567766654567890088', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (56, CAST(N'2019-09-11T00:00:00.000' AS DateTime), 43, N'PL76990000007775446445678900', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (57, CAST(N'2019-05-06T00:00:00.000' AS DateTime), 44, N'PL67555000987775554347000066', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (58, CAST(N'2019-06-29T00:00:00.000' AS DateTime), 46, N'PL60370900550000066000454006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (59, CAST(N'2018-12-09T00:00:00.000' AS DateTime), 56, N'PL45666888000098712336735009', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (60, CAST(N'2019-07-27T00:00:00.000' AS DateTime), 47, N'PL60370900550005680000008807', N'IN')
SET IDENTITY_INSERT [dbo].[transfer] OFF
/****** Object:  Index [unique_client_PESEL]    Script Date: 12.12.2019 15:59:21 ******/
ALTER TABLE [dbo].[client] ADD  CONSTRAINT [unique_client_PESEL] UNIQUE NONCLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [unique_employee_login]    Script Date: 12.12.2019 15:59:21 ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [unique_employee_login] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_account_create_data]  DEFAULT (getdate()) FOR [account_create_data]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_account_balance]  DEFAULT ((0.00)) FOR [account_balance]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_account_currency]  DEFAULT ('PLN') FOR [account_currency]
GO
ALTER TABLE [dbo].[debt] ADD  CONSTRAINT [DF_debt_debt_date]  DEFAULT (getdate()) FOR [debt_date]
GO
ALTER TABLE [dbo].[debt] ADD  CONSTRAINT [DF_debt_debt_amount]  DEFAULT ((0.00)) FOR [debt_amount]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_employee_employee_create_date]  DEFAULT (getdate()) FOR [employee_create_date]
GO
ALTER TABLE [dbo].[transfer] ADD  CONSTRAINT [DF_transfer_transfer_date]  DEFAULT (getdate()) FOR [transfer_date]
GO
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_client_id] FOREIGN KEY([account_client_id])
REFERENCES [dbo].[client] ([client_id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_client_id]
GO
ALTER TABLE [dbo].[account_bridge_procedures]  WITH CHECK ADD  CONSTRAINT [FK_account_bridge_procedure_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[account_bridge_procedures] CHECK CONSTRAINT [FK_account_bridge_procedure_account_id]
GO
ALTER TABLE [dbo].[account_bridge_procedures]  WITH CHECK ADD  CONSTRAINT [FK_account_bridge_procedure_procedure_id] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[procedures] ([procedure_id])
GO
ALTER TABLE [dbo].[account_bridge_procedures] CHECK CONSTRAINT [FK_account_bridge_procedure_procedure_id]
GO
ALTER TABLE [dbo].[client_bridge_procedures]  WITH CHECK ADD  CONSTRAINT [FK_client_bridge_procedure_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO
ALTER TABLE [dbo].[client_bridge_procedures] CHECK CONSTRAINT [FK_client_bridge_procedure_client_id]
GO
ALTER TABLE [dbo].[client_bridge_procedures]  WITH CHECK ADD  CONSTRAINT [FK_client_bridge_procedure_procedure_id] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[procedures] ([procedure_id])
GO
ALTER TABLE [dbo].[client_bridge_procedures] CHECK CONSTRAINT [FK_client_bridge_procedure_procedure_id]
GO
ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [FK_debt_procedure_id] FOREIGN KEY([debt_procedure_id])
REFERENCES [dbo].[procedures] ([procedure_id])
GO
ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [FK_debt_procedure_id]
GO
ALTER TABLE [dbo].[procedures]  WITH CHECK ADD  CONSTRAINT [FK_procedure_employee_id] FOREIGN KEY([procedure_employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[procedures] CHECK CONSTRAINT [FK_procedure_employee_id]
GO
ALTER TABLE [dbo].[procedures]  WITH CHECK ADD  CONSTRAINT [FK_procedure_organ_id] FOREIGN KEY([procedure_organ_id])
REFERENCES [dbo].[organ] ([organ_id])
GO
ALTER TABLE [dbo].[procedures] CHECK CONSTRAINT [FK_procedure_organ_id]
GO
ALTER TABLE [dbo].[transfer]  WITH CHECK ADD  CONSTRAINT [FK_transfer_account_id] FOREIGN KEY([transfer_from_account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[transfer] CHECK CONSTRAINT [FK_transfer_account_id]
GO
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [CK_account_type] CHECK  (([account_type]='PER' OR [account_type]='SAV' OR [account_type]='FCUR' OR [account_type]='TBL'))
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [CK_account_type]
GO
ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [CK_debt_amount] CHECK  (([debt_amount]>=(0.00)))
GO
ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [CK_debt_amount]
GO
ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [CK_debt_type] CHECK  (([debt_type]='MAIN' OR [debt_type]='INT' OR [debt_type]='EFEE' OR [debt_type]='COU' OR [debt_type]='BTC'))
GO
ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [CK_debt_type]
GO
ALTER TABLE [dbo].[organ]  WITH CHECK ADD  CONSTRAINT [CK_organ_type] CHECK  (([organ_type]='judicial' OR [organ_type]='administrative'))
GO
ALTER TABLE [dbo].[organ] CHECK CONSTRAINT [CK_organ_type]
GO
ALTER TABLE [dbo].[procedures]  WITH CHECK ADD  CONSTRAINT [CK_procedure_status] CHECK  (([procedure_status]='in_process' OR [procedure_status]='canceled' OR [procedure_status]='updated' OR [procedure_status]='ended'))
GO
ALTER TABLE [dbo].[procedures] CHECK CONSTRAINT [CK_procedure_status]
GO
ALTER TABLE [dbo].[transfer]  WITH CHECK ADD  CONSTRAINT [CK_transfer_type] CHECK  (([transfer_type]='IN' OR [transfer_type]='OUT'))
GO
ALTER TABLE [dbo].[transfer] CHECK CONSTRAINT [CK_transfer_type]
GO
USE [master]
GO
ALTER DATABASE [bank_executinv3] SET  READ_WRITE 
GO
