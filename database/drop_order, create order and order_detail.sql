USE [data]
GO


DROP TABLE [dbo].[order]
GO

/****** Object:  Table [dbo].[order]    Script Date: 10/29/2022 11:53:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order](
	[order_id] [int] NOT NULL,
	[address] [nchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nchar](50) NULL,
	[user_id] [nchar](10) NULL,
	[payment] [nchar](50) NULL,
	[status] [int] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order_detail] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO

ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_detail_order_detail]
GO

/****** Object:  Table [dbo].[order_detail]    Script Date: 10/29/2022 11:54:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order_detail](
	[order_id] [nchar](50) NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO





