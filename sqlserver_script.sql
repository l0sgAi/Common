USE [DB2]
GO
/****** Object:  Table [dbo].[Apply]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apply](
	[ano] [int] IDENTITY(1,1) NOT NULL,
	[asno] [varchar](20) NULL,
	[atno] [varchar](20) NULL,
	[arno] [int] NOT NULL,
	[arname] [varchar](20) NOT NULL,
	[astate] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classroom](
	[rno] [int] NOT NULL,
	[rname] [varchar](20) NOT NULL,
	[rstate] [varchar](10) NOT NULL,
	[lsno] [varchar](20) NULL,
	[ltno] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[rno] ASC,
	[rname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[cno] [varchar](20) NOT NULL,
	[cname] [varchar](10) NOT NULL,
	[ctime] [varchar](50) NOT NULL,
	[clocation] [varchar](20) NOT NULL,
	[tno] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[sno] [varchar](20) NOT NULL,
	[cno] [varchar](20) NOT NULL,
	[score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC,
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sno] [varchar](20) NOT NULL,
	[sname] [varchar](10) NOT NULL,
	[sclass] [varchar](20) NOT NULL,
	[sage] [int] NOT NULL,
	[ssex] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2024/7/17 21:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[tno] [varchar](20) NOT NULL,
	[tname] [varchar](10) NOT NULL,
	[tpost] [varchar](20) NOT NULL,
	[tage] [int] NOT NULL,
	[tsex] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD FOREIGN KEY([arno], [arname])
REFERENCES [dbo].[Classroom] ([rno], [rname])
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD FOREIGN KEY([asno])
REFERENCES [dbo].[Student] ([sno])
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD FOREIGN KEY([atno])
REFERENCES [dbo].[Teacher] ([tno])
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD FOREIGN KEY([lsno])
REFERENCES [dbo].[Student] ([sno])
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD FOREIGN KEY([ltno])
REFERENCES [dbo].[Teacher] ([tno])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([tno])
REFERENCES [dbo].[Teacher] ([tno])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([cno])
REFERENCES [dbo].[Course] ([cno])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([sno])
REFERENCES [dbo].[Student] ([sno])
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD CHECK  (([astate]='申请失败' OR [astate]='申请通过' OR [astate]='待处理'))
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD CHECK  ((([rstate]='已预约' OR [rstate]='未预约') AND [rno]>(100)))
GO
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD CHECK  (([rname]='讲堂群' OR [rname]='三山楼' OR [rname]='三江楼'))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([sage]>(0) AND [sage]<(200)))
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD CHECK  (([tpost]='特聘专家' OR [tpost]='讲师' OR [tpost]='副教授' OR [tpost]='教授'))
GO
