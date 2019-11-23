USE [bank_execution]
GO
/****** Object:  Table [dbo].[account]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[account_bridge_procedure]    Script Date: 17.11.2019 14:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_bridge_procedure](
	[account_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[client_bridge_procedure]    Script Date: 17.11.2019 14:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_bridge_procedure](
	[client_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[debt]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[organ]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[procedure]    Script Date: 17.11.2019 14:48:44 ******/
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
/****** Object:  Table [dbo].[transfer]    Script Date: 17.11.2019 14:48:44 ******/
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

INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (1, 1, N'PL60370900557880004933376909', CAST(N'2010-10-15' AS Date), CAST(N'2020-09-03' AS Date), N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (16, 1, N'PL60370900557880004933376909', CAST(N'2010-10-15' AS Date), NULL, N'PER', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (17, 2, N'PL60370900550000066676555098', CAST(N'2005-09-15' AS Date), NULL, N'PER', CAST(20000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (18, 3, N'PL60370900555553211198777095', CAST(N'2000-09-19' AS Date), NULL, N'SAV', CAST(8976.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (19, 4, N'PL60370900551119600055594876', CAST(N'2001-05-04' AS Date), NULL, N'SAV', CAST(12670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (20, 5, N'PL60370900550000543337895641', CAST(N'2011-03-04' AS Date), NULL, N'PER', CAST(4000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (21, 6, N'PL60370900558888666777006666', CAST(N'2010-11-09' AS Date), CAST(N'2020-09-03' AS Date), N'PER', CAST(9000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (22, 7, N'PL60370900554589053267789094', CAST(N'2000-11-09' AS Date), CAST(N'2020-09-10' AS Date), N'SAV', CAST(5670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (23, 8, N'PL60370900554589053267700007', CAST(N'2009-07-08' AS Date), CAST(N'2020-08-10' AS Date), N'SAV', CAST(23400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (24, 9, N'PL60370900559088866111122232', CAST(N'2006-07-02' AS Date), CAST(N'2020-04-10' AS Date), N'PER', CAST(2590.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (25, 10, N'PL60370900555567844400006657', CAST(N'2000-07-02' AS Date), CAST(N'2020-09-16' AS Date), N'SAV', CAST(5600.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (26, 1, N'PL60370900550000000000000001', CAST(N'2018-10-01' AS Date), NULL, N'TBL', CAST(500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (27, 2, N'PL60370900550000000000000002', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(1000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (28, 3, N'PL60370900550000000000000003', CAST(N'2019-09-01' AS Date), NULL, N'TBL', CAST(670.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (29, 4, N'PL60370900550000000000000004', CAST(N'2019-08-01' AS Date), NULL, N'TBL', CAST(2000.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (30, 5, N'PL60370900550000000000000005', CAST(N'2019-03-01' AS Date), NULL, N'TBL', CAST(2500.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (31, 6, N'PL60370900550000000000000006', CAST(N'2019-04-01' AS Date), NULL, N'TBL', CAST(780.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (32, 7, N'PL60370900550000000000000007', CAST(N'2019-04-20' AS Date), NULL, N'TBL', CAST(1200.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (33, 8, N'PL60370900550000000000000008', CAST(N'2019-05-20' AS Date), NULL, N'TBL', CAST(1250.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (34, 9, N'PL60370900550000000000000009', CAST(N'2018-12-03' AS Date), NULL, N'TBL', CAST(400.00 AS Decimal(38, 2)), N'PLN')
INSERT [dbo].[account] ([account_id], [account_client_id], [account_number], [account_create_data], [account_close_data], [account_type], [account_balance], [account_currency]) VALUES (36, 10, N'PL60370900550000000000000010', CAST(N'2019-07-01' AS Date), NULL, N'TBL', CAST(3400.00 AS Decimal(38, 2)), N'PLN')
SET IDENTITY_INSERT [dbo].[account] OFF
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (26, 1)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (27, 2)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (28, 3)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (29, 4)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (30, 5)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (31, 6)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (32, 7)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (33, 8)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (34, 9)
INSERT [dbo].[account_bridge_procedure] ([account_id], [procedure_id]) VALUES (36, 10)
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
INSERT [dbo].[client] ([client_id], [client_first_name], [client_last_name], [client_PESEL], [client_city], [client_address]) VALUES (10, N'Agnieszka', N'Ostrowska', N'80121673402', N'Świebodzin', N'Bolesława Chrobrego 10/8, 45-679')
SET IDENTITY_INSERT [dbo].[client] OFF
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (1, 1)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (2, 2)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (3, 3)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (4, 4)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (5, 5)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (6, 6)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (7, 7)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (8, 8)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (9, 9)
INSERT [dbo].[client_bridge_procedure] ([client_id], [procedure_id]) VALUES (10, 10)
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
SET IDENTITY_INSERT [dbo].[organ] OFF
SET IDENTITY_INSERT [dbo].[procedure] ON 

INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (1, 1, N'US 150/34', CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (2, 2, N'ZUS 123/39', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 2)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (3, 3, N'SO 111/45', CAST(N'2019-09-10T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'ended', 3)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (4, 4, N'SO 110/40', CAST(N'2019-08-14T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (5, 5, N'SR 568/49', CAST(N'2019-03-07T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'in_process', 3)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (6, 6, N'SR 400/47', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'canceled', 3)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (7, 7, N'ZUS 700/23', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'canceled', 4)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (8, 8, N'ZUS 790/28', CAST(N'2019-05-23T00:00:00.000' AS DateTime), CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'ended', 4)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (9, 9, N'US 560/24', CAST(N'2018-12-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'ended', 1)
INSERT [dbo].[procedure] ([procedure_id], [procedure_organ_id], [procedure_sign], [procedure_start_date], [procedure_end_date], [procedure_status], [procedure_employee_id]) VALUES (10, 10, N'US 500/08', CAST(N'2019-07-24T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'ended', 1)
SET IDENTITY_INSERT [dbo].[procedure] OFF
SET IDENTITY_INSERT [dbo].[transfer] ON 

INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (1, CAST(N'2018-11-10T00:00:00.000' AS DateTime), 26, N'PL51101016740000392222000000', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (3, CAST(N'2019-10-10T00:00:00.000' AS DateTime), 17, N'PL60370900550000000000000002', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (4, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 28, N'PL67800008666688089004335600', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (5, CAST(N'2019-09-01T00:00:00.000' AS DateTime), 19, N'PL60370900550000000000000004', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (6, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 20, N'PL60370900550000000000000005', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (7, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 21, N'PL60370900550000000000000006', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (8, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 22, N'PL60370900550000000000000007', N'IN')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (9, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 33, N'PL67555000987775554478000066', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (10, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 34, N'PL45666888000098712333455009', N'OUT')
INSERT [dbo].[transfer] ([transfer_id], [transfer_date], [transfer_from_account_id], [transfer_to_account_number], [transfer_type]) VALUES (11, CAST(N'2019-08-10T00:00:00.000' AS DateTime), 36, N'PL79000766543356789900066756', N'OUT')
SET IDENTITY_INSERT [dbo].[transfer] OFF
/****** Object:  Index [unique_client_PESEL]    Script Date: 17.11.2019 14:48:44 ******/
ALTER TABLE [dbo].[client] ADD  CONSTRAINT [unique_client_PESEL] UNIQUE NONCLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [unique_employee_login]    Script Date: 17.11.2019 14:48:44 ******/
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
ALTER TABLE [dbo].[procedure]  WITH CHECK ADD  CONSTRAINT [CK_procedure_status] CHECK  (([procedure_status]='in_process' OR [procedure_status]='canceled' OR [procedure_status]='updated' OR [procedure_status]='ended'))
GO
ALTER TABLE [dbo].[procedure] CHECK CONSTRAINT [CK_procedure_status]
GO
ALTER TABLE [dbo].[transfer]  WITH CHECK ADD  CONSTRAINT [CK_transfer_type] CHECK  (([transfer_type]='IN' OR [transfer_type]='OUT'))
GO
ALTER TABLE [dbo].[transfer] CHECK CONSTRAINT [CK_transfer_type]
GO
