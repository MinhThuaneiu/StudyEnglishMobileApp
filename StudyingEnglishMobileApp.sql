USE [master]
GO
/****** Object:  Database [StudyEnglishMobileApp]    Script Date: 05/06/2025 00:21:14 ******/
CREATE DATABASE [StudyEnglishMobileApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudyEnglishMoblileApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudyEnglishMoblileApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudyEnglishMoblileApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudyEnglishMoblileApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudyEnglishMobileApp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudyEnglishMobileApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET RECOVERY FULL 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET  MULTI_USER 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudyEnglishMobileApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudyEnglishMobileApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudyEnglishMobileApp', N'ON'
GO
ALTER DATABASE [StudyEnglishMobileApp] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudyEnglishMobileApp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudyEnglishMobileApp]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 05/06/2025 00:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [varchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__answers__3213E83FD9C3AD4B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 05/06/2025 00:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelId] [int] NOT NULL,
	[UseId] [int] NOT NULL,
	[Status] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[Score] [int] NULL,
	[Name] [varchar](45) NULL,
 CONSTRAINT [PK__exams__3213E83F728A2F59] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamWithQuestion]    Script Date: 05/06/2025 00:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamWithQuestion](
	[Id] [int] NOT NULL,
	[QuestionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](10) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK__levels__3213E83FC8E4FEDC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LevelTestResult]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LevelTestResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TestTime] [int] NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK__level_te__3213E83F2720791F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [varchar](max) NOT NULL,
	[AnswerId] [int] NULL,
 CONSTRAINT [PK__question__3213E83FAD384A9E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelId] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[WordNumber] [int] NULL,
 CONSTRAINT [PK__topics__3213E83F7E791512] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswer]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswer](
	[UserId] [int] NOT NULL,
	[ExamId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answered] [int] NULL,
	[Status] [bit] NULL,
	[AnswerTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ExamId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Role] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[CurrentLevel] [int] NOT NULL,
 CONSTRAINT [PK__users__3213E83FFBF756F2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordLearning]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordLearning](
	[UserId] [int] NULL,
	[WordId] [int] NULL,
	[Status] [int] NULL,
	[StudyTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordLearningStatus]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordLearningStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK__word_lea__3213E83F566445D4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 05/06/2025 00:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[Spelling] [varchar](100) NOT NULL,
	[Definition] [text] NOT NULL,
	[ImageURL] [varchar](255) NULL,
	[Ipa] [varchar](100) NULL,
 CONSTRAINT [PK__words__3213E83FDEE49FDB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK__exams__level_id__47DBAE45] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK__exams__level_id__47DBAE45]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK__exams__user_id__48CFD27E] FOREIGN KEY([UseId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK__exams__user_id__48CFD27E]
GO
ALTER TABLE [dbo].[ExamWithQuestion]  WITH CHECK ADD  CONSTRAINT [FK__exam_with__exam___534D60F1] FOREIGN KEY([Id])
REFERENCES [dbo].[Exams] ([Id])
GO
ALTER TABLE [dbo].[ExamWithQuestion] CHECK CONSTRAINT [FK__exam_with__exam___534D60F1]
GO
ALTER TABLE [dbo].[ExamWithQuestion]  WITH CHECK ADD  CONSTRAINT [FK__exam_with__quest__5441852A] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[ExamWithQuestion] CHECK CONSTRAINT [FK__exam_with__quest__5441852A]
GO
ALTER TABLE [dbo].[LevelTestResult]  WITH CHECK ADD  CONSTRAINT [FK__level_tes__level__4BAC3F29] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[LevelTestResult] CHECK CONSTRAINT [FK__level_tes__level__4BAC3F29]
GO
ALTER TABLE [dbo].[LevelTestResult]  WITH CHECK ADD  CONSTRAINT [FK__level_tes__user___4CA06362] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LevelTestResult] CHECK CONSTRAINT [FK__level_tes__user___4CA06362]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__questions__answe__5165187F] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answers] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__questions__answe__5165187F]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK__topics__level_id__3E52440B] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK__topics__level_id__3E52440B]
GO
ALTER TABLE [dbo].[UserAnswer]  WITH CHECK ADD  CONSTRAINT [FK__user_answ__exam___5812160E] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exams] ([Id])
GO
ALTER TABLE [dbo].[UserAnswer] CHECK CONSTRAINT [FK__user_answ__exam___5812160E]
GO
ALTER TABLE [dbo].[UserAnswer]  WITH CHECK ADD  CONSTRAINT [FK__user_answ__quest__59063A47] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[UserAnswer] CHECK CONSTRAINT [FK__user_answ__quest__59063A47]
GO
ALTER TABLE [dbo].[UserAnswer]  WITH CHECK ADD  CONSTRAINT [FK__user_answ__user___571DF1D5] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAnswer] CHECK CONSTRAINT [FK__user_answ__user___571DF1D5]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__users__level__398D8EEE] FOREIGN KEY([CurrentLevel])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__users__level__398D8EEE]
GO
ALTER TABLE [dbo].[WordLearning]  WITH CHECK ADD  CONSTRAINT [FK__word_lear__statu__44FF419A] FOREIGN KEY([Status])
REFERENCES [dbo].[WordLearningStatus] ([Id])
GO
ALTER TABLE [dbo].[WordLearning] CHECK CONSTRAINT [FK__word_lear__statu__44FF419A]
GO
ALTER TABLE [dbo].[WordLearning]  WITH CHECK ADD  CONSTRAINT [FK__word_lear__user___4316F928] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WordLearning] CHECK CONSTRAINT [FK__word_lear__user___4316F928]
GO
ALTER TABLE [dbo].[WordLearning]  WITH CHECK ADD  CONSTRAINT [FK__word_lear__word___440B1D61] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordLearning] CHECK CONSTRAINT [FK__word_lear__word___440B1D61]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK__words__topic_id__412EB0B6] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK__words__topic_id__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [StudyEnglishMobileApp] SET  READ_WRITE 
GO
