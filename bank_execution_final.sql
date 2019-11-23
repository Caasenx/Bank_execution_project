USE [master]
GO
/****** Object:  Database [bank_execution]    Script Date: 2019-11-11 09:19:39 ******/
CREATE DATABASE [bank_execution]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bank_execution', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bank_execution.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bank_execution_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bank_execution_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bank_execution] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bank_execution].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bank_execution] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bank_execution] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bank_execution] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bank_execution] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bank_execution] SET ARITHABORT OFF 
GO
ALTER DATABASE [bank_execution] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bank_execution] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bank_execution] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bank_execution] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bank_execution] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bank_execution] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bank_execution] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bank_execution] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bank_execution] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bank_execution] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bank_execution] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bank_execution] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bank_execution] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bank_execution] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bank_execution] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bank_execution] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bank_execution] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bank_execution] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bank_execution] SET  MULTI_USER 
GO
ALTER DATABASE [bank_execution] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bank_execution] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bank_execution] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bank_execution] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bank_execution] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bank_execution', N'ON'
GO
ALTER DATABASE [bank_execution] SET QUERY_STORE = OFF
GO
USE [bank_execution]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2019-11-11 09:19:39 ******/
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
/****** Object:  Table [dbo].[account_bridge_procedure]    Script Date: 2019-11-11 09:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_bridge_procedure](
	[account_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 2019-11-11 09:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_client_PESEL] UNIQUE NONCLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_bridge_procedure]    Script Date: 2019-11-11 09:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_bridge_procedure](
	[client_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[debt]    Script Date: 2019-11-11 09:19:40 ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 2019-11-11 09:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_employee_login] UNIQUE NONCLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organ]    Script Date: 2019-11-11 09:19:40 ******/
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
/****** Object:  Table [dbo].[procedure]    Script Date: 2019-11-11 09:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedure](
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
/****** Object:  Table [dbo].[transfer]    Script Date: 2019-11-11 09:19:40 ******/
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
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_client_id] FOREIGN KEY([account_client_id])
REFERENCES [dbo].[client] ([client_id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_client_id]
GO
ALTER TABLE [dbo].[account_bridge_procedure]  WITH CHECK ADD  CONSTRAINT [FK_account_bridge_procedure_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[account_bridge_procedure] CHECK CONSTRAINT [FK_account_bridge_procedure_account_id]
GO
ALTER TABLE [dbo].[account_bridge_procedure]  WITH CHECK ADD  CONSTRAINT [FK_account_bridge_procedure_procedure_id] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[procedure] ([procedure_id])
GO
ALTER TABLE [dbo].[account_bridge_procedure] CHECK CONSTRAINT [FK_account_bridge_procedure_procedure_id]
GO
ALTER TABLE [dbo].[client_bridge_procedure]  WITH CHECK ADD  CONSTRAINT [FK_client_bridge_procedure_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([client_id])
GO
ALTER TABLE [dbo].[client_bridge_procedure] CHECK CONSTRAINT [FK_client_bridge_procedure_client_id]
GO
ALTER TABLE [dbo].[client_bridge_procedure]  WITH CHECK ADD  CONSTRAINT [FK_client_bridge_procedure_procedure_id] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[procedure] ([procedure_id])
GO
ALTER TABLE [dbo].[client_bridge_procedure] CHECK CONSTRAINT [FK_client_bridge_procedure_procedure_id]
GO
ALTER TABLE [dbo].[debt]  WITH CHECK ADD  CONSTRAINT [FK_debt_procedure_id] FOREIGN KEY([debt_procedure_id])
REFERENCES [dbo].[procedure] ([procedure_id])
GO
ALTER TABLE [dbo].[debt] CHECK CONSTRAINT [FK_debt_procedure_id]
GO
ALTER TABLE [dbo].[procedure]  WITH CHECK ADD  CONSTRAINT [FK_procedure_employee_id] FOREIGN KEY([procedure_employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[procedure] CHECK CONSTRAINT [FK_procedure_employee_id]
GO
ALTER TABLE [dbo].[procedure]  WITH CHECK ADD  CONSTRAINT [FK_procedure_organ_id] FOREIGN KEY([procedure_organ_id])
REFERENCES [dbo].[organ] ([organ_id])
GO
ALTER TABLE [dbo].[procedure] CHECK CONSTRAINT [FK_procedure_organ_id]
GO
ALTER TABLE [dbo].[transfer]  WITH CHECK ADD  CONSTRAINT [FK_transfer_account_id] FOREIGN KEY([transfer_from_account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[transfer] CHECK CONSTRAINT [FK_transfer_account_id]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [CK_account_type] CHECK  (([account_type]='PER' OR [account_type]='SAV' OR [account_type]='FCUR' OR [account_type]='TBL'))
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
ALTER TABLE [dbo].[procedure]  WITH CHECK ADD  CONSTRAINT [CK_procedure_status] CHECK  (([procedure_status]='in_process' OR [procedure_status]='canceled' OR [procedure_status]='updated' OR [procedure_status]='ended'))
GO
ALTER TABLE [dbo].[procedure] CHECK CONSTRAINT [CK_procedure_status]
GO
ALTER TABLE [dbo].[transfer]  WITH CHECK ADD  CONSTRAINT [CK_transfer_type] CHECK  (([transfer_type]='IN' OR [transfer_type]='OUT'))
GO
ALTER TABLE [dbo].[transfer] CHECK CONSTRAINT [CK_transfer_type]
GO
USE [master]
GO
ALTER DATABASE [bank_execution] SET  READ_WRITE 
GO
