USE [master]
GO
/****** Object:  Database [Gsql]    Script Date: 2/20/2018 10:37:49 AM ******/
CREATE DATABASE [Gsql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gsql', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Gsql.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gsql_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Gsql_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gsql] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gsql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gsql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gsql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gsql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gsql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gsql] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gsql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gsql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gsql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gsql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gsql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gsql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gsql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gsql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gsql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gsql] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gsql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gsql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gsql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gsql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gsql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gsql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gsql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gsql] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gsql] SET  MULTI_USER 
GO
ALTER DATABASE [Gsql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gsql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gsql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gsql] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Gsql] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Gsql]
GO
/****** Object:  Table [dbo].[tblCboForeman]    Script Date: 2/20/2018 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCboForeman](
	[foremanID] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [varchar](50) NULL,
	[firstName] [varchar](50) NULL,
	[middleInitial] [nchar](10) NULL,
	[Active] [int] NULL,
	[initials] [nchar](6) NULL,
 CONSTRAINT [PK_tblCboForeman] PRIMARY KEY CLUSTERED 
(
	[foremanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 2/20/2018 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[lngCustId] [int] IDENTITY(1,1) NOT NULL,
	[bolBusiness] [int] NULL,
	[strBusinessName] [nvarchar](50) NULL,
	[strFirstName] [nvarchar](50) NULL,
	[strLastName] [nvarchar](50) NULL,
	[mailAddress] [nvarchar](50) NULL,
	[mailAddressSuffix] [nvarchar](255) NULL,
	[mailCity] [nvarchar](50) NULL,
	[mailZip] [nvarchar](50) NULL,
	[mailState] [nvarchar](50) NULL,
	[strHomePhoneNumber] [nvarchar](50) NULL,
	[strCellPhoneNumber] [nvarchar](50) NULL,
	[strBusPhoneNumber] [nvarchar](50) NULL,
	[strBusPhoneExt] [nvarchar](50) NULL,
	[strFaxNumber] [nvarchar](50) NULL,
	[strEmailAddress] [nvarchar](50) NULL,
	[imagePathAndFile] [nvarchar](244) NULL,
	[docPathWin] [nvarchar](150) NULL,
	[imgPathWin] [nvarchar](255) NULL,
	[txtContactNotes] [nvarchar](249) NULL,
	[chkBusWithProperties] [int] NULL CONSTRAINT [DF__tblCustom__chkBu__1273C1CD]  DEFAULT ((0)),
	[chkBusWithCondos] [int] NULL,
	[custIdConcact] [nvarchar](50) NULL,
	[referral] [int] NULL,
	[propType] [nvarchar](50) NULL,
	[removeMailingList] [bit] NULL,
	[blacklisted] [bit] NULL,
	[howFoundG] [nvarchar](255) NULL,
	[networkUserName] [nvarchar](25) NULL,
	[isCustDirCreated] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
	[archived] [tinyint] NULL,
	[enteredDte] [datetime2](7) NULL,
	[isNewCust] [int] NOT NULL CONSTRAINT [DF__tblCustom__isNew__1A14E395]  DEFAULT ((0)),
	[markForMerge] [int] NULL,
	[mergeWithIdPk] [int] NULL,
	[mergeNotes] [nchar](255) NULL,
 CONSTRAINT [PK_tblCustomers] PRIMARY KEY CLUSTERED 
(
	[lngCustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduction]    Script Date: 2/20/2018 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduction](
	[productionId] [int] IDENTITY(1,1) NOT NULL,
	[proposalIdFk] [int] NULL,
	[customerIdFk] [int] NULL,
	[jobType] [int] NULL,
	[jobStartDte] [date] NULL,
	[jobStartTime] [nchar](20) NULL,
	[jobEndDte] [date] NULL,
	[jobEndTime] [nchar](20) NULL,
	[productionDte] [datetime] NULL,
	[editedBy] [nchar](20) NULL,
	[editedDte] [date] NULL,
	[productionDteLock] [int] NULL DEFAULT ((0)),
	[productionScheduledBy] [nchar](20) NULL,
	[foreman] [int] NULL,
	[productionScheduled] [int] NULL DEFAULT ((0)),
	[productionSubject] [nvarchar](50) NULL,
	[Exported] [int] NULL DEFAULT ((0)),
	[jobScheduled] [int] NULL DEFAULT ((0)),
	[archived] [tinyint] NULL DEFAULT ((0)),
	[all_day] [bit] NULL DEFAULT ((0)),
	[color] [nchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblProduction] PRIMARY KEY CLUSTERED 
(
	[productionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProposals]    Script Date: 2/20/2018 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProposals](
	[proposalId] [int] IDENTITY(1,1) NOT NULL,
	[lngCustIdfk] [int] NULL CONSTRAINT [DF__tblPropos__lngCu__25869641]  DEFAULT ((0)),
	[insuranceCarrier] [nvarchar](75) NULL,
	[ContactF] [nvarchar](50) NULL,
	[jobLocation] [nvarchar](50) NULL,
	[propAddress] [nvarchar](244) NULL,
	[propAddressSuffix] [nvarchar](255) NULL,
	[acceptedWithinX] [nvarchar](50) NULL,
	[propCity] [nvarchar](50) NULL,
	[propState] [nvarchar](50) NULL,
	[propZip] [nvarchar](50) NULL,
	[DateProposalPrint] [datetime2](0) NULL,
	[proposalDate] [datetime2](0) NULL,
 CONSTRAINT [PK_tblProposals] PRIMARY KEY CLUSTERED 
(
	[proposalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCboForeman] ON 

INSERT [dbo].[tblCboForeman] ([foremanID], [lastName], [firstName], [middleInitial], [Active], [initials]) VALUES (1, N'McFall', N'Kenny', NULL, -1, N'K.M.  ')
SET IDENTITY_INSERT [dbo].[tblCboForeman] OFF
SET IDENTITY_INSERT [dbo].[tblCustomers] ON 

INSERT [dbo].[tblCustomers] ([lngCustId], [bolBusiness], [strBusinessName], [strFirstName], [strLastName], [mailAddress], [mailAddressSuffix], [mailCity], [mailZip], [mailState], [strHomePhoneNumber], [strCellPhoneNumber], [strBusPhoneNumber], [strBusPhoneExt], [strFaxNumber], [strEmailAddress], [imagePathAndFile], [docPathWin], [imgPathWin], [txtContactNotes], [chkBusWithProperties], [chkBusWithCondos], [custIdConcact], [referral], [propType], [removeMailingList], [blacklisted], [howFoundG], [networkUserName], [isCustDirCreated], [archived], [enteredDte], [isNewCust], [markForMerge], [mergeWithIdPk], [mergeNotes]) VALUES (1, NULL, NULL, N'John', N'DeFalco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[tblCustomers] ([lngCustId], [bolBusiness], [strBusinessName], [strFirstName], [strLastName], [mailAddress], [mailAddressSuffix], [mailCity], [mailZip], [mailState], [strHomePhoneNumber], [strCellPhoneNumber], [strBusPhoneNumber], [strBusPhoneExt], [strFaxNumber], [strEmailAddress], [imagePathAndFile], [docPathWin], [imgPathWin], [txtContactNotes], [chkBusWithProperties], [chkBusWithCondos], [custIdConcact], [referral], [propType], [removeMailingList], [blacklisted], [howFoundG], [networkUserName], [isCustDirCreated], [archived], [enteredDte], [isNewCust], [markForMerge], [mergeWithIdPk], [mergeNotes]) VALUES (2, NULL, NULL, N'Collins', N'Lisa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCustomers] OFF
SET IDENTITY_INSERT [dbo].[tblProduction] ON 

INSERT [dbo].[tblProduction] ([productionId], [proposalIdFk], [customerIdFk], [jobType], [jobStartDte], [jobStartTime], [jobEndDte], [jobEndTime], [productionDte], [editedBy], [editedDte], [productionDteLock], [productionScheduledBy], [foreman], [productionScheduled], [productionSubject], [Exported], [jobScheduled], [archived], [all_day], [color], [textColor]) VALUES (3, 1, 1, NULL, CAST(N'2018-02-19' AS Date), N'12:00:00 AM         ', CAST(N'2018-02-20' AS Date), N'12:00:00 AM         ', NULL, NULL, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 1, N'#EE82EE             ', N'#000')
INSERT [dbo].[tblProduction] ([productionId], [proposalIdFk], [customerIdFk], [jobType], [jobStartDte], [jobStartTime], [jobEndDte], [jobEndTime], [productionDte], [editedBy], [editedDte], [productionDteLock], [productionScheduledBy], [foreman], [productionScheduled], [productionSubject], [Exported], [jobScheduled], [archived], [all_day], [color], [textColor]) VALUES (4, 2, 2, NULL, CAST(N'2018-02-07' AS Date), N'12:00:00 AM         ', CAST(N'2018-02-08' AS Date), N'12:00:00 AM         ', NULL, NULL, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 1, N'#EE82EE             ', N'#000')
SET IDENTITY_INSERT [dbo].[tblProduction] OFF
SET IDENTITY_INSERT [dbo].[tblProposals] ON 

INSERT [dbo].[tblProposals] ([proposalId], [lngCustIdfk], [insuranceCarrier], [ContactF], [jobLocation], [propAddress], [propAddressSuffix], [acceptedWithinX], [propCity], [propState], [propZip], [DateProposalPrint], [proposalDate]) VALUES (1, 1, NULL, NULL, N'home', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblProposals] ([proposalId], [lngCustIdfk], [insuranceCarrier], [ContactF], [jobLocation], [propAddress], [propAddressSuffix], [acceptedWithinX], [propCity], [propState], [propZip], [DateProposalPrint], [proposalDate]) VALUES (2, 2, NULL, NULL, N'House', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblProposals] OFF
ALTER TABLE [dbo].[tblProduction]  WITH CHECK ADD  CONSTRAINT [FK_tblProduction_tblCboForeman] FOREIGN KEY([foreman])
REFERENCES [dbo].[tblCboForeman] ([foremanID])
GO
ALTER TABLE [dbo].[tblProduction] CHECK CONSTRAINT [FK_tblProduction_tblCboForeman]
GO
ALTER TABLE [dbo].[tblProduction]  WITH CHECK ADD  CONSTRAINT [FK_tblProduction_tblProposals] FOREIGN KEY([proposalIdFk])
REFERENCES [dbo].[tblProposals] ([proposalId])
GO
ALTER TABLE [dbo].[tblProduction] CHECK CONSTRAINT [FK_tblProduction_tblProposals]
GO
ALTER TABLE [dbo].[tblProposals]  WITH CHECK ADD  CONSTRAINT [FK_tblProposals_tblCustomers] FOREIGN KEY([lngCustIdfk])
REFERENCES [dbo].[tblCustomers] ([lngCustId])
GO
ALTER TABLE [dbo].[tblProposals] CHECK CONSTRAINT [FK_tblProposals_tblCustomers]
GO
USE [master]
GO
ALTER DATABASE [Gsql] SET  READ_WRITE 
GO
