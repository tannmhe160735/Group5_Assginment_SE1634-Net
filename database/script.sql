USE [master]
GO
/****** Object:  Database [onlineShopSWP]    Script Date: 9/30/2022 1:58:14 PM ******/
CREATE DATABASE [onlineShopSWP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineShopSWP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\onlineShopSWP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlineShopSWP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\onlineShopSWP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [onlineShopSWP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineShopSWP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineShopSWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineShopSWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineShopSWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineShopSWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineShopSWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineShopSWP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineShopSWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineShopSWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineShopSWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineShopSWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineShopSWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineShopSWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineShopSWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineShopSWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineShopSWP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [onlineShopSWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineShopSWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineShopSWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineShopSWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineShopSWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineShopSWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineShopSWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineShopSWP] SET RECOVERY FULL 
GO
ALTER DATABASE [onlineShopSWP] SET  MULTI_USER 
GO
ALTER DATABASE [onlineShopSWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineShopSWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineShopSWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineShopSWP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlineShopSWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [onlineShopSWP] SET QUERY_STORE = OFF
GO
USE [onlineShopSWP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [onlineShopSWP]
GO
/****** Object:  Table [dbo].[account]    Script Date: 9/30/2022 1:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[address] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[avatar] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 9/30/2022 1:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cate_id] [int] NOT NULL,
	[cate_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[feedback_content] [ntext] NULL,
	[feedback_img] [ntext] NULL,
	[feedback_date] [date] NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[order_date] [date] NULL,
	[prod_id] [int] NULL,
	[quantity] [int] NULL,
	[total_price] [float] NULL,
	[payment_id] [int] NULL,
	[status] [int] NULL,
	[notes] [ntext] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [nvarchar](50) NOT NULL,
	[content] [ntext] NOT NULL,
	[img] [ntext] NULL,
	[post_date] [date] NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[sale_price] [float] NULL,
	[quantity] [int] NULL,
	[description] [ntext] NULL,
	[img] [ntext] NULL,
	[category_id] [int] NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_new]    Script Date: 9/30/2022 1:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher_new](
	[voucher_code] [nvarchar](50) NOT NULL,
	[voucher_create] [date] NULL,
	[voucher_experience] [date] NULL,
	[voucher_discount] [float] NULL,
 CONSTRAINT [PK_voucher_new] PRIMARY KEY CLUSTERED 
(
	[voucher_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [onlineShopSWP] SET  READ_WRITE 
GO
