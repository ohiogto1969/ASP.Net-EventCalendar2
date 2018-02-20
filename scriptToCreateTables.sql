USE [calendar]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 2/8/2018 4:05:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[lngCustId] [int] IDENTITY(1,1) NOT NULL,
	[bolBusiness] [int] NULL CONSTRAINT [DF__tblCustom__bolBu__5F7E2DAC]  DEFAULT ((0)),
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
	[chkBusWithProperties] [int] NULL CONSTRAINT [DF__tblCustom__chkBu__607251E5]  DEFAULT ((0)),
	[chkBusWithCondos] [int] NULL CONSTRAINT [DF__tblCustom__chkBu__6166761E]  DEFAULT ((0)),
	[custIdConcact] [nvarchar](50) NULL,
	[referral] [int] NULL CONSTRAINT [DF__tblCustom__refer__625A9A57]  DEFAULT ((0)),
	[propType] [nvarchar](50) NULL,
	[removeMailingList] [bit] NULL CONSTRAINT [DF__tblCustom__remov__634EBE90]  DEFAULT ((0)),
	[blacklisted] [bit] NULL CONSTRAINT [DF__tblCustom__black__6442E2C9]  DEFAULT ((0)),
	[howFoundG] [nvarchar](255) NULL,
	[networkUserName] [nvarchar](25) NULL,
	[isCustDirCreated] [int] NULL CONSTRAINT [DF__tblCustom__isCus__65370702]  DEFAULT ((0)),
	[SSMA_TimeStamp] [timestamp] NOT NULL,
	[archived] [tinyint] NULL CONSTRAINT [DF_tblCustomers_archived]  DEFAULT ((0)),
	[enteredDte] [datetime2](7) NULL CONSTRAINT [DF_tblCustomers_enteredDte]  DEFAULT (getdate()),
	[isNewCust] [int] NOT NULL CONSTRAINT [DF__tblCustom__isNew__041093DD]  DEFAULT ((0)),
	[markForMerge] [int] NULL,
	[mergeWithIdPk] [int] NULL,
	[mergeNotes] [nchar](255) NULL,
 CONSTRAINT [tblCustomers$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[lngCustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduction]    Script Date: 2/8/2018 4:05:58 PM ******/
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
	[productionDteLock] [int] NULL CONSTRAINT [DF_tblProduction_productionDteLock]  DEFAULT ((0)),
	[productionScheduledBy] [nchar](20) NULL,
	[foreman] [int] NULL,
	[productionScheduled] [int] NULL CONSTRAINT [DF_tblProduction_productionScheduled]  DEFAULT ((0)),
	[productionSubject] [nvarchar](50) NULL,
	[Exported] [int] NULL CONSTRAINT [DF_tblProduction_Exported]  DEFAULT ((0)),
	[jobScheduled] [int] NULL CONSTRAINT [DF_tblProduction_jobScheduled]  DEFAULT ((0)),
	[archived] [tinyint] NULL CONSTRAINT [DF_tblProduction_archived]  DEFAULT ((0)),
	[all_day] [bit] NULL CONSTRAINT [DF_tblProduction_all_day]  DEFAULT ((0)),
	[title] [nchar](100) NULL,
	[color] [nvarchar](15) NULL,
 CONSTRAINT [PK__tblProdu__778070C0145D2044] PRIMARY KEY CLUSTERED 
(
	[productionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCustomers] ON 

INSERT [dbo].[tblCustomers] ([lngCustId], [bolBusiness], [strBusinessName], [strFirstName], [strLastName], [mailAddress], [mailAddressSuffix], [mailCity], [mailZip], [mailState], [strHomePhoneNumber], [strCellPhoneNumber], [strBusPhoneNumber], [strBusPhoneExt], [strFaxNumber], [strEmailAddress], [imagePathAndFile], [docPathWin], [imgPathWin], [txtContactNotes], [chkBusWithProperties], [chkBusWithCondos], [custIdConcact], [referral], [propType], [removeMailingList], [blacklisted], [howFoundG], [networkUserName], [isCustDirCreated], [archived], [enteredDte], [isNewCust], [markForMerge], [mergeWithIdPk], [mergeNotes]) VALUES (26066, 0, N'Morabitos Grocery', N'Sam', N'Morabito', N'1157 Robbins Ave', NULL, N'Niles', N'44446', N'Oh', N'3305555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, NULL, 0, 0, CAST(N'2018-02-08 15:58:25.9300000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[tblCustomers] ([lngCustId], [bolBusiness], [strBusinessName], [strFirstName], [strLastName], [mailAddress], [mailAddressSuffix], [mailCity], [mailZip], [mailState], [strHomePhoneNumber], [strCellPhoneNumber], [strBusPhoneNumber], [strBusPhoneExt], [strFaxNumber], [strEmailAddress], [imagePathAndFile], [docPathWin], [imgPathWin], [txtContactNotes], [chkBusWithProperties], [chkBusWithCondos], [custIdConcact], [referral], [propType], [removeMailingList], [blacklisted], [howFoundG], [networkUserName], [isCustDirCreated], [archived], [enteredDte], [isNewCust], [markForMerge], [mergeWithIdPk], [mergeNotes]) VALUES (26067, 0, NULL, N'John', N'DeFalco', N'2468 Trentwood Dr SE', NULL, N'Warren', N'44484', N'Oh', N'3306479999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, NULL, 0, 0, CAST(N'2018-02-08 15:59:05.7430000' AS DateTime2), 0, NULL, NULL, NULL)
INSERT [dbo].[tblCustomers] ([lngCustId], [bolBusiness], [strBusinessName], [strFirstName], [strLastName], [mailAddress], [mailAddressSuffix], [mailCity], [mailZip], [mailState], [strHomePhoneNumber], [strCellPhoneNumber], [strBusPhoneNumber], [strBusPhoneExt], [strFaxNumber], [strEmailAddress], [imagePathAndFile], [docPathWin], [imgPathWin], [txtContactNotes], [chkBusWithProperties], [chkBusWithCondos], [custIdConcact], [referral], [propType], [removeMailingList], [blacklisted], [howFoundG], [networkUserName], [isCustDirCreated], [archived], [enteredDte], [isNewCust], [markForMerge], [mergeWithIdPk], [mergeNotes]) VALUES (26068, 0, NULL, N'Lisa', N'Collins', N'5484 Liberty St', NULL, N'Boston', N'22541', N'MA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, NULL, 0, 0, CAST(N'2018-02-08 15:59:48.0500000' AS DateTime2), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCustomers] OFF
SET IDENTITY_INSERT [dbo].[tblProduction] ON 

INSERT [dbo].[tblProduction] ([productionId], [proposalIdFk], [customerIdFk], [jobType], [jobStartDte], [jobStartTime], [jobEndDte], [jobEndTime], [productionDte], [editedBy], [editedDte], [productionDteLock], [productionScheduledBy], [foreman], [productionScheduled], [productionSubject], [Exported], [jobScheduled], [archived], [all_day], [title], [color]) VALUES (74, 30366, 26068, 2, CAST(N'2018-02-06' AS Date), N'12:00:00 AM         ', CAST(N'2018-02-24' AS Date), N'12:00:00 AM         ', CAST(N'2017-02-20 16:03:50.000' AS DateTime), NULL, NULL, -1, N'Robert              ', 14, -1, NULL, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[tblProduction] ([productionId], [proposalIdFk], [customerIdFk], [jobType], [jobStartDte], [jobStartTime], [jobEndDte], [jobEndTime], [productionDte], [editedBy], [editedDte], [productionDteLock], [productionScheduledBy], [foreman], [productionScheduled], [productionSubject], [Exported], [jobScheduled], [archived], [all_day], [title], [color]) VALUES (75, 30366, 26066, 4, CAST(N'2018-02-24' AS Date), N'12:00:00 AM         ', CAST(N'2018-02-24' AS Date), N'12:00:00 AM         ', CAST(N'2017-02-20 16:03:55.000' AS DateTime), NULL, NULL, -1, N'Robert              ', 15, -1, NULL, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[tblProduction] ([productionId], [proposalIdFk], [customerIdFk], [jobType], [jobStartDte], [jobStartTime], [jobEndDte], [jobEndTime], [productionDte], [editedBy], [editedDte], [productionDteLock], [productionScheduledBy], [foreman], [productionScheduled], [productionSubject], [Exported], [jobScheduled], [archived], [all_day], [title], [color]) VALUES (76, 28589, 26067, 1, CAST(N'2018-02-16' AS Date), N'12:00:00 AM         ', CAST(N'2018-02-16' AS Date), N'12:00:00 AM         ', CAST(N'2017-02-20 16:04:36.000' AS DateTime), NULL, NULL, -1, N'Robert              ', 1, -1, NULL, 0, NULL, 1, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblProduction] OFF
