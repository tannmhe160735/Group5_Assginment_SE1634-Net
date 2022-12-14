USE [swp]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 10/16/2022 1:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[number_of_star] [int] NOT NULL,
	[feedback_content] [nvarchar](1000) NULL,
	[feedback_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (1, 2, 2, 5, N'Ổn áp lắm nha mng', CAST(N'2022-10-14' AS Date))
INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (2, 2, 3, 5, N'Chất lượng sản phẩm tốt.', CAST(N'2022-10-14' AS Date))
INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (3, 2, 12, 3, N'Hàng hơi bị lỗi, bị đứt chỉ, tôi phải khâu lại', CAST(N'2022-10-15' AS Date))
INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (4, 4, 13, 1, N'Sản phẩm quá tệ, đi được 1 tuần mà bị rách rồi', CAST(N'2022-10-13' AS Date))
INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (5, 4, 2, 2, N'Shop đóng hàng gửi hàng chậm, 1 tháng mới tới nơi', CAST(N'2022-10-09' AS Date))
INSERT [dbo].[feedback] ([feedback_id], [product_id], [user_id], [number_of_star], [feedback_content], [feedback_date]) VALUES (6, 5, 11, 4, N'Hàng Việt Nam chất lượng tốt quá', CAST(N'2022-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[account] ([acc_id])
GO
