USE [master]
GO
/****** Object:  Database [kilimo]    Script Date: 6/15/2022 2:18:58 PM ******/
CREATE DATABASE [kilimo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kilimo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\kilimo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kilimo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\kilimo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kilimo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kilimo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kilimo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kilimo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kilimo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kilimo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kilimo] SET ARITHABORT OFF 
GO
ALTER DATABASE [kilimo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kilimo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kilimo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kilimo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kilimo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kilimo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kilimo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kilimo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kilimo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kilimo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kilimo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kilimo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kilimo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kilimo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kilimo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kilimo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kilimo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kilimo] SET RECOVERY FULL 
GO
ALTER DATABASE [kilimo] SET  MULTI_USER 
GO
ALTER DATABASE [kilimo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kilimo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kilimo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kilimo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kilimo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kilimo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kilimo', N'ON'
GO
ALTER DATABASE [kilimo] SET QUERY_STORE = OFF
GO
USE [kilimo]
GO
/****** Object:  Table [dbo].[Streams]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streams](
	[StreamID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[StreamCode] [nvarchar](50) NOT NULL,
	[SreamName] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[InterfaceDatetime] [datetime] NULL,
	[DatabaseDatetime] [datetime] NULL,
	[Valid] [bit] NULL,
	[Deleted] [bit] NULL,
	[DateDeleted] [date] NULL,
	[DeletedBy] [nvarchar](max) NULL,
 CONSTRAINT [ClassStreamTable] PRIMARY KEY CLUSTERED 
(
	[StreamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTable]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTable](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[StreamID] [int] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[InterfaceDatetime] [datetime] NULL,
	[DatabaseDatetime] [datetime] NULL,
	[Valid] [bit] NULL,
	[Deleted] [bit] NULL,
	[DateDeleted] [date] NULL,
	[DeletedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_UBSCRR00005] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UBSADM00002]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UBSADM00002](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UBSADM00002] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UBSADM10000]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UBSADM10000](
	[ChangeLogId] [uniqueidentifier] NOT NULL,
	[ChangedTable] [nvarchar](max) NULL,
	[DataReferenceId] [nvarchar](max) NULL,
	[WhatData] [nvarchar](50) NULL,
	[PreChangeData] [nvarchar](max) NULL,
	[PostChangeData] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[BranchId] [int] NULL,
	[TransactionCode] [nvarchar](max) NULL,
	[DatabaseDateChanged] [datetime] NULL,
	[InterfaceDateChanged] [datetime] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UBSADM10002]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UBSADM10002](
	[UserLogId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[IPAddress] [nvarchar](max) NULL,
	[OperationCode] [nvarchar](max) NULL,
	[OperationDescription] [nvarchar](max) NULL,
	[ActionOnTable] [nvarchar](max) NULL,
	[ActionTableReference] [nvarchar](max) NULL,
	[SourcePage] [nvarchar](max) NULL,
	[SourceUrl] [nvarchar](max) NULL,
	[TheData] [nvarchar](max) NULL,
	[InterfaceDate] [datetime] NULL,
	[DatabaseTime] [datetime] NULL,
	[LogDatabaseTime] [datetime] NULL,
	[IsInsert] [bit] NULL,
	[IsUpdate] [bit] NULL,
	[IsGet] [bit] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UBSADM10005]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UBSADM10005](
	[ResponseID] [int] IDENTITY(1,1) NOT NULL,
	[ResponseCode] [nvarchar](50) NULL,
	[ResponseDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UBSADMOOOO1]    Script Date: 6/15/2022 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UBSADMOOOO1](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UBSADMOOOO1] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Streams] ON 

INSERT [dbo].[Streams] ([StreamID], [CompanyID], [BranchID], [StreamCode], [SreamName], [Username], [IpAddress], [InterfaceDatetime], [DatabaseDatetime], [Valid], [Deleted], [DateDeleted], [DeletedBy]) VALUES (1, 1, 1, N'1A', N'1A', N'DAVID', N'127.456.56', NULL, CAST(N'2022-06-15T13:10:12.343' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[Streams] ([StreamID], [CompanyID], [BranchID], [StreamCode], [SreamName], [Username], [IpAddress], [InterfaceDatetime], [DatabaseDatetime], [Valid], [Deleted], [DateDeleted], [DeletedBy]) VALUES (2, 1, 1, N'1B', N'FORM1B', N'DAVID', N'123.56.234', NULL, CAST(N'2022-06-15T13:11:48.723' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Streams] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentTable] ON 

INSERT [dbo].[StudentTable] ([StudentID], [CompanyID], [BranchID], [StudentName], [StreamID], [Username], [IpAddress], [InterfaceDatetime], [DatabaseDatetime], [Valid], [Deleted], [DateDeleted], [DeletedBy]) VALUES (1, 1, 1, N'Dennis', 1, N'David', N'123.234.45', NULL, CAST(N'2022-06-15T14:13:40.460' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[StudentTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UBSADM00002] ON 

INSERT [dbo].[UBSADM00002] ([BranchID], [BranchName]) VALUES (1, N'TENTE')
SET IDENTITY_INSERT [dbo].[UBSADM00002] OFF
GO
INSERT [dbo].[UBSADM10000] ([ChangeLogId], [ChangedTable], [DataReferenceId], [WhatData], [PreChangeData], [PostChangeData], [UserName], [IpAddress], [BranchId], [TransactionCode], [DatabaseDateChanged], [InterfaceDateChanged], [CompanyId]) VALUES (N'9cbe5b77-f3ee-4ce2-9eae-406311649188', N'StudentTable', NULL, N'UPDATE_STUDENT_DETAILS', NULL, NULL, N'David', N'123.234.45', 1, N'TYUUIISDS', CAST(N'2022-06-15T14:13:40.460' AS DateTime), NULL, 1)
INSERT [dbo].[UBSADM10000] ([ChangeLogId], [ChangedTable], [DataReferenceId], [WhatData], [PreChangeData], [PostChangeData], [UserName], [IpAddress], [BranchId], [TransactionCode], [DatabaseDateChanged], [InterfaceDateChanged], [CompanyId]) VALUES (N'f7bb090a-b607-4280-b528-6b813294a17b', N'Streams', NULL, N'UPDATE_STREAM_DETAILS', NULL, NULL, N'DAVID', N'127.456.56', 1, N'DFGHJK6653D', CAST(N'2022-06-15T13:10:12.343' AS DateTime), NULL, 1)
INSERT [dbo].[UBSADM10000] ([ChangeLogId], [ChangedTable], [DataReferenceId], [WhatData], [PreChangeData], [PostChangeData], [UserName], [IpAddress], [BranchId], [TransactionCode], [DatabaseDateChanged], [InterfaceDateChanged], [CompanyId]) VALUES (N'23c5a2c8-098a-4431-86ed-e580f311d5f4', N'Streams', NULL, N'UPDATE_STREAM_DETAILS', NULL, NULL, N'DAVID', N'123.56.234', 1, N'FGHJK674DFGGH', CAST(N'2022-06-15T13:11:48.723' AS DateTime), NULL, 1)
INSERT [dbo].[UBSADM10000] ([ChangeLogId], [ChangedTable], [DataReferenceId], [WhatData], [PreChangeData], [PostChangeData], [UserName], [IpAddress], [BranchId], [TransactionCode], [DatabaseDateChanged], [InterfaceDateChanged], [CompanyId]) VALUES (N'220165ff-08c5-49a0-9953-f255702d10c1', N'StudentTable', N'CustomerID', N'UPDATE_STUDENT_DETAILS', NULL, NULL, N'DAVID', N'123.56.456', 1, N'ERTYUPIH', CAST(N'2022-06-15T14:15:20.007' AS DateTime), NULL, 1)
GO
INSERT [dbo].[UBSADM10002] ([UserLogId], [UserName], [IPAddress], [OperationCode], [OperationDescription], [ActionOnTable], [ActionTableReference], [SourcePage], [SourceUrl], [TheData], [InterfaceDate], [DatabaseTime], [LogDatabaseTime], [IsInsert], [IsUpdate], [IsGet], [CompanyId]) VALUES (N'0b3d3dce-c2b4-40e9-a5ca-6b8819ace278', N'DAVID', N'127.456.56', N'ADDED_STREAM_DETAILS', N'STREAM_DETAILS_ALREADY_ADDED', N'Streams', NULL, N'WEB', N'URL', NULL, NULL, CAST(N'2022-06-15T13:10:12.343' AS DateTime), CAST(N'2022-06-15T13:10:12.523' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[UBSADM10002] ([UserLogId], [UserName], [IPAddress], [OperationCode], [OperationDescription], [ActionOnTable], [ActionTableReference], [SourcePage], [SourceUrl], [TheData], [InterfaceDate], [DatabaseTime], [LogDatabaseTime], [IsInsert], [IsUpdate], [IsGet], [CompanyId]) VALUES (N'4f12dded-3762-4317-b5ed-aaedaf082560', N'David', N'123.234.45', N'ADDED_STUDENT_DETAILS', N'STUDENT_DETAILS_ALREADY_ADDED', N'UBSCRR00005', NULL, N'web', N'url', NULL, NULL, CAST(N'2022-06-15T14:13:40.460' AS DateTime), CAST(N'2022-06-15T14:13:40.477' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[UBSADM10002] ([UserLogId], [UserName], [IPAddress], [OperationCode], [OperationDescription], [ActionOnTable], [ActionTableReference], [SourcePage], [SourceUrl], [TheData], [InterfaceDate], [DatabaseTime], [LogDatabaseTime], [IsInsert], [IsUpdate], [IsGet], [CompanyId]) VALUES (N'7bfe6011-509e-4c33-8732-d9fe8ec7700b', N'DAVID', N'123.56.456', N'UPDATED_STUDENT_DETAILS', N'UPDATED_STUDENT_DETAILS', N'StudentTable', N'0725533', N'WEB', N'URL', NULL, NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2022-06-15T14:15:20.010' AS DateTime), 1, 0, 0, 1)
INSERT [dbo].[UBSADM10002] ([UserLogId], [UserName], [IPAddress], [OperationCode], [OperationDescription], [ActionOnTable], [ActionTableReference], [SourcePage], [SourceUrl], [TheData], [InterfaceDate], [DatabaseTime], [LogDatabaseTime], [IsInsert], [IsUpdate], [IsGet], [CompanyId]) VALUES (N'aeca429e-20f2-44f8-b982-fcfdf3911387', N'DAVID', N'123.56.234', N'ADDED_STREAM_DETAILS', N'STREAM_DETAILS_ALREADY_ADDED', N'Streams', NULL, N'WEB', N'URL', NULL, NULL, CAST(N'2022-06-15T13:11:48.723' AS DateTime), CAST(N'2022-06-15T13:11:48.730' AS DateTime), 0, 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[UBSADM10005] ON 

INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (1, N'000', N'Operation Succeeded')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (2, N'001', N'Data Already Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (3, N'002', N'Code Already Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (4, N'003', N'Account Opening cannot be less than the Client Registration date.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (5, N'004', N'Account Activation date cannot be less than the Account Opening date.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (6, N'005', N'Operation Failed. Check System Logs for More Information')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (7, N'006', N'Kin Registration Date cannot be less than the Client Registration Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (8, N'010', N'Your account is Locked out.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (9, N'011', N'Your Account is Suspended')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (10, N'012', N'You are already logged in from another Terminal')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (11, N'013', N'Invalid Login Credentials')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (12, N'014', N'Session Ended')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (13, N'015', N'Session Is Active')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (14, N'020', N'Future dates are not Allowed')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (15, N'021', N'National ID Already Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (16, N'022', N'Tax PIN already Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (17, N'023', N'External ID Already Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (18, N'050', N'Operation Succeeded, Awaiting Approval')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (19, N'090', N'Suspension Date cannot be Greater than the Account Activation Date.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (20, N'091', N'Account is Already Suspended.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (21, N'092', N'Please ensure that the account balance is Zero before Closure.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (22, N'093', N'Closure Date cannot be Greater than the Account Activation Date.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (23, N'094', N'Account is Already Closed.')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (24, N'095', N'Invalid Transaction Data')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (25, N'096', N'Insufficient Funds')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (26, N'097', N'Transaction Date Cannot be Greater than the Account Opening Date/Activation Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (27, N'098', N'Receipt Could not be Generated - Transaction Terminated')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (28, N'099', N'Transaction Could Not Be Saved')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (29, N'100', N'Ledger is Configured')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (30, N'101', N'Ledger Mapping For this Operation is Missing')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (31, N'102', N'Interest Accrual Ledger Mapping is Missing')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (32, N'103', N'Loan Payment Transaction Ledger Mapping is Missing')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (33, N'104', N'Interest Payment Operation Ledger Mapping is Missing')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (34, N'110', N'Financial Year Exists')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (35, N'111', N'Financial Year Soes Not Exist')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (36, N'112', N'Financial Year is Closed')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (37, N'113', N'Financial Year is Suspended')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (38, N'115', N'Journal Posted Successfully')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (39, N'116', N'Journal Posting Failed')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (40, N'120', N'Currency Conversion Found')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (41, N'121', N'Currency Conversion Rates Not Set')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (42, N'150', N'No Date Violation Found')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (43, N'151', N'Operation Date is Before Client Activation date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (44, N'152', N'Loan Approval Date  Mismatch with Application date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (45, N'153', N'Guarantorship Date Mismatch with Application Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (46, N'154', N'Disbursement Date mismatch with Application Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (47, N'155', N'Account Activation Date Mismatch with Posting date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (48, N'156', N'Payment Date CANNOT Be Less Than Disbursement Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (49, N'157', N'Transaction Date cannot be greater than Account Opening Date')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (50, N'170', N'Disbursement Amount Exceeds Approved Amount')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (51, N'171', N'Disbursement Amount Exceeds Non-Disbursed Balance')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (52, N'172', N'Loan Editing Is not allowed at this level')
INSERT [dbo].[UBSADM10005] ([ResponseID], [ResponseCode], [ResponseDescription]) VALUES (53, N'173', N'Loan has not attained the set Approval Threshold')
SET IDENTITY_INSERT [dbo].[UBSADM10005] OFF
GO
SET IDENTITY_INSERT [dbo].[UBSADMOOOO1] ON 

INSERT [dbo].[UBSADMOOOO1] ([CompanyID], [CompanyName]) VALUES (1, N'company1')
SET IDENTITY_INSERT [dbo].[UBSADMOOOO1] OFF
GO
ALTER TABLE [dbo].[UBSADM10000] ADD  DEFAULT (newid()) FOR [ChangeLogId]
GO
ALTER TABLE [dbo].[UBSADM10002] ADD  DEFAULT (newid()) FOR [UserLogId]
GO
ALTER TABLE [dbo].[Streams]  WITH CHECK ADD  CONSTRAINT [FK_Streams_UBSADMOOOO1] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[UBSADMOOOO1] ([CompanyID])
GO
ALTER TABLE [dbo].[Streams] CHECK CONSTRAINT [FK_Streams_UBSADMOOOO1]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_UBSADM00002] FOREIGN KEY([StreamID])
REFERENCES [dbo].[Streams] ([StreamID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_UBSADM00002]
GO
/****** Object:  StoredProcedure [dbo].[AdminLogChangedData]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AdminLogChangedData] -- log data changes
(@changedtable nvarchar(max),@datareferenceid nvarchar(max),@whatdata nvarchar(50),@prechangedata nvarchar(max),
@postchangedata nvarchar(max),@username nvarchar(max),@ipaddress nvarchar(max),@branchid int,
@transactioncode nvarchar(max),@databasechangedate datetime,@interefacechangedate datetime,
@response nvarchar(max) output,@companyid int)
as
begin
begin try
	INSERT INTO UBSADM10000 (ChangedTable,DataReferenceId,WhatData,PreChangeData,PostChangeData,UserName,IpAddress,BranchId, TransactionCode,DatabaseDateChanged,InterfaceDateChanged,CompanyId)
	VALUES(@changedtable,@datareferenceid,@whatdata, @prechangedata,@postchangedata,@username,@ipaddress,@branchid, @transactioncode,@databasechangedate,@interefacechangedate,@companyid);
	
	set @response ='000';
end try
begin catch
	execute AdminLogSystemErrors ERROR_NUMBER,ERROR_MESSAGE,'Log Changed Data',ERROR_PROCEDURE,GETDATE,@interefacechangedate,@username,@ipaddress,@branchid
	,@transactioncode,'UBSADM10000','',1,'support@unistrat.co.ke','',@companyid
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[AdminLogSystemErrors]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdminLogSystemErrors]
(@errornumber nvarchar(max),@errormessage nvarchar(max),@operationname nvarchar(max),@procedurename nvarchar(max),
@databaseerrordatetime datetime,@interfaceerrordate datetime, @username nvarchar(max),@ipaddress nvarchar(max),@branchid int,
 @transactioncode nvarchar(max),@targettable nvarchar(max),@targetreferenceid nvarchar(max),
@sendemail bit,@sendemailto nvarchar(max),@response nvarchar(max) output,@companyid int)
as
begin
	INSERT INTO [dbo].[UBSADM00000]([ErrorNumber],[ErrorMessage],[OperationName],[ProcedureName],InterfaceErrorDateTime ,
	DatabaseErrorDateTime,[UserName],IpAddress,BranchId, [TransactionCode],[TargetTable],[TargetReferenceId],[SendEmail],[SendEmailTo],CompanyId)
	VALUES(@errornumber,@errormessage,@operationname,@procedurename,@interfaceerrordate,@databaseerrordatetime, @username,@ipaddress,@branchid,
	 @transactioncode,@targettable,@targetreferenceid,@sendemail,@sendemailto,@companyid)

	set @response = '000'
end
GO
/****** Object:  StoredProcedure [dbo].[AdminUserActivityLog]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[AdminUserActivityLog]
(@UserName nvarchar(max),
@IPAddress nvarchar(max),
@OperationCode nvarchar(max),
@OperationDescription nvarchar(max),
@ActionOnTable nvarchar(max),
@ActionTableReference nvarchar(max),
@SourcePage nvarchar(max),
@SourceUrl nvarchar(max),
@TheData nvarchar(max),
@InterfaceDate datetime,
@DatabaseName datetime,
@IsInsert bit,
@IsUpdate bit, 
@IsGet bit,
@CompanyId int)
as
begin
SET NOCOUNT ON
DECLARE @datev datetime = GETDATE()
insert into UBSADM10002
(UserName,IPAddress,OperationCode,OperationDescription,ActionOnTable,ActionTableReference,SourcePage,SourceUrl,TheData,InterfaceDate,DatabaseTime,LogDatabaseTime,IsInsert,IsUpdate,IsGet,CompanyId)
values(@UserName,@IPAddress,@OperationCode,@OperationDescription,@ActionOnTable,@ActionTableReference,@SourcePage,@SourceUrl,@TheData,@InterfaceDate,@DatabaseName,@datev,@IsInsert,@IsUpdate,@IsGet,@companyid)
end
GO
/****** Object:  StoredProcedure [dbo].[GlobalGetResponseDescription]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GlobalGetResponseDescription](@responsecode nvarchar(50),@responsedescription nvarchar(max) output)
as
begin
	select @responsedescription=ResponseDescription from UBSADM10005 WITH (nolock) where ResponseCode=@responsecode
	if(@responsedescription is null)
	begin
		set @responsedescription = 'Uknown Response'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[streamdetails]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[streamdetails]
( 
 @StreamID int,
 @StreamCode nvarchar (50),
 @StreamName nvarchar (max),
 @IsUpdate bit,
 @CompanyID int,
 @BranchID int,
 @Username nvarchar (max),
 @IpAddress nvarchar (max),
 @InterfaceDatetime datetime,
 @Valid Bit,
 @PageName nvarchar(max),
 @PageUrl nvarchar(max),
 @transactioncode nvarchar(max))

 as
 begin
 declare @responsedata table (ResponseCode varchar(10),ResponseDescription varchar(maX))
declare @responsecode varchar(10),@responsedescription varchar(max)
 declare @DatabaseDatetime datetime =getdate()
 begin try
 declare @deleted bit,@Deletedby nvarchar(max),@dateDeleted datetime,@prechangedData nvarchar(max), @postchangeddata nvarchar(max)
         if (@IsUpdate=1)
         begin
             if(@Valid=0)
			 begin
			 set @deleted=1
			   set @Deletedby=@Username
			   set @dateDeleted=@InterfaceDatetime
			   end
			   set @prechangedData=(select * from Streams with (nolock) where StreamID=@StreamID and CompanyID=@CompanyID for json auto)
			   --->Update data<<--
			   update Streams SET
			                
			                StreamCode=@StreamCode,
							SreamName=@StreamName,
							Valid = @Valid,
							Deleted= @deleted,
							DateDeleted=@DateDeleted,
							DeletedBy=@DeletedBy
		       where StreamID=@StreamID and CompanyID=@CompanyID


			set @postchangeddata = (select * from Streams with (nolock) where StreamID=@StreamID and CompanyID=@CompanyID for json auto)   
			  -->>LOG USER ACTIVITY<<--
			   EXECUTE AdminUserActivityLog @username,@ipaddress,'UPDATED_STREAM_DETAILS','UPDATED_STREAM_DETAILS','Streams',
			           @StreamID,@PageName,@PageUrl,@postchangeddata,@interfacedatetime,0,1,0,'',@CompanyID
              -->>LOG DATA CHANGES
			  execute AdminLogChangedData 'Streams',CustomerID,'UPDATE_STREAM_DETAILS',@prechangeddata,@postchangeddata,@username,@ipaddress,@branchid,@transactioncode,
			 @databasedatetime,@interfacedatetime,'',@CompanyID
			 set @responsecode='000'
	    END
		ELSE
		BEGIN



		-->INSERt INTO
		if not exists (select 1 from Streams WHERE SreamName=@StreamName and CompanyID=@CompanyID)
		BEGIN
		    INSERT INTO Streams (CompanyID,BranchID,SreamName,StreamCode,Username,IpAddress,InterfaceDatetime,DatabaseDatetime,
			                          Valid,Deleted,DateDeleted,DeletedBy)
                         Values (@CompanyID,@BranchID,@StreamName,@StreamCode,@Username,@IpAddress,@InterfaceDatetime,@DatabaseDatetime,
						           @Valid,@deleted,@dateDeleted,@Deletedby)

								   set @StreamName = SCOPE_IDENTITY()
								     set @postchangeddata = (select * from Streams with (nolock) where  SreamName=@StreamName and CompanyID = @CompanyID for json auto)




		-->>LOG USER ACTIVITTY
		execute AdminUserActivityLog @username,@ipaddress,'ADDED_STREAM_DETAILS','STREAM_DETAILS_ALREADY_ADDED','Streams',@StreamID,@PageName,@PageUrl,@postchangeddata,@interfacedatetime,
			 @databasedatetime,0,1,0,@companyid
			 ---LOG DATA CHANGES
		 execute AdminLogChangedData 'Streams',@StreamID,'UPDATE_STREAM_DETAILS',@prechangeddata,@postchangeddata,@username,@ipaddress,@branchid,@transactioncode,
			 @databasedatetime,@interfacedatetime,'',@CompanyID
			 		set @responsecode='000'
			 end
			 else begin
			  -->>LOG USER ACTIVITY<<--
				       execute AdminUserActivityLog @username,@ipaddress,'UPDATE_STREAM_DETAILS','STREAM_DETAILS_FAILED','STREAMDETAILS',
					   @responsecode,@PageName,@PageUrl,@postchangeddata,@interfacedatetime, @databasedatetime,0,1,0,@companyid
					   set @responsecode = '001'
			end          
		END
	end  try
	begin catch
	declare @errornumber8 nvarchar(max),@errormessage nvarchar(max)
	set @errornumber8 = ERROR_NUMBER()
	set @errormessage = ERROR_MESSAGE()
	EXECUTE AdminLogSystemErrors @errornumber8,@errormessage,'ADD_NEW_STREAM','STREAMDETAILS',@databasedatetime,@interfacedatetime,@username,@ipaddress,@BranchID,@transactioncode,
	'StudentTable',@StreamID,1,'support@unistrat.co.ke','',@companyid
	   set @responsecode = '005'
end catch
--GET RESPONSE DESCRIPTION
EXECUTE [GlobalGetResponseDescription] @responsecode,@responsedescription out
insert into @responsedata(ResponseCode,ResponseDescription) values(@responsecode,@responsedescription)
select * from @responsedata
end
GO
/****** Object:  StoredProcedure [dbo].[studentdetails]    Script Date: 6/15/2022 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[studentdetails]
( 
 @StudentID int,
 @StudentName nvarchar (50),
 @StreamID nvarchar (max),
 @IsUpdate bit,
 @CompanyID int,
 @BranchID int,
 @MPhoneNumber nvarchar(20),
 @Username nvarchar (max),
 @IpAddress nvarchar (max),
 @InterfaceDatetime datetime,
 @Valid Bit,
 @PageName nvarchar(max),
 @PageUrl nvarchar(max),
 @transactioncode nvarchar(max))

 as
 begin
 declare @responsedata table (ResponseCode varchar(10),ResponseDescription varchar(maX))
declare @responsecode varchar(10),@responsedescription varchar(max)
 declare @DatabaseDatetime datetime =getdate()
 begin try
 declare @deleted bit,@Deletedby nvarchar(max),@dateDeleted datetime,@prechangedData nvarchar(max), @postchangeddata nvarchar(max)
         if (@IsUpdate=1)
         begin
             if(@Valid=0)
			 begin
			 set @deleted=1
			   set @Deletedby=@Username
			   set @dateDeleted=@InterfaceDatetime
			   end
			   set @prechangedData=(select * from StudentTable with (nolock) where StudentID=@StudentID and CompanyID=@CompanyID for json auto)
			   --->Update data<<--
			   update StudentTable SET
			                
			                StudentName=@StudentName,
							StreamID=@StreamID,
							Valid = @Valid,
							Deleted= @deleted,
							DateDeleted=@DateDeleted,
							DeletedBy=@DeletedBy
		       where StudentID=@StudentID and CompanyID=@CompanyID


			set @postchangeddata = (select * from StudentTable with (nolock) where StudentID=@StudentID and CompanyID=@CompanyID for json auto)   
			  -->>LOG USER ACTIVITY<<--
			   EXECUTE AdminUserActivityLog @username,@ipaddress,'UPDATED_STUDENT_DETAILS','UPDATED_STUDENT_DETAILS','StudentTable',
			           @MPhoneNumber,@PageName,@PageUrl,@postchangeddata,@interfacedatetime,0,1,0,'',@CompanyID
              -->>LOG DATA CHANGES
			  execute AdminLogChangedData 'StudentTable',CustomerID,'UPDATE_STUDENT_DETAILS',@prechangeddata,@postchangeddata,@username,@ipaddress,@branchid,@transactioncode,
			 @databasedatetime,@interfacedatetime,'',@CompanyID
			 set @responsecode='000'
	    END
		ELSE
		BEGIN



		-->INSERt INTO
		if not exists (select 1 from StudentTable WHERE StudentName=@StudentName and CompanyID=@CompanyID)
		BEGIN
		    INSERT INTO StudentTable (CompanyID,BranchID,StudentName,StreamID,Username,IpAddress,InterfaceDatetime,DatabaseDatetime,
			                          Valid,Deleted,DateDeleted,DeletedBy)
                         Values (@CompanyID,@BranchID,@StudentName,@StreamID,@Username,@IpAddress,@InterfaceDatetime,@DatabaseDatetime,
						           @Valid,@deleted,@dateDeleted,@Deletedby)

								   set @StudentName = SCOPE_IDENTITY()
								     set @postchangeddata = (select * from StudentTable with (nolock) where  StudentName = @StudentName and CompanyID = @CompanyID for json auto)




		-->>LOG USER ACTIVITTY
		execute AdminUserActivityLog @username,@ipaddress,'ADDED_STUDENT_DETAILS','STUDENT_DETAILS_ALREADY_ADDED','UBSCRR00005',@StudentID,@PageName,@PageUrl,@postchangeddata,@interfacedatetime,
			 @databasedatetime,0,1,0,@companyid
			 ---LOG DATA CHANGES
		 execute AdminLogChangedData 'StudentTable',@StudentID,'UPDATE_STUDENT_DETAILS',@prechangeddata,@postchangeddata,@username,@ipaddress,@branchid,@transactioncode,
			 @databasedatetime,@interfacedatetime,'',@CompanyID
			 		set @responsecode='000'
			 end
			 else begin
			  -->>LOG USER ACTIVITY<<--
				       execute AdminUserActivityLog @username,@ipaddress,'UPDATE_STUDENT_DETAILS','STUDENT_DETAILS_FAILED','STUDENTDETAILS',
					   @responsecode,@PageName,@PageUrl,@postchangeddata,@interfacedatetime, @databasedatetime,0,1,0,@companyid
					   set @responsecode = '001'
			end          
		END
	end  try
	begin catch
	declare @errornumber8 nvarchar(max),@errormessage nvarchar(max)
	set @errornumber8 = ERROR_NUMBER()
	set @errormessage = ERROR_MESSAGE()
	EXECUTE AdminLogSystemErrors @errornumber8,@errormessage,'ADD_NEW_STUDENT','studentdetails',@databasedatetime,@interfacedatetime,@username,@ipaddress,@BranchID,@transactioncode,
	'StudentTable',@StudentID,1,'support@unistrat.co.ke','',@companyid
	   set @responsecode = '005'
end catch
--GET RESPONSE DESCRIPTION
EXECUTE [GlobalGetResponseDescription] @responsecode,@responsedescription out
insert into @responsedata(ResponseCode,ResponseDescription) values(@responsecode,@responsedescription)
select * from @responsedata
end
GO
USE [master]
GO
ALTER DATABASE [kilimo] SET  READ_WRITE 
GO
