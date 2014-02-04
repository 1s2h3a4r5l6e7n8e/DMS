/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 01/19/2014 11:03:45 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Announcement_DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Announcement]'))
Begin
ALTER TABLE [dbo].[Announcement] DROP CONSTRAINT [DF_Announcement_DateCreated]

End
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 01/19/2014 11:03:45 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Tenants_DateRegistered]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tenants]'))
Begin
ALTER TABLE [dbo].[Tenants] DROP CONSTRAINT [DF_Tenants_DateRegistered]

End
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 01/19/2014 11:03:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Announcement]') AND type in (N'U'))
DROP TABLE [dbo].[Announcement]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 01/19/2014 11:03:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenants]') AND type in (N'U'))
DROP TABLE [dbo].[Tenants]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01/19/2014 11:03:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01/19/2014 11:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(2014001,1) NOT NULL,
	[FName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[MName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[LName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[Gender] [nvarchar](1) COLLATE Latin1_General_CI_AS NULL,
	[BDate] [datetime] NULL,
	[ContactNo] [nvarchar](20) COLLATE Latin1_General_CI_AS NULL,
	[Email] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL,
	[AdminLevel] [int] NULL,
	[UN] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL,
	[Pwd] [nvarchar](40) COLLATE Latin1_General_CI_AS NULL,
	[DateOfEmployment] [datetime] NULL,
	[PhotoFile] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL
)
END
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile]) VALUES (2014001, N'Megan', N'Manuel', N'Japzon', N'2', CAST(0x000081BD00000000 AS DateTime), N'09272814353', N'potchie0o8@gmail.com', 1, N'mjapz', N'827CCB0EEA8A706C4C34A16891F84E7B', CAST(0x0000A2B500000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Tenants]    Script Date: 01/19/2014 11:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tenants](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[MName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[LName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[Gender] [nvarchar](1) COLLATE Latin1_General_CI_AS NULL,
	[Email] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL,
	[BDate] [datetime] NULL,
	[Street] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[City] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[Region] [nvarchar](100) COLLATE Latin1_General_CI_AS NULL,
	[Country] [nvarchar](100) COLLATE Latin1_General_CI_AS NULL,
	[MobileNo] [nvarchar](20) COLLATE Latin1_General_CI_AS NULL,
	[UN] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL,
	[Pwd] [nvarchar](40) COLLATE Latin1_General_CI_AS NULL,
	[PhotoFile] [nvarchar](150) COLLATE Latin1_General_CI_AS NULL,
	[DateRegistered] [datetime] NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 01/19/2014 11:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Announcement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Announcement](
	[AnnouncementID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](250) COLLATE Latin1_General_CI_AS NULL,
	[Message] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[DateCreated] [datetime] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 01/19/2014 11:03:45 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Announcement_DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Announcement]'))
Begin
ALTER TABLE [dbo].[Announcement] ADD  CONSTRAINT [DF_Announcement_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]

End
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 01/19/2014 11:03:45 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Tenants_DateRegistered]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tenants]'))
Begin
ALTER TABLE [dbo].[Tenants] ADD  CONSTRAINT [DF_Tenants_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]

End
GO
