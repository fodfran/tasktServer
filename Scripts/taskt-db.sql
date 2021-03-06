USE [master]
GO
/****** Object:  Database [taskt]    Script Date: 3/26/2019 9:57:32 PM ******/
CREATE DATABASE [taskt]
GO

USE [taskt]
GO

/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/26/2019 9:57:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignedPoolWorker]    Script Date: 3/26/2019 9:57:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedPoolWorker](
	[AssignedPoolWorkerItemID] [uniqueidentifier] NOT NULL,
	[WorkerID] [uniqueidentifier] NOT NULL,
	[WorkerPoolID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AssignedPoolWorker] PRIMARY KEY CLUSTERED 
(
	[AssignedPoolWorkerItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentID] [uniqueidentifier] NOT NULL,
	[AssignmentName] [nvarchar](max) NULL,
	[PublishedScriptID] [uniqueidentifier] NOT NULL,
	[AssignedWorker] [uniqueidentifier] NOT NULL,
	[Frequency] [int] NOT NULL,
	[Interval] [int] NOT NULL,
	[NewTaskDue] [datetime2](7) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotStore]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotStore](
	[StoreID] [uniqueidentifier] NOT NULL,
	[BotStoreName] [nvarchar](max) NULL,
	[BotStoreValue] [nvarchar](max) NULL,
	[LastUpdatedOn] [datetime2](7) NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BotStore] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginProfiles]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginProfiles](
	[ID] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[LastSuccessfulLogin] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoginProfiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublishedScripts]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublishedScripts](
	[PublishedScriptID] [uniqueidentifier] NOT NULL,
	[WorkerID] [uniqueidentifier] NOT NULL,
	[PublishedOn] [datetime2](7) NOT NULL,
	[ScriptType] [int] NOT NULL,
	[ScriptData] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_PublishedScripts] PRIMARY KEY CLUSTERED 
(
	[PublishedScriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [uniqueidentifier] NOT NULL,
	[WorkerID] [uniqueidentifier] NOT NULL,
	[MachineName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[IPAddress] [nvarchar](max) NULL,
	[Script] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[TaskStarted] [datetime2](7) NOT NULL,
	[TaskFinished] [datetime2](7) NOT NULL,
	[ExecutionType] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[WorkerType] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerPools]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerPools](
	[WorkerPoolID] [uniqueidentifier] NOT NULL,
	[WorkerPoolName] [nvarchar](max) NULL,
 CONSTRAINT [PK_WorkerPools] PRIMARY KEY CLUSTERED 
(
	[WorkerPoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 3/26/2019 9:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerID] [uniqueidentifier] NOT NULL,
	[MachineName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[LastCheckIn] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignedPoolWorker_WorkerPoolID]    Script Date: 3/26/2019 9:57:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_AssignedPoolWorker_WorkerPoolID] ON [dbo].[AssignedPoolWorker]
(
	[WorkerPoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignments] ADD  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[AssignedPoolWorker]  WITH CHECK ADD  CONSTRAINT [FK_AssignedPoolWorker_WorkerPools_WorkerPoolID] FOREIGN KEY([WorkerPoolID])
REFERENCES [dbo].[WorkerPools] ([WorkerPoolID])
GO
ALTER TABLE [dbo].[AssignedPoolWorker] CHECK CONSTRAINT [FK_AssignedPoolWorker_WorkerPools_WorkerPoolID]
GO
USE [master]
GO
ALTER DATABASE [taskt] SET  READ_WRITE 
GO
