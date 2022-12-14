USE [master]
GO
/****** Object:  Database [data]    Script Date: 11/9/2022 8:44:58 PM ******/
CREATE DATABASE [data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'data_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERSM22\MSSQL\DATA\data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'data_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERSM22\MSSQL\DATA\data.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [data] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [data] SET ARITHABORT OFF 
GO
ALTER DATABASE [data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [data] SET RECOVERY FULL 
GO
ALTER DATABASE [data] SET  MULTI_USER 
GO
ALTER DATABASE [data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'data', N'ON'
GO
ALTER DATABASE [data] SET QUERY_STORE = OFF
GO
USE [data]
GO
/****** Object:  Table [dbo].[account]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 11/9/2022 8:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [float] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/9/2022 8:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nchar](50) NULL,
	[user_id] [int] NULL,
	[payment_method] [nchar](50) NULL,
	[voucher_code] [nchar](20) NULL,
	[status] [int] NULL,
	[date_created] [datetime] NULL,
	[totalPrice] [float] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 11/9/2022 8:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[oder_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_order_detail_1] PRIMARY KEY CLUSTERED 
(
	[oder_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 11/9/2022 8:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product_size] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_new]    Script Date: 11/9/2022 8:44:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (2, N'Duy Binh', N'binhtd@gmail.com', N'binh2001 ', 1, N'0928365864 ', N'Hoa Lac, Ha Noi, Viet Nam', 2, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (3, N'Quang Linh', N'linhvlog@gmail.com', N'ql12345678', 1, N'0335862805 ', N'Hai Duong, Viet Nam', 3, N'img\9c8af39b73759a4b63e50fe28250c3e9.jpg')
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (11, N'Khac Ngoc', N'ngocchubedan@gmail.com', N'ngocngungo', 1, N'0969696969 ', N'Dong Anh, Ha Noi, VIet Nam', 3, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (12, N'Chi Tho Ngoc', N'hangngatiti@gmail.com', N'chihangxinhdep', 0, N'0913672158 ', N'Cung Trang', 3, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (13, N'Chu Cuoi', N'lilcuoine@gmail.com', N'lilcuoivl', 1, N'0918517581 ', N'Cung Trang', 3, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (14, N'admin', N'admin@gmai.com', N'admin', 1, N'0915187811 ', N'Hoa Lac, Ha Noi', 1, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (15, N'staff', N'staff@gmail.com', N'staff', 0, N'0912781481 ', N'Hoa Lac, Ha Noi', 2, NULL)
INSERT [dbo].[account] ([acc_id], [fullname], [email], [password], [gender], [phone], [address], [role_id], [avatar]) VALUES (16, N'quanglinh', N'linhnqhe151159@fpt.edu.vn', N'quanglinh', NULL, NULL, NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (1, 2, 1, 10, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (2, 2, 3, 12, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (3, 2, 5, 14, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (4, 2, 6, 15, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (5, 2, 9, 16, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (6, 2, 4, 17, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (7, 2, 5, 18, NULL, NULL)
INSERT [dbo].[cart] ([cart_id], [user_id], [product_id], [quantity], [total_price], [size]) VALUES (8, 2, 8, 11, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
INSERT [dbo].[category] ([cate_id], [cate_name]) VALUES (1, N'Nike')
INSERT [dbo].[category] ([cate_id], [cate_name]) VALUES (2, N'Adidas')
INSERT [dbo].[category] ([cate_id], [cate_name]) VALUES (3, N'New Balance')
INSERT [dbo].[category] ([cate_id], [cate_name]) VALUES (4, N'Converse')
INSERT [dbo].[category] ([cate_id], [cate_name]) VALUES (5, N'Vans')
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (1, NULL, N'ha noi                                            ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (2, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'                                                  ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (3, NULL, NULL, N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (4, NULL, NULL, N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (5, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 192.5)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (6, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 192.5)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (7, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 192.5)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (8, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 66.5)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (9, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 126)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (10, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 126)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (11, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 420)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (12, NULL, N'Thạch Hòa                                         ', N'0335862805', N'nguyenquanglinh122017@gmail.com                   ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (13, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhnqhe151159@fpt.edu.vn                         ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (14, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (15, NULL, N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 144)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (16, N'QuangLinh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (17, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 90)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (18, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 90)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (19, N'Sieu nhan  Gao do', N'noi nao co su song, noi do co cong ly             ', N'0987654321', N'sieunhangaodo@gmai.com                            ', NULL, N'cod                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 281)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (20, N'QL', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (21, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (22, N'ok', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (23, N'ok', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (24, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 66.5)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (25, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', NULL, 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (26, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', N'salethang10         ', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 56.699996948242188)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (27, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', N'Discount: 30.00%    ', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (28, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', N'Discount: 30.00%    ', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (29, N'sieu nhan gao trang', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', N'Discount: 50.00%    ', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 90)
INSERT [dbo].[order] ([order_id], [name], [address], [phone], [email], [user_id], [payment_method], [voucher_code], [status], [date_created], [totalPrice]) VALUES (30, N'Quang Linh', N'Thạch Hòa                                         ', N'0335862805', N'linhvlog@gmail.com                                ', NULL, N'COD                                               ', N'Discount: 30.00%    ', 2, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 199.5)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (1, 1, 3, 4, 42)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (2, 1, 2, 3, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (4, 23, 2, 2, 40)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (5, 24, 3, 1, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (6, 25, 2, 1, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (7, 26, 25, 1, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (8, 27, 4, 1, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (9, 28, 2, 1, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (10, 29, 6, 2, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (11, 30, 3, 2, 37)
INSERT [dbo].[order_detail] ([oder_detail_id], [order_id], [product_id], [quantity], [size]) VALUES (12, 30, 3, 1, 38)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (2, N'AIR JORDAN 1', 90, NULL, 17, N'Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (3, N'NIKE AIR UPTEMPO', 95, NULL, 18, N'Sympathetic uveitis', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493609121402971/nike-air-max-air-jordan-sneakers-shoe-nike-6c6d33ec0cdf28cee21c44facebc5f93.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (4, N'Nike Free Nike Air Max', 60, NULL, 13, N'Unspecified soft tissue disorder related to use, overuse and pressure, unspecified hand', N'https://cdn.discordapp.com/attachments/948046250421399552/1031758429464842304/nike-free-nike-air-max-sneakers-shoe-red-shoes-78c3ee1eb5170ce50ef0c55755e33899.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (5, N'Nike Air Max Sneakers', 75, NULL, 16, N'Auditory recruitment, right ear', N'https://cdn.discordapp.com/attachments/948046250421399552/1031758675896975460/nike-air-max-nike-free-air-force-shoe-nike-91a57ad774c86d907884aad806d0cfeb.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (6, N'Air Force Sneakers Nike Air Jordan', 90, NULL, 6, N'White, Disorders of visual pathways in (due to) inflammatory disorders, left side', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493607196217424/air-force-sneakers-nike-air-jordan-shoe-sneaker-548fbe0adbc06f87acd4d9ce0102bd7f.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (7, N'Nike Air Max 97', 90, NULL, 18, N'Other disorders of continuity of bone, left pelvic region and thigh', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493608739700746/nike-air-max-97-shoe-sneakers-nike-fdcbb5186af1003a128cb356cf33beed.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (8, N'Air Force Air Jordan', 90, NULL, 9, N'Multiple endocrine neoplasia [MEN] type IIA', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493537029701662/air-force-air-jordan-shoe-retro-style-adidas-jordan-8743ae5515a736c4e403ee6a4cb5f690.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (9, N'Nike Air Max Air Jordan ', 60, NULL, 15, N'Plasmodium vivax malaria with other complications', N'https://cdn.discordapp.com/attachments/948046250421399552/1031758977849118840/nike-air-max-sneakers-womens-nike-air-force-1-07-shoe-nike-023c8d6552b3e7ca5eb0171668772fb8.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (10, N'Nike Air Max 97', 96, NULL, 17, N'Nondisplaced fracture of greater trochanter of unspecified femur, subsequent encounter for closed fracture with nonunion', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031495911609733170/nike-air-max-97-shoe-sneakers-air-max-98e6311a953aa77672c3bd047b0396e9.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (14, N'Air Jordan 1Retro High OG NRG Gold Toe Black', 76, NULL, 6, N'Complication of unspecified artery following a procedure, not elsewhere classified', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031496359544623144/5bba9de73e0ac-59caa6e646d9a8327f0b84f0b679cca5.png', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (15, N'Adidas Yeezy Sneakers', 62, NULL, 9, N'Pneumonia due to Methicillin resistant Staphylococcus aureus', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031493514883768341/adidas-yeezy-sneakers-shoe-nike-air-yeezy-adidas-1ccf2b32d4e1368d5dda7b5305355f3e.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (16, N'Adidas Superstar', 77, NULL, 11, N'Laceration without foreign body of right index finger with damage to nail, initial encounter', N'https://cdn.discordapp.com/attachments/908649530763915288/1031405419765174312/addidas.jpg?fbclid=IwAR1V-NJ7M6-54fs2T3cf1G-8Yv3vI3ipuDY8m7wrbs8wgZm8_7iIBrXJylw', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (17, N'Adidas Ultra Boost', 75, NULL, 18, N'Salter-Harris Type I physeal fracture of unspecified calcaneus, sequela', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031497462524956742/adidas-originals-shoe-white-sneakers-adidas-running-shoes-products-in-kind-27767fd8215ae3d7f28190c1b833f239.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (18, N'Adidas Yeezy Sneakers White', 50, NULL, 20, N'Corrosion of first degree of unspecified palm, subsequent encounter', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031497865664680006/adidas-yeezy-sneakers-white-adidas-originals-adidas-aa5294e70df0eda31610a4d90796502e.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (19, N'Adidas Originals Shoe Sneakers', 85, NULL, 12, N'Unspecified occupant of pick-up truck or van injured in collision with other motor vehicles in traffic accident', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031498405815525406/adidas-originals-shoe-sneakers-clothing-gazelle-e160e8e737b3748ac985f8b7da572b26.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (20, N'Adidas Originals Sneakers Shoe Blue', 62, NULL, 7, N'Superficial foreign body of right back wall of thorax', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031498743360524308/adidas-originals-sneakers-shoe-blue-adidas-305bff1028e6f9733f977a3589aab7b1.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (21, N'gazelle', 80, NULL, 16, N'Unspecified injury of bladder, subsequent encounter', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031499118465515550/sneakers-puma-shoe-nike-converse-gazelle-7881e95e77445c9025c0f7f7e765e0a2.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (22, N'Adidas Yeezy Blue Color', 80, NULL, 11, N'Osteochondropathy, unspecified, left lower leg', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031499350523789392/adidas-yeezy-tints-and-shades-blue-color-adidas-0e2348b8d42653da7934c7a0e4b568d7.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (23, N'Adidas Yeezy Sneakers', 77, NULL, 13, N'Indeterminate colitis', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031499562998837248/adidas-yeezy-sneakers-nike-air-yeezy-adidas-c26fba4fedc7ac52f11c4141830ab29c.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (24, N'Adidas Stan Smith', 65, NULL, 10, N'Unspecified injury of muscle and tendon of long flexor muscle of toe at ankle and foot level, left foot, initial encounter', N'https://cdn.discordapp.com/attachments/1031493465688772608/1031499807929401364/adidas-stan-smith-sneakers-shoe-leather-shawls-f53d3dc34fc2eee1c6d278d63c45bf28.png', 2, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (25, N'Vans Vault Old Skool Black 2022 - VN0A4P3XOIU', 81, NULL, 17, N'Palindromic rheumatism, hip', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/haven-vans-vault-ua-og-old-skool.jpg?v=1622881946000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (28, N'Vans Style 36 Decon Marshmallow, The', 72, NULL, 10, N'Abnormal histological findings in specimens from other organs, systems and tissues', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/32a1446346073fb4b75b4e35ed11c68c-jpeg.jpg?v=1654107484000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (29, N'Vans Vault OG Sk8 Black White', 80, NULL, 18, N'Legal intervention involving injury by rubber bullet, bystander injured', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/haven-vans-vault-ua-og-sk8-hi-lx-suede-canvas-black-true-white-1-2048x2048-progressive.jpg?v=1622881884000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (30, N'Vans Vault Slip On Checkerboard (2019)', 60, NULL, 13, N'Unspecified ectropion of right lower eyelid', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/8e1476794a3fa01540c1ce6d485300395b64d830.jpg?v=1620547494000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (31, N'Vans Vault Epoch Black / True White', 92, NULL, 16, N'Toxic effect of ketones, assault, subsequent encounter', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/4f27e6e2-c7f8-4bdd-9145-3cc4cbf4055b.jpg?v=1645344790000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (32, N'Vans Vault OG Authentic LX Antique White', 78, NULL, 14, N'Laceration of other muscles, fascia and tendons at forearm level, unspecified arm, sequela', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/9d9845b5-f335-4441-b006-b236ed4f029b.jpg?v=1643466052000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (33, N'Vans Vault OG Era LX Black Mulberry', 83, NULL, 11, N'Superficial foreign body of anus, sequela', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/f9ee4587-f56c-466c-8eaf-f471da25aa6a.jpg?v=1640950040000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (34, N'Vans Vault OG Style 36 LX Old Gold', 72, NULL, 6, N'Unspecified speech disturbances', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/cab0be68-2022-4403-bf71-0933c50fed22.jpg?v=1637165199000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (35, N'Vans Vault Authentic Sweet Leaf Green', 60, NULL, 8, N'Pressure ulcer of head', N'https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/5a4d152a-2d83-401b-81e5-8ac372170e37.jpg?v=1625739728000', 5, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (45, N'New Balance Sportswear Basketball ', 63, NULL, 15, N'Multiple endocrine neoplasia [MEN] type IIA', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031589168263991326/5bb9bdfc957fe-abc9f76bfa0bc2757de246557079399a.png', 3, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (51, N'New Balance Air Force Skate', 60, NULL, 10, N'Pneumonia due to Methicillin resistant Staphylococcus aureus', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031589469775745097/sneakers-new-balance-air-force-skate-shoe-red-shoes-967723e354766406b8ae4988367421d1.png', 3, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (53, N'New Balance Kit', 66, NULL, 10, N'Unspecified ectropion of right lower eyelid', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031592156156141588/sneakers-shoe-child-children-s-shoes-5178bec84348f203517a809551e98186.png', 3, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (57, N'Sneakers New Balance Skate', 65, NULL, 12, N'Salter-Harris Type I physeal fracture of unspecified calcaneus, sequela', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031593015766171679/sneakers-new-balance-skate-shoe-adidas-adidas-0723ef3b7b3da14da001639294e44305.png', 3, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (59, N'New Balance Sportswear', 60, NULL, 13, N'Unspecified ectropion of right lower eyelid', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031593217080176752/sneakers-skate-shoe-new-balance-sportswear-hypebeast-fe37bbe37d69c544074d2fcc0046d332.png', 3, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (61, N'Converse Old School High', 69, NULL, 12, N'Osteochondropathy, unspecified, left lower leg', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031590732693262416/chuck-taylor-all-stars-high-top-converse-sneakers-shoe-high-top-b417a854c1030ee05433893a26b7d4e6.png', 4, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (63, N'Chuck Taylor All-Stars Converse ', 60, NULL, 10, N'Abnormal histological findings in specimens from other organs, systems and tissues', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031589815596089464/chuck-taylor-all-stars-converse-high-top-shoe-sneakers-sneaker-418c36f84ab8055f519e217d481e86db.png', 4, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (64, N'Chuck Taylor All-Stars Converse ', 60, NULL, 20, N'Unspecified ectropion of right lower eyelid', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031590084102860840/converse-canvas-high-top-chuck-taylor-all-stars-sneakers-nike-49a3a6ddd255ba4c2b4bc0ce18bcf600.png', 4, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (65, N'Chuck Taylor All-Stars Converse ', 60, NULL, 20, N'Salter-Harris Type I physeal fracture of unspecified calcaneus, sequela', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031590496721698916/chuck-taylor-all-stars-converse-high-top-sneakers-shoe-convers-dee644000089026f49ba3b1e713db259.png', 4, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (67, N'Chuck Taylor All-Stars Converse ', 60, NULL, 20, N'Multiple endocrine neoplasia [MEN] type IIA', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031591200341360700/chuck-taylor-all-stars-converse-sneakers-shoe-high-top-nike-3b79e3c2b299846d446c83a0e9d97e71.png', 4, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[product] ([product_id], [title], [price], [sale_price], [quantity], [description], [img], [category_id], [create_date]) VALUES (68, N'Chuck Taylor All-Stars Converse ', 60, NULL, 20, N'Unspecified ectropion of right lower eyelid', N'https://cdn.discordapp.com/attachments/1031588976655614033/1031591658871070801/chuck-taylor-all-stars-converse-high-top-sneakers-shoe-women-shoes-30ee9bdb2d784ec9b01326d4821b2d21.png', 4, CAST(N'2022-09-30' AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_size] ON 

INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (1, 2, 37, 8)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (2, 2, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (3, 2, 39, -6)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (4, 2, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (5, 2, 41, 0)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (6, 2, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (7, 17, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (8, 17, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (9, 17, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (10, 17, 40, 9)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (11, 17, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (12, 17, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (13, 18, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (14, 18, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (15, 18, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (16, 3, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (17, 3, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (18, 3, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (19, 3, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (20, 3, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (21, 3, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (22, 4, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (23, 4, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (24, 4, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (25, 4, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (26, 4, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (27, 4, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (28, 5, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (29, 5, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (30, 5, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (31, 5, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (32, 5, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (33, 5, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (34, 6, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (35, 6, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (36, 6, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (37, 6, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (38, 6, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (39, 6, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (40, 7, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (41, 7, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (42, 7, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (43, 7, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (44, 7, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (45, 7, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (46, 8, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (47, 8, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (48, 8, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (49, 8, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (50, 8, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (51, 8, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (52, 9, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (53, 9, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (54, 9, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (55, 9, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (56, 9, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (57, 9, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (58, 10, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (59, 10, 31, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (60, 10, 31, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (61, 10, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (62, 10, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (63, 10, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (64, 11, 37, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (65, 11, 31, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (66, 11, 31, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (67, 11, 40, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (68, 11, 41, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (69, 11, 42, 11)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (70, 12, 37, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (71, 12, 31, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (72, 12, 31, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (73, 12, 40, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (74, 12, 41, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (75, 12, 42, 12)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (76, 13, 37, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (77, 13, 31, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (78, 13, 31, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (79, 13, 40, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (80, 13, 41, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (81, 13, 42, 13)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (82, 14, 37, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (83, 14, 31, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (84, 14, 31, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (85, 14, 40, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (86, 14, 41, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (87, 14, 42, 14)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (88, 15, 37, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (89, 15, 31, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (90, 15, 31, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (91, 15, 40, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (92, 15, 41, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (93, 15, 42, 15)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (94, 16, 37, 16)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (95, 16, 31, 16)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (96, 16, 31, 16)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (97, 16, 40, 16)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (98, 16, 41, 16)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (99, 16, 42, 16)
GO
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (100, 18, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (101, 18, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (102, 18, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (103, 19, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (104, 19, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (105, 19, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (106, 19, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (107, 19, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (108, 19, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (109, 20, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (110, 20, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (111, 20, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (112, 20, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (113, 20, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (114, 20, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (115, 21, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (116, 21, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (117, 21, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (118, 21, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (119, 21, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (120, 21, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (121, 22, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (122, 22, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (123, 22, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (124, 22, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (125, 22, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (126, 22, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (127, 23, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (128, 23, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (129, 23, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (130, 23, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (131, 23, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (132, 23, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (133, 24, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (134, 24, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (135, 24, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (136, 24, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (137, 24, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (138, 24, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (139, 25, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (140, 25, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (141, 25, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (142, 25, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (143, 25, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (144, 25, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (145, 28, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (146, 28, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (147, 28, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (148, 28, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (149, 28, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (150, 28, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (151, 29, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (152, 29, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (153, 29, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (154, 29, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (155, 29, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (156, 29, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (157, 30, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (158, 30, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (159, 30, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (160, 30, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (161, 30, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (162, 30, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (163, 31, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (164, 31, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (165, 31, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (166, 31, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (167, 31, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (168, 31, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (169, 32, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (170, 32, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (171, 32, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (172, 32, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (173, 32, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (174, 32, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (175, 33, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (176, 33, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (177, 33, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (178, 33, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (179, 33, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (180, 33, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (181, 34, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (182, 34, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (183, 34, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (184, 34, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (185, 34, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (186, 34, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (187, 35, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (188, 35, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (189, 35, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (190, 35, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (191, 35, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (192, 35, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (193, 45, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (194, 45, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (195, 45, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (196, 45, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (197, 45, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (198, 45, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (199, 51, 37, 10)
GO
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (200, 51, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (201, 51, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (202, 51, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (203, 51, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (204, 51, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (205, 53, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (206, 53, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (207, 53, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (208, 53, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (209, 53, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (210, 53, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (211, 57, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (212, 57, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (213, 57, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (214, 57, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (215, 57, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (216, 57, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (217, 59, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (218, 59, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (219, 59, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (220, 59, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (221, 59, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (222, 59, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (223, 61, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (224, 61, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (225, 61, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (226, 61, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (227, 61, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (228, 61, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (229, 63, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (230, 63, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (231, 63, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (232, 63, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (233, 63, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (234, 63, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (235, 64, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (236, 64, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (237, 64, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (238, 64, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (239, 64, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (240, 64, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (241, 65, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (242, 65, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (243, 65, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (244, 65, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (245, 65, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (246, 65, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (247, 67, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (248, 67, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (249, 67, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (250, 67, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (251, 67, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (252, 67, 42, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (253, 68, 37, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (254, 68, 38, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (255, 68, 39, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (256, 68, 40, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (257, 68, 41, 10)
INSERT [dbo].[product_size] ([size_id], [product_id], [size], [quantity]) VALUES (258, 68, 42, 10)
SET IDENTITY_INSERT [dbo].[product_size] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Staff')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
INSERT [dbo].[voucher_new] ([voucher_code], [voucher_create], [voucher_experience], [voucher_discount]) VALUES (N'SALELANDAU', NULL, NULL, 0.2)
INSERT [dbo].[voucher_new] ([voucher_code], [voucher_create], [voucher_experience], [voucher_discount]) VALUES (N'SALETHANG10', CAST(N'2022-09-30' AS Date), CAST(N'2022-11-30' AS Date), 0.3)
INSERT [dbo].[voucher_new] ([voucher_code], [voucher_create], [voucher_experience], [voucher_discount]) VALUES (N'sieunhancuongphong', CAST(N'2022-11-09' AS Date), CAST(N'2022-12-31' AS Date), 0.4)
INSERT [dbo].[voucher_new] ([voucher_code], [voucher_create], [voucher_experience], [voucher_discount]) VALUES (N'sieunhangao', CAST(N'2022-11-09' AS Date), CAST(N'2022-12-31' AS Date), 0.2)
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_account] FOREIGN KEY([user_id])
REFERENCES [dbo].[account] ([acc_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_account]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product_size] FOREIGN KEY([size])
REFERENCES [dbo].[product_size] ([size_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product_size]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
USE [master]
GO
ALTER DATABASE [data] SET  READ_WRITE 
GO
