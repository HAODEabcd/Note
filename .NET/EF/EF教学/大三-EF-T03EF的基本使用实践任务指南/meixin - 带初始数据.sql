USE [master]
GO
/****** Object:  Database [meixin]    Script Date: 2020/3/30 10:16:12 ******/
CREATE DATABASE [meixin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'meixin', FILENAME = N'D:\db_data\G3\meixin.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'meixin_log', FILENAME = N'D:\db_data\G3\meixin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [meixin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [meixin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [meixin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [meixin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [meixin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [meixin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [meixin] SET ARITHABORT OFF 
GO
ALTER DATABASE [meixin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [meixin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [meixin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [meixin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [meixin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [meixin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [meixin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [meixin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [meixin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [meixin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [meixin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [meixin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [meixin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [meixin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [meixin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [meixin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [meixin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [meixin] SET RECOVERY FULL 
GO
ALTER DATABASE [meixin] SET  MULTI_USER 
GO
ALTER DATABASE [meixin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [meixin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [meixin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [meixin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [meixin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'meixin', N'ON'
GO
USE [meixin]
GO
/****** Object:  Table [dbo].[m_admin]    Script Date: 2020/3/30 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](500) NOT NULL,
	[pwd] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_m_admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_order]    Script Date: 2020/3/30 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone] [varchar](500) NULL,
	[address] [varchar](500) NULL,
	[sendtime] [varchar](500) NULL,
	[message] [varchar](500) NULL,
	[status] [varchar](500) NULL,
	[ordertime] [datetime] NULL,
	[m_user_email] [varchar](500) NOT NULL,
	[total] [float] NOT NULL,
	[m_user_id] [int] NOT NULL,
 CONSTRAINT [PK_m_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m_orderdetails]    Script Date: 2020/3/30 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_orderdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NOT NULL,
	[m_order_id] [int] NOT NULL,
	[m_product_id] [int] NOT NULL,
 CONSTRAINT [PK_m_orderdetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_product]    Script Date: 2020/3/30 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](500) NULL,
	[photo] [varchar](500) NULL,
	[price] [float] NOT NULL,
	[flavor] [varchar](500) NULL,
	[category] [varchar](500) NULL,
	[status] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[m_shop_id] [int] NOT NULL,
	[m_area_id] [int] NOT NULL,
 CONSTRAINT [PK_m_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m_user]    Script Date: 2020/3/30 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](500) NOT NULL,
	[pwd] [varchar](500) NOT NULL,
	[logintime] [datetime] NULL,
 CONSTRAINT [PK_m_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_FK_m_userm_order]    Script Date: 2020/3/30 10:16:12 ******/
CREATE NONCLUSTERED INDEX [IX_FK_m_userm_order] ON [dbo].[m_order]
(
	[m_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_m_orderdetailsm_product]    Script Date: 2020/3/30 10:16:12 ******/
CREATE NONCLUSTERED INDEX [IX_FK_m_orderdetailsm_product] ON [dbo].[m_orderdetails]
(
	[m_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_m_orderm_orderdetails]    Script Date: 2020/3/30 10:16:12 ******/
CREATE NONCLUSTERED INDEX [IX_FK_m_orderm_orderdetails] ON [dbo].[m_orderdetails]
(
	[m_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[m_order]  WITH CHECK ADD  CONSTRAINT [FK_m_userm_order] FOREIGN KEY([m_user_id])
REFERENCES [dbo].[m_user] ([id])
GO
ALTER TABLE [dbo].[m_order] CHECK CONSTRAINT [FK_m_userm_order]
GO
ALTER TABLE [dbo].[m_orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_m_orderdetailsm_product] FOREIGN KEY([m_product_id])
REFERENCES [dbo].[m_product] ([id])
GO
ALTER TABLE [dbo].[m_orderdetails] CHECK CONSTRAINT [FK_m_orderdetailsm_product]
GO
ALTER TABLE [dbo].[m_orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_m_orderm_orderdetails] FOREIGN KEY([m_order_id])
REFERENCES [dbo].[m_order] ([id])
GO
ALTER TABLE [dbo].[m_orderdetails] CHECK CONSTRAINT [FK_m_orderm_orderdetails]
GO
USE [master]
GO
ALTER DATABASE [meixin] SET  READ_WRITE 
GO


--插入初始数据
SET IDENTITY_INSERT [dbo].[m_admin] ON 
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (1, N'admin', N'123456')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (2, N'adm', N'12345')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (3, N'liudehua', N'derde56')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (4, N'liyifei', N'34r43f')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (5, N'tester', N'3434262')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (6, N'dep003', N'25610sdf3')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (7, N'saleser', N'32r34fsd')
INSERT [dbo].[m_admin] ([ID], [uname], [pwd]) VALUES (8, N'dba', N'23423rff')
SET IDENTITY_INSERT [dbo].[m_admin] OFF

SET IDENTITY_INSERT [dbo].[m_user] ON 
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (1, N'lyf@163.com', N'1234', '2019-10-01 00:01:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (2, N'sxiayia@163.com', N'234wfwf24', '2019-11-11 00:01:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (3, N'lljdien@163.com', N'2349djidf', '2019-11-11 00:15:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (4, N'ldh@126.com', N'12334', '2019-11-11 12:16:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (5, N'qwere@qq.com', N'asdfsdf2r', '2019-12-05 08:08:12')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (6, N'w007@qq.com', N'1234', '2019-12-24 13:05:11')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (7, N'wandg@163.com', N'23423', '2020-01-11 08:01:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (8, N'jhjei2@qq.com', N'398402', '2020-02-11 08:01:00')
INSERT [dbo].[m_user] ([id], [email], [pwd], [logintime]) VALUES (9, N'tianw007@163.com', N'123', '2020-03-11 08:01:00')
SET IDENTITY_INSERT [dbo].[m_user] OFF

SET IDENTITY_INSERT [dbo].[m_product] ON 

INSERT [dbo].[m_product] ([id], [pname], [photo], [price], [flavor], [category], [status], [description], [m_shop_id], [m_area_id]) VALUES (6, N'蒙牛纯奶250ML', N'/upfile/Upload/111.jpg', 3, N'新鲜奶(6天内有效)', N'奶制品', N'上架', N'', 2, 1)
INSERT [dbo].[m_product] ([id], [pname], [photo], [price], [flavor], [category], [status], [description], [m_shop_id], [m_area_id]) VALUES (7, N'光明纯奶250ML', N'/upfile/Upload/222.jpg', 3.5, N'新鲜奶(6天内有效)', N'奶制品', N'上架', N'', 2, 1)
SET IDENTITY_INSERT [dbo].[m_product] OFF

SET IDENTITY_INSERT [dbo].[m_order] ON 
INSERT dbo.m_order ([id],[phone],[address],[sendtime],[message],[status],[ordertime],[m_user_email],[total],[m_user_id]) VALUES(3,'13512312312','湖北省武汉光谷大道123号',null, '送货前请电话联系','已付款',getdate(),'lyf@163.com',3.5,1)
INSERT dbo.m_order ([id],[phone],[address],[sendtime],[message],[status],[ordertime],[m_user_email],[total],[m_user_id]) VALUES(4,'18627272323','安徽省合肥市明珠大道111号',null, '送货前请电话联系','已付款',getdate(),'lyf@163.com',3,1)
SET IDENTITY_INSERT [dbo].[m_order]OFF

SET IDENTITY_INSERT [dbo].[m_orderdetails] ON 
INSERT [dbo].[m_orderdetails]([id],[amount],[m_order_id],[m_product_id]) VALUES(1,1,3,7)
INSERT dbo.m_orderdetails([id],[amount],[m_order_id],[m_product_id]) VALUES(2,1,4,6)
SET IDENTITY_INSERT [dbo].[m_orderdetails] OFF
GO

select  * from m_orderdetails
