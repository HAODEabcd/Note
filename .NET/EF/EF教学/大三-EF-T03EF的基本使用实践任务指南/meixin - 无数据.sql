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
