USE [master]
GO
/****** Object:  Database [library_test]    Script Date: 2019/5/8 22:03:58 ******/
CREATE DATABASE [library_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = 'Library_Data', FILENAME = 'D:\SQLServer2017Media\SQLServe\MSSQL14.MSSQLSERVER\MSSQL\DATA\library_test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = 'Library_Log', FILENAME = 'D:\SQLServer2017Media\SQLServe\MSSQL14.MSSQLSERVER\MSSQL\DATA\lib_1.ldf' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [library_test] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library_test].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [library_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [library_test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [library_test] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [library_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library_test] SET  MULTI_USER 
GO
ALTER DATABASE [library_test] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [library_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library_test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [library_test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format 'library_test', 'ON'
GO
ALTER DATABASE [library_test] SET QUERY_STORE = OFF
GO
USE [library_test]
GO
/****** Object:  Table [dbo].[book]    Script Date: 2019/5/8 22:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE TABLE [dbo].[book](
	[bookid] [char](10) NOT NULL,
	[bookname] [varchar](100) NOT NULL,
	[author] [varchar](50) NULL,
	[price] [float] NULL,
	[catid] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrow]    Script Date: 2019/5/8 22:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrow](
	[stuid] [char](20) NOT NULL,
	[bookid] [char](10) NOT NULL,
	[borrowdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2019/5/8 22:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catid] [char](10) NOT NULL,
	[catname] [varchar](100) NOT NULL,
	[num] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 2019/5/8 22:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[major](
	[majorid] [char](10) NOT NULL,
	[majorname] [varchar](30) NULL,
	[department] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[majorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2019/5/8 22:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[stuid] [char](20) NOT NULL,
	[stuname] [varchar](50) NOT NULL,
	[degree] [varchar](10) NOT NULL,
	[majorid] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b001      ', '货币银行学', '李双伟', 55, 'c2        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b003      ', '数据库系统全书', '加西亚-莫里纳', 65, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b007      ', '微观经济学', '喻德坚', 48, 'c2        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b009      ', '算法导论', '科曼', 85, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b010      ', '数据挖掘概念与技术', '韩家炜', 55, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b012      ', 'DB2数据库性能调整和优化', '牛新庄', 68, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b014      ', '数学分析原理', '卢丁', 28, 'c3        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b016      ', '现代量子力学', 'J.J.Sakurai', 36, 'c3        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b021      ', '现代操作系统', 'Tanenbaum', 55, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b023      ', '编译原理', 'alfred v．aho', 55, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b025      ', '数据库系统概念', '西尔伯沙茨', 69.5, 'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES ('b032      ', '马克思主义基本原理概论', '邓晓辉', 17.8, 'c4        ')
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b003      ', CAST('2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b023      ', CAST('2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b014      ', CAST('2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b021      ', CAST('2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200910121           ', 'b003      ', CAST('2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200910121           ', 'b014      ', CAST('2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('201010121           ', 'b014      ', CAST('2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('201021109           ', 'b001      ', CAST('2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('201021109           ', 'b012      ', CAST('2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1200910211          ', 'b009      ', CAST('2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1200910211          ', 'b010      ', CAST('2010-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1200910211          ', 'b021      ', CAST('2010-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1200910211          ', 'b023      ', CAST('2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1201022135          ', 'b016      ', CAST('2010-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('201021109           ', 'b003      ', CAST('2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('201010121           ', 'b003      ', CAST('2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1201022135          ', 'b025      ', CAST('2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b025      ', CAST('2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b007      ', CAST('2010-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('200810111           ', 'b032      ', CAST('2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES ('1201022135          ', 'b003      ', CAST('2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES ('c1        ', '计算机技术', 1300)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES ('c2        ', '经济', 1100)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES ('c3        ', '数理科学', 2300)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES ('c4        ', '政治', 500)
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES ('m1        ', '计算机科学与技术                      ', '计算机与控制工程学院                    ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES ('m2        ', '信息安全                          ', '计算机与控制工程学院                    ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES ('m3        ', '金融工程                          ', '金融学院                          ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES ('m4        ', '政治学                           ', '周恩来政府管理学院                     ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('1200910211          ', '周昕', '研究生', 'm1        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('1201022020          ', '张三', '研究生', 'm2        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('1201022135          ', '吴城', '研究生', 'm4        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('200810111           ', '王玲', '本科生', 'm2        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('200910121           ', '王菲', '本科生', 'm3        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('201010121           ', '李飞', '本科生', 'm3        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES ('201021109           ', '赵四', '本科生', 'm1        ')
ALTER TABLE [dbo].[book]  WITH CHECK ADD FOREIGN KEY([catid])
REFERENCES [dbo].[category] ([catid])
GO
ALTER TABLE [dbo].[borrow]  WITH CHECK ADD FOREIGN KEY([bookid])
REFERENCES [dbo].[book] ([bookid])
GO
ALTER TABLE [dbo].[borrow]  WITH CHECK ADD FOREIGN KEY([stuid])
REFERENCES [dbo].[student] ([stuid])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([majorid])
REFERENCES [dbo].[major] ([majorid])
GO
USE [master]
GO
ALTER DATABASE [library_test] SET  READ_WRITE 
GO
