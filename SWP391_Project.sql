USE [master]
GO
/****** Object:  Database [SWP391_Project_Test]    Script Date: 7/14/2022 5:58:55 PM ******/
CREATE DATABASE [SWP391_Project_Test]
GO
ALTER DATABASE [SWP391_Project_Test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_Project_Test] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWP391_Project_Test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWP391_Project_Test]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](150) NULL,
	[status] [bit] NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [bit] NULL,
	[avatar] [nvarchar](max) NULL,
	[roleId] [int] NULL,
	[created_date] [datetime] NULL CONSTRAINT [DF_Account_created_date]  DEFAULT (getdate()),
	[modify_date] [datetime] NULL CONSTRAINT [DF_Account_modify_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Answer]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[correct] [bit] NULL,
	[quesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[answerDetail]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answerDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[answerId] [int] NULL,
	[userId] [int] NULL,
	[quizId] [int] NULL,
	[attempt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[blogName] [nvarchar](255) NULL,
	[subId] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NULL,
	[value] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Exam]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Exam](
	[CE_id] [int] IDENTITY(1,1) NOT NULL,
	[examId] [int] NULL,
	[userId] [int] NULL,
	[date_taken] [date] NULL,
	[time_exam] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[CE_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Exam_Detail]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Exam_Detail](
	[CE_id] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[answerId] [int] NULL,
	[truth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CE_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dimension](
	[dimId] [int] IDENTITY(1,1) NOT NULL,
	[typeId] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[dimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[examId] [int] IDENTITY(1,1) NOT NULL,
	[isFree] [bit] NULL,
	[created_date] [date] NULL,
	[updated_date] [date] NULL,
	[title] [varchar](255) NULL,
	[subId] [int] NULL,
	[categoryId] [int] NULL,
	[level] [varchar](255) NULL,
	[passRate] [float] NULL,
	[userId] [int] NULL,
	[number] [int] NULL,
	[content] [varchar](255) NULL,
	[exam_typeId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[examId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam_Detail]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Detail](
	[examId] [int] IDENTITY(1,1) NOT NULL,
	[quesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[examId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam_Type]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam_Type](
	[exam_typeId] [varchar](255) NOT NULL,
	[exam_typeName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lesson](
	[lessonId] [int] IDENTITY(1,1) NOT NULL,
	[lessonName] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[order] [int] NULL,
	[video_url] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[topicId] [int] NULL,
	[status] [bit] NULL,
	[subId] [int] NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[lessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [varchar](255) NULL,
	[userId] [int] NULL,
	[categoryBlogId] [int] NULL,
	[content] [varchar](max) NULL,
	[created_date] [date] NULL CONSTRAINT [DF_Post_created_date]  DEFAULT (getdate()),
	[edit_date] [date] NULL,
	[status] [bit] NULL,
	[brifInfor] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[postFileId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post_File]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post_File](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[filePost] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PricePackage]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePackage](
	[priceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[acessDuration] [int] NULL,
	[price] [float] NULL,
	[salePrice] [float] NULL,
	[status] [bit] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_PricePackage] PRIMARY KEY CLUSTERED 
(
	[priceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[subjectId] [int] NULL,
	[lessonId] [int] NULL,
	[topicId] [int] NULL,
	[level] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[quizId] [int] NULL,
	[dimmensionId] [int] NULL,
	[isMultipleChoice] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question_Quiz]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Quiz](
	[quesId] [int] NOT NULL,
	[quizId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionDimension]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionDimension](
	[dimId] [int] NULL,
	[questionId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[level] [varchar](255) NULL,
	[img_url] [varchar](255) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[status] [bit] NULL,
	[rate] [float] NULL,
	[hasJoin] [bit] NULL,
	[subId] [int] NULL,
	[userId] [int] NULL,
	[quesId] [int] NULL,
	[lessonId] [int] NULL,
	[duration] [int] NULL,
	[typeId] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[totalQues] [int] NULL,
	[attempt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUIZ_POINT]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUIZ_POINT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[point] [float] NULL,
	[quizId] [int] NULL,
	[taken_date] [date] NULL,
	[pointPercent] [float] NULL,
	[numQuesTrue] [float] NULL,
	[attempt] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration_Subject]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration_Subject](
	[regisId] [int] IDENTITY(1,1) NOT NULL,
	[regis_Date] [date] NULL CONSTRAINT [DF_Registration_Subject_regis_Date]  DEFAULT (getdate()),
	[statis] [varchar](255) NULL,
	[subId] [int] NULL,
	[priceId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[regisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Setting](
	[settingId] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[value] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[settingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slider](
	[sliderId] [int] IDENTITY(1,1) NOT NULL,
	[slider_url] [varchar](255) NULL,
	[status] [bit] NULL,
	[title] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[backlink] [varchar](255) NULL,
	[notes] [varchar](255) NULL,
	[isShow] [bit] NULL,
	[subId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](255) NULL,
	[categoryId] [int] NULL,
	[status] [bit] NULL,
	[tagLine] [int] NULL,
	[title] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectDimension]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectDimension](
	[subjectId] [int] NOT NULL,
	[dimId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectPrice]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectPrice](
	[priceId] [int] NULL,
	[subjectId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[topicId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[status] [bit] NULL,
	[subId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[topicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/14/2022 5:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[typeId] [varchar](255) NOT NULL,
	[typeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (1, N'admin', N'123456', 0, N'admin123@gmail.com', N'09123456', N'Nguy?n Van A', N'Hà N?i', 1, N'', 1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (2, N'customer', N'123456', 0, N'customer123@gmail.com', N'09123456', N'Nguy?n Van B', N'Hà N?i', 0, N'', 2, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (3, N'expert', N'123456', 0, N'expert123@gmail.com', N'09123456', N'Nguy?n Th? C', N'Hà N?i', 1, N'', 3, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (4, N'sale', N'123456', 0, N'sale123@gmail.com', N'091234567', N'Lê Th? D', N'Hà N?i', 0, N'', 4, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (5, N'marketing', N'123456', 0, N'marketing123@gmail.com', N'0912345678', N'Mai Van E', N'Hà N?i', 1, N'', 5, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (6, N'test', N'123456', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22 20:00:41.927' AS DateTime), CAST(N'2022-06-22 20:00:41.927' AS DateTime))
INSERT [dbo].[Account] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date]) VALUES (7, N'test2', N'123456', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22 00:00:00.000' AS DateTime), CAST(N'2022-06-22 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (1, N'soon', 0, 8)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (2, N'excitedly', 0, 8)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (3, N'carefully', 1, 8)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (4, N'Yesterday', 1, 9)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (5, N'Wisely', 0, 9)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (6, N'Here', 0, 9)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (7, N'happily', 0, 10)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (8, N'outside', 1, 10)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (9, N'later', 0, 10)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (10, N'neatly', 0, 11)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (11, N'excitedly', 0, 11)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (12, N'upstairs', 1, 11)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (13, N'later', 0, 11)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (14, N'3', 0, 1)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (15, N'2', 0, 1)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (16, N'1', 1, 1)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (17, N'4', 0, 1)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (18, N'Buddhism', 0, 2)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (19, N'Gnosticism', 0, 2)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (20, N'All of the above', 1, 2)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (21, N'Christianity', 0, 2)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (22, N'Through the white rabbit', 0, 3)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (23, N'Through a cell phone at work', 0, 3)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (24, N'Through his home computer', 1, 3)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (25, N'Through an analog phone booth', 0, 3)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (26, N'Cypher', 0, 4)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (27, N'The Oracle', 0, 4)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (28, N'Agent Smith', 1, 4)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (29, N'Commander Lock', 0, 4)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (30, N'She enters the Matrix and defeats Agent Smith', 0, 5)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (31, N'She gives Neo CPR on the Nebuchadnezzar', 0, 5)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (32, N'She kisses him', 1, 5)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (33, N'She asks Morpheus for help', 0, 5)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (34, N'He removes the bullet from her body', 0, 6)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (35, N'He patches her into the Agents’ network', 0, 6)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (36, N'He reaches into her body and massages her heart', 1, 6)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (37, N'Trinity doesn’t really die', 0, 6)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (38, N'“Wisdom Is Silence”', 0, 7)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (39, N'“All Is Vanity”', 0, 7)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (40, N'“Know Thyself”', 1, 7)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (41, N'“Father, Son, and Holy Ghost”', 0, 7)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (42, N'Mul1', 1, 12)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (43, N'Mul2', 0, 12)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (44, N'Mul3', 0, 12)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (45, N'Mul4', 0, 12)
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (46, N'Mul5', 1, 12)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[answerDetail] ON 

INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (1, 4, 27, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (2, 7, 39, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (3, 1, 16, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (4, 3, 22, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (5, 12, 42, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (6, 12, 43, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (7, 2, 20, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (8, 5, 31, 6, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (18, 3, 23, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (19, 4, 27, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (20, 6, 35, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (21, 5, 31, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (22, 12, 43, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (23, 12, 44, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (24, 7, 39, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (25, 2, 19, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (26, 1, 15, 6, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (27, 1, 14, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (28, 4, 26, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (29, 3, 22, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (30, 5, 30, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (31, 6, 34, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (32, 7, 38, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (33, 2, 18, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (34, 12, 42, 7, 1, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (35, 12, 42, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (36, 7, 39, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (37, 6, 35, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (38, 2, 19, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (39, 5, 30, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (40, 4, 27, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (41, 1, 15, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (42, 3, 24, 7, 1, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (43, 9, 4, 6, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (44, 10, 7, 6, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (45, 8, 1, 6, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (46, 11, 12, 6, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (47, 9, 4, 6, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (48, 10, 8, 6, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (49, 11, 12, 6, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (50, 8, 2, 6, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (51, 8, 2, 7, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (52, 11, 12, 7, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (53, 9, 5, 7, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (54, 10, 8, 7, 2, 1)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (55, 8, 3, 7, 1, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (56, 11, 12, 7, 1, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (57, 9, 6, 7, 1, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (58, 10, 9, 7, 1, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (59, 4, 29, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (60, 5, 33, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (61, 7, 41, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (62, 12, 46, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (63, 1, 17, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (64, 3, 25, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (65, 6, 37, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (66, 2, 21, 7, 1, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (67, 9, 4, 7, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (68, 8, 2, 7, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (69, 10, 8, 7, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (70, 11, 12, 7, 2, 2)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (71, 10, 8, 7, 2, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (72, 8, 3, 7, 2, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (73, 9, 4, 7, 2, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (74, 11, 12, 7, 2, 3)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (75, 8, 3, 7, 2, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (76, 10, 8, 7, 2, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (77, 9, 4, 7, 2, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (78, 11, 12, 7, 2, 4)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (79, 11, 12, 7, 2, 5)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (80, 9, 4, 7, 2, 5)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (81, 8, 3, 7, 2, 5)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (82, 10, 8, 7, 2, 5)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (83, 10, 8, 7, 2, 6)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (84, 8, 3, 7, 2, 6)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (85, 11, 12, 7, 2, 6)
INSERT [dbo].[answerDetail] ([id], [questionId], [answerId], [userId], [quizId], [attempt]) VALUES (86, 9, 4, 7, 2, 6)
SET IDENTITY_INSERT [dbo].[answerDetail] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (1, N'Math 9', 1)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (2, N'English 9', 2)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (3, N'Social Biology Study ', 3)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (4, N'Laguage: Japan', 4)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (5, N'Scient: Robot', 5)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (6, N'Computer: C++', 6)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (7, N'Technical of Autometic', 7)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (8, N'Art FreeStyle', 8)
INSERT [dbo].[Blog] ([blogId], [blogName], [subId]) VALUES (9, N'Health about younger', 9)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [categoryName], [value]) VALUES (1, N'Subject', N'List Subject')
INSERT [dbo].[Category] ([categoryId], [categoryName], [value]) VALUES (2, N'User', N'List User')
INSERT [dbo].[Category] ([categoryId], [categoryName], [value]) VALUES (3, N'Pratice', N'List Pratice')
INSERT [dbo].[Category] ([categoryId], [categoryName], [value]) VALUES (4, N'Registrations', N'List Registrations')
INSERT [dbo].[Category] ([categoryId], [categoryName], [value]) VALUES (5, N'Setting', N'List Setting')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Dimension] ON 

INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (1, N'd1', N'Business', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (2, N'd1', N'People', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (3, N'd1', N'Process', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (4, N'd2', N'Initiating', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (5, N'd2', N'Planning', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (6, N'd2', N'Executing', N'')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (7, N'd1', N'People check', N'check add')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (8, N'd1', N'People check', N'check add')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (9, N'd2', N'People check add', N'check add')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (10, N'd1', N'check add', N'check add')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (11, N'd1', N'check add', N'check add')
INSERT [dbo].[Dimension] ([dimId], [typeId], [name], [description]) VALUES (12, N'd2', N'check add 2', N'ok')
SET IDENTITY_INSERT [dbo].[Dimension] OFF
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (1, N'Chapter 1', N'l1', 1, N'JMjbPh1Mjn8', N'Matrix', 1, 1, 1, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (2, N'Chapter 1.1', N'l2', 1, N'sKzgMQ8SBQA', N'Add, Subtract Matrix', 1, 1, 1, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (3, N'Chapter 2', N'l1', 2, N'_YkIivLaVJs', N'Vector', 1, 1, 1, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (4, N'Chapter 2.1', N'l1', 2, N'hBKLhiumhhU', N'Trees', 1, 1, 1, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (5, N'Chapter 2.2', N'l2', 2, N'SkidyDQuupA', N'Probability, Basic Overview', 1, 1, 1, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (6, N'Chapter 1', N'l2', 1, N'2rrjlKC6zNM', N'Adverb Clause of Concession', 1, 1, 2, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (7, N'Chapter 1', N'l1', 1, N'HJoDBhWGlJE', N'Traffic Rules', 1, 1, 3, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (8, N'Chapter 1', N'l2', 1, N'GRduRC0MNGI', N'Nationalities and Languages', 1, 1, 4, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (9, N'Chapter 1', N'l1', 1, N'm0Uj7mSC6HU', N'Transition Metals', 1, 1, 5, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (10, N'Chapter 1', N'l1', 1, N'SzJ46YA_RaA', N'Map of Computer Science', 1, 1, 6, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (11, N'Chapter 1', N'l2', 1, N'Ldxuh-mxMjE', N'What Is Career and Technical Education (CTE)?', 1, 1, 7, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (12, N'Chapter 1', N'l1', 1, N'wWW_UbrkBEw', N'Elements of Art: Color', 1, 1, 8, N'ok')
INSERT [dbo].[Lesson] ([lessonId], [lessonName], [typeId], [order], [video_url], [content], [topicId], [status], [subId], [description]) VALUES (13, N'Chapter 1', N'l1', 1, N'yPA8p01_lEM', N'An introduction for teachers', 1, 1, 9, N'ok')
SET IDENTITY_INSERT [dbo].[Lesson] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (1, N'31a81f8e-02d7-4449-8fd3-705383ecfc4a_400_400.jpg', 1, 1, N'Colossal pyramids, imposing temples, golden treasures, enigmatic hieroglyphs, powerful pharaohs, strange gods, and mysterious mummies are features of Ancient Egyptian culture that have fascinated people over the millennia.  The Bible refers to its gods, rulers, and pyramids. Neighboring cultures in the ancient Near East and Mediterranean wrote about its god-like kings and its seemingly endless supply of gold.  The Greeks and Romans describe aspects of Egypts culture and history.<br> As the 19th century began, the Napoleonic campaign in Egypt highlighted the wonders of this ancient land, and public interest soared.  Not long after, Champollion deciphered Egypts hieroglyphs and paved the way for other scholars to reveal that Egyptian texts dealt with medicine, dentistry, veterinary practices, mathematics, literature, and accounting, and many other topics. Then, early in the 20th century, Howard Carter discovered the tomb of Tutankhamun and its fabulous contents. Exhibitions of this treasure a few decades later resulted in the worlds first blockbuster, and its revival in the 21st century has kept interest alive.<br> Join Dr. David Silverman, Professor of Egyptology at Penn, Curator in Charge of the Egyptian Section of the Penn Museum, and curator of the Tutankhamun exhibitions  on a guided tour of the mysteries and wonders of this ancient land.  He has developed this online course and set it in the galleries of the world famous Penn Museum.  He uses many original Egyptian artifacts to illustrate his lectures as he guides students as they make their own discovery of this fascinating culture.', CAST(N'2022-06-02' AS Date), CAST(N'2022-07-05' AS Date), 1, N'Math Phan so', N'Math Practice', 1)
INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (2, N'b1a9da7a-8f9d-46c4-a3f3-b6c6834a6efa_400_400.png', 2, 2, N'Physical indicates connected with, pertaining to, the animal or human body as a material organism: physical strength, exercise. Bodily means belonging to, concerned with, the human body', CAST(N'2021-08-09' AS Date), CAST(N'2021-07-10' AS Date), 1, N'Portugal', N'Physical', 2)
INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (3, N'ba350ec8-3901-4c34-b621-5f041cce9220_400_400.png', 3, 3, N'Computer software is programming code executed on a computer processor. The code can be machine-level code, or code written for an operating system.', CAST(N'2021-11-06' AS Date), CAST(N'2022-05-24' AS Date), 1, N'Computer', N'Computer', 3)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Post_File] ON 

INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (1, N'Practice Math last week', N'P1', N'https://quizizz.com/join/quiz/6274f38387588c001d98c6ac/start?studentShare=true')
INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (2, N'Theory chia het', N'P2', N'https://quizizz.com/join/quiz/62899740d87d08001dc5467f/start?studentShare=true')
INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (3, N'The first Conditional Sentence ', N'P1', N'https://quizizz.com/join/quiz/624ff423ba2320001e9bd949/start?studentShare=true')
SET IDENTITY_INSERT [dbo].[Post_File] OFF
SET IDENTITY_INSERT [dbo].[PricePackage] ON 

INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [salePrice], [status], [description]) VALUES (1, N'3 month access package', 3, 3600, 3200, 1, N'')
INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [salePrice], [status], [description]) VALUES (2, N'6 month access package', 6, 5000, 4500, 0, N'')
INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [salePrice], [status], [description]) VALUES (3, N'Unlimited access package', 0, 10000, 9800, 1, N'')
SET IDENTITY_INSERT [dbo].[PricePackage] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (1, N'How many steps are there to construct the IFE matrix?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (2, N'Which religion is referenced in The Matrix trilogy?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (3, N'How does the Nebuchadnezzar initially contact Neo?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (4, N' Who persistently refers to Neo as Mr. Anderson?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (5, N'What proverb is written in Latin over the Oracle’s kitchen door?', 1, 2, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (6, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (7, N'Which crew member’s body does Agent Smith infiltrate?', 1, 1, 1, N'medium', 1, 1, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (8, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 1, 6, 1, N'medium', 1, 2, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (9, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 1, 6, 1, N'medium', 1, 2, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (10, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 1, 6, 1, N'medium', 1, 2, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (11, N'Which adverb tells where?', 1, 6, 1, N'medium', 1, 2, NULL, 0)
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [lessonId], [topicId], [level], [status], [quizId], [dimmensionId], [isMultipleChoice]) VALUES (12, N'TestMutiple', 1, 6, 1, N'medium', 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizId], [title], [level], [img_url], [start_time], [end_time], [status], [rate], [hasJoin], [subId], [userId], [quesId], [lessonId], [duration], [typeId], [description], [totalQues], [attempt]) VALUES (1, N'Math Matrix', N'Easy', N'', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 0, 1, 1, 1, 1, 1, 20, N'Q1', N'ok', 10, 4)
INSERT [dbo].[Quiz] ([quizId], [title], [level], [img_url], [start_time], [end_time], [status], [rate], [hasJoin], [subId], [userId], [quesId], [lessonId], [duration], [typeId], [description], [totalQues], [attempt]) VALUES (2, N'Vector', N'Medium', N'', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 0, 1, 1, 1, 1, 3, 20, N'Q2', N'ok', 10, 5)
INSERT [dbo].[Quiz] ([quizId], [title], [level], [img_url], [start_time], [end_time], [status], [rate], [hasJoin], [subId], [userId], [quesId], [lessonId], [duration], [typeId], [description], [totalQues], [attempt]) VALUES (3, N'English Tense', N'Medium', N'', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 0, 1, 1, 1, 1, 6, 20, N'Q2', N'ok', 10, 1)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QUIZ_POINT] ON 

INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (1, 6, 0.40000000596046448, 1, CAST(N'2022-07-14' AS Date), 4, 4, 1)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (2, 6, 0.4, 1, CAST(N'2022-07-14' AS Date), 4, 0, 2)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (3, 7, 0.2, 1, CAST(N'2022-07-14' AS Date), 2, 0, 1)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (4, 7, 1.5, 1, CAST(N'2022-07-14' AS Date), 15, 0, 2)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (5, 6, 4, 2, CAST(N'2022-07-14' AS Date), 40, 0, 1)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (6, 6, 6, 2, CAST(N'2022-07-14' AS Date), 60, 0, 2)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (7, 7, 4, 2, CAST(N'2022-07-14' AS Date), 40, 0, 1)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (8, 7, 4, 1, CAST(N'2022-07-14' AS Date), 40, 0, 3)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (9, 7, 0.5, 1, CAST(N'2022-07-14' AS Date), 5, 0, 4)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (10, 7, 6, 2, CAST(N'2022-07-14' AS Date), 60, 0, 2)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (12, 7, 8, 2, CAST(N'2022-07-14' AS Date), 80, 0, 4)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (13, 7, 10, 2, CAST(N'2022-07-14' AS Date), 100, 0, 5)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (14, 7, 10, 2, CAST(N'2022-07-14' AS Date), 100, 0, 6)
INSERT [dbo].[QUIZ_POINT] ([id], [userId], [point], [quizId], [taken_date], [pointPercent], [numQuesTrue], [attempt]) VALUES (11, 7, 8, 2, CAST(N'2022-07-14' AS Date), 80, 0, 3)
SET IDENTITY_INSERT [dbo].[QUIZ_POINT] OFF
SET IDENTITY_INSERT [dbo].[Registration_Subject] ON 

INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [statis], [subId], [priceId], [userId]) VALUES (1, CAST(N'2022-06-22' AS Date), N'1', 1, 1, 6)
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [statis], [subId], [priceId], [userId]) VALUES (2, CAST(N'2022-05-22' AS Date), N'1', 2, 2, 6)
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [statis], [subId], [priceId], [userId]) VALUES (3, CAST(N'2022-05-23' AS Date), N'1', 3, 2, 6)
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [statis], [subId], [priceId], [userId]) VALUES (4, CAST(N'2022-05-24' AS Date), N'1', 3, 1, 7)
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [statis], [subId], [priceId], [userId]) VALUES (5, CAST(N'2022-06-21' AS Date), N'1', 4, 2, 7)
SET IDENTITY_INSERT [dbo].[Registration_Subject] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'CUSTOMER')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'EXPERT')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (4, N'SALE')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (5, N'MARKETING')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (1, N'1.png', 1, N'Quiz Practice', N'In this course, you will learn how social workers in the United States engage in creating change and supporting the resilience of individuals, families and communities in this new era.', N'', N'Sale for Social Studies', 1, 3)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (2, N'2.png', 1, N'Math Class', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.', N'', N'Sale for Math', 1, 1)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (3, N'3.png', 1, N'English Class', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.', N'', N'Sale for English', 1, 2)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (4, N'4.png', 1, N'Health & Physical Education', N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.', N'', N'Sale for Health', 1, 9)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (5, N'5.png', 1, N'History Class', N'This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.', N'', N'Sale for Technical', 1, 7)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (6, N'6.png', 1, N'Computer Class', N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety. ', N'', N'Sale for Computer', 1, 6)
INSERT [dbo].[Slider] ([sliderId], [slider_url], [status], [title], [content], [backlink], [notes], [isShow], [subId]) VALUES (7, N'7.png', 1, N'Art Class', N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal. ', N'', N'Sale for Arts', 1, 8)
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (1, N'Math', 1, 1, 20, N'Mathematics', N'https://cf.quizizz.com/img/course-assets/title_imgs/2%20-%20Mathematics.png', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (2, N'English', 1, 1, 20, N'English and Language Arts', N'https://cf.quizizz.com/img/course-assets/title_imgs/1%20-%20English%20and%20Language%20Arts.png', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (3, N'Social Studies', 1, 1, 20, N'Social Studies', N'https://cf.quizizz.com/img/course-assets/title_imgs/3%20-%20Social%20Studies.png', N'In this course, you will learn how social workers in the United States engage in creating change and supporting the resilience of individuals, families and communities in this new era.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (4, N'World Languages', 1, 1, 20, N'World Languages', N'https://cf.quizizz.com/img/course-assets/title_imgs/5-%20World%20Languages.png', N'Through this course, you can understand Korean more deeply and get advanced Korean language skills. This course is for advanced Korean learners who are interested in Korean language and culture.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (5, N'Science', 1, 1, 20, N'Science', N'https://cf.quizizz.com/img/course-assets/title_imgs/4%20-%20Science.png', N'The course aims to explain the scientific principles and techniques behind the work of forensic scientists and will be illustrated with numerous case studies from Singapore and around the world.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (6, N'Computer Science and Skills', 1, 1, 20, N'Computer Science and Skills', N'https://cf.quizizz.com/img/course-assets/title_imgs/8%20-%20Computer%20Science.png', N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (7, N'Career and Technical Education', 1, 1, 20, N'Career and Technical Education', N'https://cf.quizizz.com/img/course-assets/title_imgs/lifeskills_s.png', N'This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (8, N'Creative Arts', 1, 1, 20, N'Creative Arts', N'https://cf.quizizz.com/img/course-assets/title_imgs/6%20-%20Creative%20Arts.png', N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal.')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [categoryId], [status], [tagLine], [title], [thumbnail], [description]) VALUES (9, N'Health and Physical Education', 1, 1, 20, N'Health and Physical Education', N'https://cf.quizizz.com/img/course-assets/title_imgs/7-%20PE%26Health.png', N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.')
SET IDENTITY_INSERT [dbo].[Subject] OFF
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (3, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 2)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (9, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (6, 3)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (3, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 2)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (9, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (6, 3)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 1)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 3)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 5)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (2, 6)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (3, 1)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (3, 2)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (3, 5)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (4, 1)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (4, 2)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (4, 3)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (4, 6)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (6, 4)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (6, 2)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (6, 1)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (5, 1)
INSERT [dbo].[SubjectDimension] ([subjectId], [dimId]) VALUES (5, 5)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 4)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 2)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 8)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 3)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 6)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 1)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 7)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 5)
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 9)
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (1, N'Topic 1', 1, 2)
INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (2, N'Topic 2', 1, 2)
INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (3, N'Topic 3', 1, 2)
INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (4, N'Topic 4', 1, 3)
INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (5, N'Topic 5', 1, 4)
INSERT [dbo].[Topic] ([topicId], [name], [status], [subId]) VALUES (6, N'Topic 6', 1, 5)
SET IDENTITY_INSERT [dbo].[Topic] OFF
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'd1', N'Domain')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'd2', N'Group')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l1', N'Subject Topic')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l2', N'Lesson')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l3', N'Quiz')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P1', N'Question')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P2', N'Lesson')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P3', N'Practice')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'Q1', N'Practice')
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'Q2', N'Exam')
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([answerId])
REFERENCES [dbo].[Answer] ([answerId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Subject]
GO
ALTER TABLE [dbo].[Customer_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Exam] FOREIGN KEY([examId])
REFERENCES [dbo].[Exam] ([examId])
GO
ALTER TABLE [dbo].[Customer_Exam] CHECK CONSTRAINT [FK_Customer_Exam_Exam]
GO
ALTER TABLE [dbo].[Customer_Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Customer_Exam] FOREIGN KEY([CE_id])
REFERENCES [dbo].[Customer_Exam] ([CE_id])
GO
ALTER TABLE [dbo].[Customer_Exam_Detail] CHECK CONSTRAINT [FK_Customer_Exam_Customer_Exam]
GO
ALTER TABLE [dbo].[Customer_Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Detail_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Customer_Exam_Detail] CHECK CONSTRAINT [FK_Customer_Exam_Detail_Question]
GO
ALTER TABLE [dbo].[Dimension]  WITH CHECK ADD  CONSTRAINT [FK_Dimension_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Dimension] CHECK CONSTRAINT [FK_Dimension_Type]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Account]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Category]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Exam_Type] FOREIGN KEY([exam_typeId])
REFERENCES [dbo].[Exam_Type] ([exam_typeId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Exam_Type]
GO
ALTER TABLE [dbo].[Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Detail_Exam] FOREIGN KEY([examId])
REFERENCES [dbo].[Exam] ([examId])
GO
ALTER TABLE [dbo].[Exam_Detail] CHECK CONSTRAINT [FK_Exam_Detail_Exam]
GO
ALTER TABLE [dbo].[Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Detail_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Exam_Detail] CHECK CONSTRAINT [FK_Exam_Detail_Question]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Subject]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Blog] FOREIGN KEY([categoryBlogId])
REFERENCES [dbo].[Blog] ([blogId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Blog]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Post_File] FOREIGN KEY([postFileId])
REFERENCES [dbo].[Post_File] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Post_File]
GO
ALTER TABLE [dbo].[Post_File]  WITH CHECK ADD  CONSTRAINT [FK_Post_File_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Post_File] CHECK CONSTRAINT [FK_Post_File_Type]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([topicId])
REFERENCES [dbo].[Topic] ([topicId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Question]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Quiz]
GO
ALTER TABLE [dbo].[QuestionDimension]  WITH CHECK ADD  CONSTRAINT [FK_QuestionDimension_Dimension] FOREIGN KEY([dimId])
REFERENCES [dbo].[Dimension] ([dimId])
GO
ALTER TABLE [dbo].[QuestionDimension] CHECK CONSTRAINT [FK_QuestionDimension_Dimension]
GO
ALTER TABLE [dbo].[QuestionDimension]  WITH CHECK ADD  CONSTRAINT [FK_QuestionDimension_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[QuestionDimension] CHECK CONSTRAINT [FK_QuestionDimension_Question]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Account]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Lesson]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Type]
GO
ALTER TABLE [dbo].[QUIZ_POINT]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QUIZ_POINT]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_Account]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_PricePackage]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_Subject]
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD  CONSTRAINT [FK_Setting_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Setting] CHECK CONSTRAINT [FK_Setting_Type]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Subject]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Category]
GO
ALTER TABLE [dbo].[SubjectDimension]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDimension_Dimension] FOREIGN KEY([dimId])
REFERENCES [dbo].[Dimension] ([dimId])
GO
ALTER TABLE [dbo].[SubjectDimension] CHECK CONSTRAINT [FK_SubjectDimension_Dimension]
GO
ALTER TABLE [dbo].[SubjectDimension]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDimension_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectDimension] CHECK CONSTRAINT [FK_SubjectDimension_Subject]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_PricePackage]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_Subject]
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project_Test] SET  READ_WRITE 
GO
