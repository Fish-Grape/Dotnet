
/****** Object:  Default [dbo].[sqlguid]    Script Date: 2018-04-14 15:19:55 ******/
CREATE DEFAULT [dbo].[sqlguid] 
AS
newid()
GO
/****** Object:  UserDefinedDataType [dbo].[PrimaryKey]    Script Date: 2018-04-14 15:19:55 ******/
CREATE TYPE [dbo].[PrimaryKey] FROM [varchar](50) NULL
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[AppSecret] [varchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Icon] [varchar](255) NULL,
	[Disable] [bit] NOT NULL,
	[CreateTime] [date] NOT NULL,
	[CreateUser] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_APPLICATION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[SortNo] [int] NOT NULL,
	[Icon] [varchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryType]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryType](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FlowInstance]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlowInstance](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[InstanceSchemeId] [dbo].[PrimaryKey] NOT NULL,
	[Code] [varchar](200) NULL,
	[CustomName] [varchar](200) NULL,
	[ActivityId] [dbo].[PrimaryKey] NULL,
	[ActivityType] [int] NULL,
	[ActivityName] [varchar](200) NULL,
	[PreviousId] [dbo].[PrimaryKey] NULL,
	[SchemeContent] [varchar](max) NULL,
	[SchemeId] [dbo].[PrimaryKey] NULL,
	[DbName] [varchar](50) NULL,
	[FrmData] [text] NULL,
	[FrmType] [int] NOT NULL,
	[FrmContentData] [text] NULL,
	[FrmContentParse] [text] NULL,
	[FrmId] [dbo].[PrimaryKey] NULL,
	[SchemeType] [varchar](50) NULL,
	[Disabled] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [dbo].[PrimaryKey] NULL,
	[CreateUserName] [varchar](50) NULL,
	[FlowLevel] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[IsFinish] [int] NOT NULL,
	[MakerList] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FlowInstanceOperationHistory]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlowInstanceOperationHistory](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[InstanceId] [dbo].[PrimaryKey] NOT NULL,
	[Content] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [dbo].[PrimaryKey] NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FlowInstanceTransitionHistory]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlowInstanceTransitionHistory](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[InstanceId] [dbo].[PrimaryKey] NOT NULL,
	[FromNodeId] [dbo].[PrimaryKey] NULL,
	[FromNodeType] [int] NULL,
	[FromNodeName] [varchar](200) NULL,
	[ToNodeId] [dbo].[PrimaryKey] NULL,
	[ToNodeType] [int] NULL,
	[ToNodeName] [varchar](200) NULL,
	[TransitionSate] [int] NOT NULL,
	[IsFinish] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [dbo].[PrimaryKey] NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FlowScheme]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlowScheme](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[SchemeCode] [varchar](50) NULL,
	[SchemeName] [varchar](200) NULL,
	[SchemeType] [varchar](50) NULL,
	[SchemeVersion] [varchar](50) NULL,
	[SchemeCanUser] [varchar](max) NULL,
	[SchemeContent] [varchar](max) NULL,
	[FrmId] [dbo].[PrimaryKey] NULL,
	[FrmType] [int] NOT NULL,
	[AuthorizeType] [int] NOT NULL,
	[SortCode] [int] NOT NULL,
	[DeleteMark] [int] NOT NULL,
	[Disabled] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [dbo].[PrimaryKey] NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [dbo].[PrimaryKey] NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Form]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Form](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [varchar](200) NULL,
	[Fields] [int] NOT NULL,
	[ContentData] [text] NULL,
	[ContentParse] [text] NULL,
	[Content] [text] NULL,
	[SortCode] [int] NOT NULL,
	[Delete] [int] NOT NULL,
	[DbName] [varchar](50) NULL,
	[Enabled] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Module]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[Vector] [varchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [dbo].[PrimaryKey] NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_MODULE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModuleElement]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuleElement](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[DomId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Attr] [varchar](500) NOT NULL,
	[Script] [varchar](500) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[Class] [varchar](255) NOT NULL,
	[Remark] [varchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[ModuleId] [dbo].[PrimaryKey] NOT NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_MODULEELEMENT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Org]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CustomCode] [varchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [dbo].[PrimaryKey] NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_ORG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relevance]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relevance](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[OperateTime] [datetime] NOT NULL,
	[OperatorId] [dbo].[PrimaryKey] NULL,
	[FirstId] [dbo].[PrimaryKey] NOT NULL,
	[SecondId] [dbo].[PrimaryKey] NOT NULL,
 CONSTRAINT [PK_RELEVANCE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ParentName] [nvarchar](50) NULL,
	[ParentId] [dbo].[PrimaryKey] NULL,
	[AppId] [dbo].[PrimaryKey] NULL,
	[AppName] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL,
	[Disable] [bit] NOT NULL,
 CONSTRAINT [PK_RESOURCE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [dbo].[PrimaryKey] NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Number] [int] NOT NULL,
	[Price] [decimal](10, 1) NOT NULL,
	[Status] [int] NOT NULL,
	[Viewable] [varchar](50) NOT NULL,
	[User] [varchar](50) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OrgId] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_STOCK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [varchar](50) NOT NULL,
	[data_1] [varchar](255) NULL,
	[data_2] [varchar](255) NULL,
	[data_3] [varchar](255) NULL,
	[checkboxs_0] [int] NOT NULL,
	[data_7] [varchar](255) NULL,
	[data_8] [varchar](255) NULL,
	[data_9] [text] NULL,
	[data_10] [text] NULL,
	[data_11] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018-04-14 15:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [dbo].[PrimaryKey] NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CrateId] [dbo].[PrimaryKey] NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [dbo].[PrimaryKey] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Application] ([Id], [Name], [AppSecret], [Description], [Icon], [Disable], [CreateTime], [CreateUser]) VALUES (N'110', N'OpenAuth.Net', N'openauthdotnetyubaolee', N'最好用的.NET权限工作流框架', NULL, 0, CAST(0x1D3E0B00 AS Date), NULL)
GO
INSERT [dbo].[Application] ([Id], [Name], [AppSecret], [Description], [Icon], [Disable], [CreateTime], [CreateUser]) VALUES (N'119', N'XXX管理平台', N'manageryubaolee', N'这是一个第三的平台', NULL, 0, CAST(0x1D3E0B00 AS Date), NULL)
GO
INSERT [dbo].[Category] ([Id], [Name], [Disabled], [SortNo], [Icon], [Description], [TypeId]) VALUES (N'ADMINISTRATOR', N'管理员', 0, 0, N'', NULL, N'USERTYPE')
GO
INSERT [dbo].[Category] ([Id], [Name], [Disabled], [SortNo], [Icon], [Description], [TypeId]) VALUES (N'USER', N'普通用户', 0, 0, N'', NULL, N'USERTYPE')
GO
INSERT [dbo].[Category] ([Id], [Name], [Disabled], [SortNo], [Icon], [Description], [TypeId]) VALUES (N'SYSTEMADMIN', N'神', 0, 0, N'', NULL, N'USERTYPE')
GO
INSERT [dbo].[CategoryType] ([Id], [Name], [CreateTime]) VALUES (N'USERTYPE', N'按用户类型分类', CAST(0x0000A83A0161ADA6 AS DateTime))
GO
INSERT [dbo].[FlowInstance] ([Id], [InstanceSchemeId], [Code], [CustomName], [ActivityId], [ActivityType], [ActivityName], [PreviousId], [SchemeContent], [SchemeId], [DbName], [FrmData], [FrmType], [FrmContentData], [FrmContentParse], [FrmId], [SchemeType], [Disabled], [CreateDate], [CreateUserId], [CreateUserName], [FlowLevel], [Description], [IsFinish], [MakerList]) VALUES (N'd73e4412-9c49-4511-a30e-0d2f844afcee', N'', N'1523002870978', N'我请个假', N'1523002637238', 2, N'admin审核', N'1523002636766', N'{"title":"newFlow_1","nodes":[{"name":"node_1","left":101,"top":105,"type":"start round mix","id":"1523002631942","width":26,"height":26,"alt":true},{"name":"所有人都可以审","left":218,"top":122,"type":"node","id":"1523002636766","width":104,"height":50,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"role":[],"org":[]},"NodeName":"所有人都可以审","NodeCode":"node_2","NodeRejectType":"0","NodeDesignate":"ALL_USER","Taged":1,"UserId":"00000000-0000-0000-0000-000000000000","UserName":"超级管理员","Description":"自己处理一下","TagedTime":"2018-04-06 16:22"}},{"name":"admin审核","left":215,"top":190,"type":"node","id":"1523002637238","width":104,"height":49,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558"],"role":[],"org":[]},"NodeName":"admin审核","NodeCode":"node_3","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"node_4","left":260,"top":287,"type":"end round","id":"1523002639310","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"1523002631942","to":"1523002636766","id":"1523002641196","name":"","dash":false},{"type":"sl","from":"1523002636766","to":"1523002637238","id":"1523002642292","name":"","dash":false},{"type":"sl","from":"1523002637238","to":"1523002639310","id":"1523002643868","name":"","dash":false}],"areas":[],"initNum":9}', N'', N'', N'{"data_1":"玉宝","data_2":"3","data_3":""}', 0, N'[{"name":"data_1","title":"Name","value":"玉宝","leipiplugins":"text","orghide":"0","style":"text-align: left; width: 150px;","orgalign":"left","orgwidth":"150","orgtype":"text","type":"text","content":"<input name=\"data_1\" title=\"Name\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" style=\"text-align: left; width: 150px;\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" type=\"text\"/>"},{"leipiplugins":"select","name":"data_2","title":"Days","size":"1","style":"width: 150px;","orgwidth":"150","value":"1,3,5,7","selected":"selected","content":"<span leipiplugins=\"select\"><select name=\"data_2\" title=\"Days\" leipiplugins=\"select\" size=\"1\" style=\"width: 150px;\" orgwidth=\"150\"><option value=\"1\">1</option><option value=\"3\" selected=\"selected\">3</option><option value=\"5\">5</option><option value=\"7\">7</option></select>&nbsp;&nbsp;</span>"},{"title":"Comment","name":"data_3","leipiplugins":"textarea","value":"","orgrich":"1","orgfontsize":"","orgwidth":"300","orgheight":"80","style":"width: 316px; height: 139px;","content":"<textarea title=\"Comment\" name=\"data_3\" leipiplugins=\"textarea\" value=\"\" orgrich=\"1\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width: 316px; height: 139px;\"></textarea>"}]', N'<p><br/></p><p style="text-align: center;">姓名：{data_1}</p><p style="text-align: center;">天数：{data_2}</p><p style="text-align: center;">备注：{data_3}</p>', N'a4cffd58-7bac-498a-a327-58a644dfdd93', N'', 0, CAST(0x0000A8BA010D9AAC AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', 0, N'', 0, N'49df1602-f5f3-4d52-afb7-3802da619558')
GO
INSERT [dbo].[FlowInstance] ([Id], [InstanceSchemeId], [Code], [CustomName], [ActivityId], [ActivityType], [ActivityName], [PreviousId], [SchemeContent], [SchemeId], [DbName], [FrmData], [FrmType], [FrmContentData], [FrmContentParse], [FrmId], [SchemeType], [Disabled], [CreateDate], [CreateUserId], [CreateUserName], [FlowLevel], [Description], [IsFinish], [MakerList]) VALUES (N'd8fa445f-edd9-4604-8d9e-b17ba921f9dd', N'', N'1523688313680', N'天气好，请个假', N'1523688050220', 0, N'会签开始（要包括所有会签节点的审核人）', N'1523688045356', N'{"title":"newFlow_1","nodes":[{"name":"node_1","left":88,"top":84,"type":"start round mix","id":"1523688043300","width":26,"height":26,"alt":true},{"name":"任何人可以审核","left":201,"top":79,"type":"node","id":"1523688045356","width":148,"height":52,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"任何人可以审核","NodeCode":"node_2","NodeRejectType":"0","NodeDesignate":"ALL_USER","Taged":1,"UserId":"00000000-0000-0000-0000-000000000000","UserName":"超级管理员","Description":"自己当然要通过啊","TagedTime":"2018-04-14 14:46"}},{"name":"会签开始（要包括所有会签节点的审核人）","left":198,"top":165,"type":"fork","id":"1523688050220","width":162,"height":81,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558","6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"会签开始（要包括所有会签节点的审核人）","NodeCode":"node_3","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"admin审核","left":119,"top":283,"type":"node","id":"1523688053956","width":104,"height":39,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558"],"roles":[],"orgs":[]},"NodeName":"admin审核","NodeCode":"node_4","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"test审核","left":337,"top":286,"type":"node","id":"1523688054452","width":104,"height":38,"alt":true,"setInfo":{"NodeDesignateData":{"users":["6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"test审核","NodeCode":"node_5","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"会签结束","left":221,"top":362,"type":"join","id":"1523688063308","width":104,"height":46,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"会签结束","NodeCode":"node_7","NodeRejectType":"0","NodeDesignate":"ALL_USER"}},{"name":"node_8","left":261,"top":443,"type":"end round","id":"1523688066308","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"1523688043300","to":"1523688045356","id":"1523688073290","name":"","dash":false},{"type":"sl","from":"1523688045356","to":"1523688050220","id":"1523688074210","name":"","dash":false},{"type":"sl","from":"1523688050220","to":"1523688053956","id":"1523688075338","name":"","dash":false},{"type":"sl","from":"1523688050220","to":"1523688054452","id":"1523688079394","name":"","dash":false},{"type":"sl","from":"1523688053956","to":"1523688063308","id":"1523688080746","name":"","dash":false},{"type":"sl","from":"1523688054452","to":"1523688063308","id":"1523688082204","name":"","dash":false},{"type":"sl","from":"1523688063308","to":"1523688066308","id":"1523688084522","name":"","dash":false}],"areas":[],"initNum":16}', N'', N'', N'{"data_1":"玉宝","data_2":"3","data_3":"想去洗个车啊，老板"}', 0, N'[{"name":"data_1","title":"Name","value":"玉宝","leipiplugins":"text","orghide":"0","style":"text-align: left; width: 150px;","orgalign":"left","orgwidth":"150","orgtype":"text","type":"text","content":"<input name=\"data_1\" title=\"Name\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" style=\"text-align: left; width: 150px;\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" type=\"text\"/>"},{"leipiplugins":"select","name":"data_2","title":"Days","size":"1","style":"width: 150px;","orgwidth":"150","value":"1,3,5,7","selected":"selected","content":"<span leipiplugins=\"select\"><select name=\"data_2\" title=\"Days\" leipiplugins=\"select\" size=\"1\" style=\"width: 150px;\" orgwidth=\"150\"><option value=\"1\">1</option><option value=\"3\" selected=\"selected\">3</option><option value=\"5\">5</option><option value=\"7\">7</option></select>&nbsp;&nbsp;</span>"},{"title":"Comment","name":"data_3","leipiplugins":"textarea","value":"","orgrich":"1","orgfontsize":"","orgwidth":"300","orgheight":"80","style":"width: 316px; height: 139px;","content":"<textarea title=\"Comment\" name=\"data_3\" leipiplugins=\"textarea\" value=\"\" orgrich=\"1\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width: 316px; height: 139px;\"></textarea>"}]', N'<p><br/></p><p style="text-align: center;">姓名：{data_1}</p><p style="text-align: center;">天数：{data_2}</p><p style="text-align: center;">备注：{data_3}</p>', N'a4cffd58-7bac-498a-a327-58a644dfdd93', N'', 0, CAST(0x0000A8C200F35A9F AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', 0, N'', 0, N'49df1602-f5f3-4d52-afb7-3802da619558,6ba79766-faa0-4259-8139-a4a6d35784e0')
GO
INSERT [dbo].[FlowInstance] ([Id], [InstanceSchemeId], [Code], [CustomName], [ActivityId], [ActivityType], [ActivityName], [PreviousId], [SchemeContent], [SchemeId], [DbName], [FrmData], [FrmType], [FrmContentData], [FrmContentParse], [FrmId], [SchemeType], [Disabled], [CreateDate], [CreateUserId], [CreateUserName], [FlowLevel], [Description], [IsFinish], [MakerList]) VALUES (N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'', N'1523107997554', N'111111111111', N'1523002726014', 4, N'node_5', N'1523002732796', N'{"title":"newFlow_1","nodes":[{"name":"node_1","left":176,"top":46,"type":"start round mix","id":"1523002714678","width":26,"height":26,"alt":true},{"name":"所有人可审下","left":146,"top":118,"type":"node","id":"1523002717150","width":104,"height":26,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"role":[],"org":[]},"NodeName":"所有人可审下","NodeCode":"node_2","NodeRejectType":"0","NodeDesignate":"ALL_USER","Taged":1,"UserId":"00000000-0000-0000-0000-000000000000","UserName":"超级管理员","Description":"ok","TagedTime":"2018-04-07 21:50"}},{"name":"admin审核","left":35,"top":240,"type":"node","id":"1523002718686","width":104,"height":48,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558"],"role":[],"org":[]},"NodeName":"admin审核","NodeCode":"node_3","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER","Taged":1,"UserId":"49df1602-f5f3-4d52-afb7-3802da619558","UserName":"admin","Description":"签一个","TagedTime":"2018-04-07 21:51"}},{"name":"test审核","left":253,"top":240,"type":"node","id":"1523002719796","width":104,"height":49,"alt":true,"setInfo":{"NodeDesignateData":{"users":["6ba79766-faa0-4259-8139-a4a6d35784e0"],"role":[],"org":[]},"NodeName":"test审核","NodeCode":"node_4","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER","Taged":1,"UserId":"6ba79766-faa0-4259-8139-a4a6d35784e0","UserName":"test","Description":"1111","TagedTime":"2018-04-07 21:52"}},{"name":"node_5","left":184,"top":390,"type":"end round","id":"1523002726014","width":26,"height":26,"alt":true},{"name":"开始会签","left":145,"top":172,"type":"fork","id":"1523002732796","width":104,"height":41,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"role":[],"org":[]},"NodeName":"开始会签","NodeCode":"node_6","NodeRejectType":"0","NodeDesignate":"ALL_USER","Taged":1,"UserId":"6ba79766-faa0-4259-8139-a4a6d35784e0","UserName":"test","Description":"1111","TagedTime":"2018-04-07 21:52"}},{"name":"会签结束","left":149,"top":322,"type":"join","id":"1523002734916","width":104,"height":41,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"role":[],"org":[]},"NodeName":"会签结束","NodeCode":"node_7","NodeRejectType":"0","NodeDesignate":"ALL_USER","ConfluenceOk":1,"Taged":1,"UserId":"6ba79766-faa0-4259-8139-a4a6d35784e0","UserName":"test","Description":"1111","TagedTime":"2018-04-07 21:52"}}],"lines":[{"type":"sl","from":"1523002714678","to":"1523002717150","id":"1523002737452","name":"","dash":false},{"type":"sl","from":"1523002717150","to":"1523002732796","id":"1523002738230","name":"","dash":false},{"type":"sl","from":"1523002732796","to":"1523002718686","id":"1523002742548","name":"","dash":false},{"type":"sl","from":"1523002732796","to":"1523002719796","id":"1523002743652","name":"","dash":false},{"type":"sl","from":"1523002718686","to":"1523002734916","id":"1523002745196","name":"","dash":false},{"type":"sl","from":"1523002719796","to":"1523002734916","id":"1523002746460","name":"","dash":false},{"type":"sl","from":"1523002734916","to":"1523002726014","id":"1523002748412","name":"","dash":false}],"areas":[],"initNum":15}', N'', N'', N'{"data_1":"玉宝","data_2":"3","data_3":""}', 0, N'[{"name":"data_1","title":"Name","value":"玉宝","leipiplugins":"text","orghide":"0","style":"text-align: left; width: 150px;","orgalign":"left","orgwidth":"150","orgtype":"text","type":"text","content":"<input name=\"data_1\" title=\"Name\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" style=\"text-align: left; width: 150px;\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" type=\"text\"/>"},{"leipiplugins":"select","name":"data_2","title":"Days","size":"1","style":"width: 150px;","orgwidth":"150","value":"1,3,5,7","selected":"selected","content":"<span leipiplugins=\"select\"><select name=\"data_2\" title=\"Days\" leipiplugins=\"select\" size=\"1\" style=\"width: 150px;\" orgwidth=\"150\"><option value=\"1\">1</option><option value=\"3\" selected=\"selected\">3</option><option value=\"5\">5</option><option value=\"7\">7</option></select>&nbsp;&nbsp;</span>"},{"title":"Comment","name":"data_3","leipiplugins":"textarea","value":"","orgrich":"1","orgfontsize":"","orgwidth":"300","orgheight":"80","style":"width: 316px; height: 139px;","content":"<textarea title=\"Comment\" name=\"data_3\" leipiplugins=\"textarea\" value=\"\" orgrich=\"1\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width: 316px; height: 139px;\"></textarea>"}]', N'<p><br/></p><p style="text-align: center;">姓名：{data_1}</p><p style="text-align: center;">天数：{data_2}</p><p style="text-align: center;">备注：{data_3}</p>', N'a4cffd58-7bac-498a-a327-58a644dfdd93', N'', 0, CAST(0x0000A8BB01633F3E AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', 0, N'', 1, N'')
GO
INSERT [dbo].[FlowInstance] ([Id], [InstanceSchemeId], [Code], [CustomName], [ActivityId], [ActivityType], [ActivityName], [PreviousId], [SchemeContent], [SchemeId], [DbName], [FrmData], [FrmType], [FrmContentData], [FrmContentParse], [FrmId], [SchemeType], [Disabled], [CreateDate], [CreateUserId], [CreateUserName], [FlowLevel], [Description], [IsFinish], [MakerList]) VALUES (N'e6566327-1a0e-4378-8f63-91acfa4722d2', N'', N'1523688457002', N'不想上班请个假', N'1523688045356', 2, N'任何人可以审核', N'1523688043300', N'{"title":"newFlow_1","nodes":[{"name":"node_1","left":88,"top":84,"type":"start round mix","id":"1523688043300","width":26,"height":26,"alt":true},{"name":"任何人可以审核","left":201,"top":79,"type":"node","id":"1523688045356","width":148,"height":52,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"任何人可以审核","NodeCode":"node_2","NodeRejectType":"0","NodeDesignate":"ALL_USER"}},{"name":"会签开始（要包括所有会签节点的审核人）","left":198,"top":165,"type":"fork","id":"1523688050220","width":162,"height":81,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558","6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"会签开始（要包括所有会签节点的审核人）","NodeCode":"node_3","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"admin审核","left":119,"top":283,"type":"node","id":"1523688053956","width":104,"height":39,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558"],"roles":[],"orgs":[]},"NodeName":"admin审核","NodeCode":"node_4","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"test审核","left":337,"top":286,"type":"node","id":"1523688054452","width":104,"height":38,"alt":true,"setInfo":{"NodeDesignateData":{"users":["6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"test审核","NodeCode":"node_5","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"会签结束","left":221,"top":362,"type":"join","id":"1523688063308","width":104,"height":46,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"会签结束","NodeCode":"node_7","NodeRejectType":"0","NodeDesignate":"ALL_USER"}},{"name":"node_8","left":261,"top":443,"type":"end round","id":"1523688066308","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"1523688043300","to":"1523688045356","id":"1523688073290","name":"","dash":false},{"type":"sl","from":"1523688045356","to":"1523688050220","id":"1523688074210","name":"","dash":false},{"type":"sl","from":"1523688050220","to":"1523688053956","id":"1523688075338","name":"","dash":false},{"type":"sl","from":"1523688050220","to":"1523688054452","id":"1523688079394","name":"","dash":false},{"type":"sl","from":"1523688053956","to":"1523688063308","id":"1523688080746","name":"","dash":false},{"type":"sl","from":"1523688054452","to":"1523688063308","id":"1523688082204","name":"","dash":false},{"type":"sl","from":"1523688063308","to":"1523688066308","id":"1523688084522","name":"","dash":false}],"areas":[],"initNum":16}', N'', N'', N'{"data_1":"玉宝","data_2":"3","data_3":""}', 0, N'[{"name":"data_1","title":"Name","value":"玉宝","leipiplugins":"text","orghide":"0","style":"text-align: left; width: 150px;","orgalign":"left","orgwidth":"150","orgtype":"text","type":"text","content":"<input name=\"data_1\" title=\"Name\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" style=\"text-align: left; width: 150px;\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" type=\"text\"/>"},{"leipiplugins":"select","name":"data_2","title":"Days","size":"1","style":"width: 150px;","orgwidth":"150","value":"1,3,5,7","selected":"selected","content":"<span leipiplugins=\"select\"><select name=\"data_2\" title=\"Days\" leipiplugins=\"select\" size=\"1\" style=\"width: 150px;\" orgwidth=\"150\"><option value=\"1\">1</option><option value=\"3\" selected=\"selected\">3</option><option value=\"5\">5</option><option value=\"7\">7</option></select>&nbsp;&nbsp;</span>"},{"title":"Comment","name":"data_3","leipiplugins":"textarea","value":"","orgrich":"1","orgfontsize":"","orgwidth":"300","orgheight":"80","style":"width: 316px; height: 139px;","content":"<textarea title=\"Comment\" name=\"data_3\" leipiplugins=\"textarea\" value=\"\" orgrich=\"1\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width: 316px; height: 139px;\"></textarea>"}]', N'<p><br/></p><p style="text-align: center;">姓名：{data_1}</p><p style="text-align: center;">天数：{data_2}</p><p style="text-align: center;">备注：{data_3}</p>', N'a4cffd58-7bac-498a-a327-58a644dfdd93', N'', 0, CAST(0x0000A8C200F3D79C AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', 0, N'', 0, N'1')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f7e387b5-caa0-4cc1-ab0e-b5f81cd030d8', N'd73e4412-9c49-4511-a30e-0d2f844afcee', N'【创建】超级管理员创建了一个流程进程【1523002870978/我请个假】', CAST(0x0000A8BA010D9ABA AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'6482670e-522e-418a-932b-b286395db758', N'd73e4412-9c49-4511-a30e-0d2f844afcee', N'【所有人都可以审】【2018-04-06 16:22】同意,备注：自己处理一下', CAST(0x0000A8BA010DD4D1 AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'97608015-8131-465b-b391-957ebd46ed62', N'35f9d541-ef0f-4b9b-9ffd-dfe933d47d1f', N'【创建】超级管理员创建了一个流程进程【1523002969474/再借个书】', CAST(0x0000A8BA010E22D6 AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'91404754-2d13-40f8-b2c8-dec8692bda92', N'35f9d541-ef0f-4b9b-9ffd-dfe933d47d1f', N'【所有人可审下】【2018-04-07 19:34】同意,备注：', CAST(0x0000A8BB0142A29D AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'ae8ab8e9-1efe-46d5-8362-152f4c9de091', N'35f9d541-ef0f-4b9b-9ffd-dfe933d47d1f', N'【admin审核】【2018-04-07 19:40】同意,备注：admin', CAST(0x0000A8BB01433065 AS DateTime), N'49df1602-f5f3-4d52-afb7-3802da619558', N'admin')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'aba0e717-69b8-4f37-9dde-1043a344dd0a', N'35f9d541-ef0f-4b9b-9ffd-dfe933d47d1f', N'【test审核】【2018-04-07 19:59】同意,备注：', CAST(0x0000A8BB014675D8 AS DateTime), N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'test')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e08346e5-af15-4638-976b-9fe1081527d2', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'【创建】超级管理员创建了一个流程进程【1523107997554/111111111111】', CAST(0x0000A8BB016343E8 AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1419387b-22f0-4b67-bd51-5acdfb50a36c', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'【所有人可审下】【2018-04-07 21:50】同意,备注：ok', CAST(0x0000A8BB0167EFAE AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b1a893fd-d282-4b22-914d-9f148b627d0d', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'【admin审核】【2018-04-07 21:51】同意,备注：签一个', CAST(0x0000A8BB01683283 AS DateTime), N'49df1602-f5f3-4d52-afb7-3802da619558', N'admin')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fa53a997-ef42-47da-8fd5-806a1a939471', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'【test审核】【2018-04-07 21:52】同意,备注：1111', CAST(0x0000A8BB01687A75 AS DateTime), N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'test')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3024727a-a422-4b68-b525-7e5f8723ab76', N'd8fa445f-edd9-4604-8d9e-b17ba921f9dd', N'【创建】超级管理员创建了一个流程进程【1523688313680/天气好，请个假】', CAST(0x0000A8C200F35AAF AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c05075e4-cd9c-4267-b960-1929019ed031', N'd8fa445f-edd9-4604-8d9e-b17ba921f9dd', N'【任何人可以审核】【2018-04-14 14:46】同意,备注：自己当然要通过啊', CAST(0x0000A8C200F381D1 AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceOperationHistory] ([Id], [InstanceId], [Content], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd3d8eb25-8d96-4fbd-b475-5dcc1569848b', N'e6566327-1a0e-4378-8f63-91acfa4722d2', N'【创建】超级管理员创建了一个流程进程【1523688457002/不想上班请个假】', CAST(0x0000A8C200F3D79F AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e756f09d-a7de-45e5-a865-9ce25617b4e0', N'd73e4412-9c49-4511-a30e-0d2f844afcee', N'1523002631942', 3, N'node_1', N'1523002636766', 2, N'所有人都可以审', 0, 0, CAST(0x0000A8BA010D9ABB AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'80754624-337e-45d9-9eb5-447439fe7785', N'd73e4412-9c49-4511-a30e-0d2f844afcee', N'1523002636766', 2, N'所有人都可以审', N'1523002637238', 2, N'admin审核', 0, 0, CAST(0x0000A8BA010DD4E4 AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'176ed6db-c9f8-4cae-8c5a-244b407d0c51', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'1523002714678', 3, N'node_1', N'1523002717150', 2, N'所有人可审下', 0, 0, CAST(0x0000A8BB016343EC AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'736ef169-c9de-467a-80a8-9d1367459a1f', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'1523002717150', 2, N'所有人可审下', N'1523002732796', 0, N'开始会签', 0, 0, CAST(0x0000A8BB0167F2DE AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f29bd77f-9d63-4f2b-ada7-6ca57bc1d422', N'3e42b844-d5d1-4fda-a27c-942755a3bd54', N'1523002732796', 0, N'开始会签', N'1523002726014', 4, N'node_5', 0, 1, CAST(0x0000A8BB01687A77 AS DateTime), N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'test')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd56d4393-3d77-4e15-bf74-1212087c0fc2', N'd8fa445f-edd9-4604-8d9e-b17ba921f9dd', N'1523688043300', 3, N'node_1', N'1523688045356', 2, N'任何人可以审核', 0, 0, CAST(0x0000A8C200F35AAF AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'dbe4963d-c102-4fd1-9a43-2a7b489cda37', N'd8fa445f-edd9-4604-8d9e-b17ba921f9dd', N'1523688045356', 2, N'任何人可以审核', N'1523688050220', 0, N'会签开始（要包括所有会签节点的审核人）', 0, 0, CAST(0x0000A8C200F381DC AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowInstanceTransitionHistory] ([Id], [InstanceId], [FromNodeId], [FromNodeType], [FromNodeName], [ToNodeId], [ToNodeType], [ToNodeName], [TransitionSate], [IsFinish], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'5c4cb1f3-9b09-4ac6-8e15-35c4adc8af9b', N'e6566327-1a0e-4378-8f63-91acfa4722d2', N'1523688043300', 3, N'node_1', N'1523688045356', 2, N'任何人可以审核', 0, 0, CAST(0x0000A8C200F3D79F AS DateTime), N'00000000-0000-0000-0000-000000000000', N'超级管理员')
GO
INSERT [dbo].[FlowScheme] ([Id], [SchemeCode], [SchemeName], [SchemeType], [SchemeVersion], [SchemeCanUser], [SchemeContent], [FrmId], [FrmType], [AuthorizeType], [SortCode], [DeleteMark], [Disabled], [Description], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'cd93ef0c-9e09-461b-8599-719de8f2cf74', N'1523688022354', N'信息中心请假', N'', N'', N'', N'{"title":"newFlow_1","nodes":[{"name":"node_1","left":88,"top":84,"type":"start round mix","id":"1523688043300","width":26,"height":26,"alt":true},{"name":"任何人可以审核","left":201,"top":79,"type":"node","id":"1523688045356","width":148,"height":52,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"任何人可以审核","NodeCode":"node_2","NodeRejectType":"0","NodeDesignate":"ALL_USER"}},{"name":"会签开始（要包括所有会签节点的审核人）","left":198,"top":165,"type":"fork","id":"1523688050220","width":162,"height":81,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558","6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"会签开始（要包括所有会签节点的审核人）","NodeCode":"node_3","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"admin审核","left":119,"top":283,"type":"node","id":"1523688053956","width":104,"height":39,"alt":true,"setInfo":{"NodeDesignateData":{"users":["49df1602-f5f3-4d52-afb7-3802da619558"],"roles":[],"orgs":[]},"NodeName":"admin审核","NodeCode":"node_4","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"test审核","left":337,"top":286,"type":"node","id":"1523688054452","width":104,"height":38,"alt":true,"setInfo":{"NodeDesignateData":{"users":["6ba79766-faa0-4259-8139-a4a6d35784e0"],"roles":[],"orgs":[]},"NodeName":"test审核","NodeCode":"node_5","NodeRejectType":"0","NodeDesignate":"SPECIAL_USER"}},{"name":"会签结束","left":221,"top":362,"type":"join","id":"1523688063308","width":104,"height":46,"alt":true,"setInfo":{"NodeDesignateData":{"users":[],"roles":[],"orgs":[]},"NodeName":"会签结束","NodeCode":"node_7","NodeRejectType":"0","NodeDesignate":"ALL_USER"}},{"name":"node_8","left":261,"top":443,"type":"end round","id":"1523688066308","width":26,"height":26,"alt":true}],"lines":[{"type":"sl","from":"1523688043300","to":"1523688045356","id":"1523688073290","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688045356","to":"1523688050220","id":"1523688074210","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688050220","to":"1523688053956","id":"1523688075338","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688050220","to":"1523688054452","id":"1523688079394","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688053956","to":"1523688063308","id":"1523688080746","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688054452","to":"1523688063308","id":"1523688082204","name":"","dash":false,"alt":true},{"type":"sl","from":"1523688063308","to":"1523688066308","id":"1523688084522","name":"","dash":false,"alt":true}],"areas":[],"initNum":16}', N'a4cffd58-7bac-498a-a327-58a644dfdd93', 0, 0, 1, 0, 0, NULL, CAST(0x0000A8C200F2D3E7 AS DateTime), N'', N'', CAST(0x0000A8C200F2D3E7 AS DateTime), N'', N'')
GO
INSERT [dbo].[Form] ([Id], [Name], [Fields], [ContentData], [ContentParse], [Content], [SortCode], [Delete], [DbName], [Enabled], [Description], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a4cffd58-7bac-498a-a327-58a644dfdd93', N'请假条', 3, N'[{"name":"data_1","title":"Name","value":"玉宝","leipiplugins":"text","orghide":"0","style":"text-align: left; width: 150px;","orgalign":"left","orgwidth":"150","orgtype":"text","type":"text","content":"<input name=\"data_1\" title=\"Name\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" style=\"text-align: left; width: 150px;\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" type=\"text\"/>"},{"leipiplugins":"select","name":"data_2","title":"Days","size":"1","style":"width: 150px;","orgwidth":"150","value":"1,3,5,7","selected":"selected","content":"<span leipiplugins=\"select\"><select name=\"data_2\" title=\"Days\" leipiplugins=\"select\" size=\"1\" style=\"width: 150px;\" orgwidth=\"150\"><option value=\"1\">1</option><option value=\"3\" selected=\"selected\">3</option><option value=\"5\">5</option><option value=\"7\">7</option></select>&nbsp;&nbsp;</span>"},{"title":"Comment","name":"data_3","leipiplugins":"textarea","value":"","orgrich":"1","orgfontsize":"","orgwidth":"300","orgheight":"80","style":"width: 316px; height: 139px;","content":"<textarea title=\"Comment\" name=\"data_3\" leipiplugins=\"textarea\" value=\"\" orgrich=\"1\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width: 316px; height: 139px;\"></textarea>"}]', N'<p><br/></p><p style="text-align: center;">姓名：{data_1}</p><p style="text-align: center;">天数：{data_2}</p><p style="text-align: center;">备注：{data_3}</p>', N'<p><br/></p><p style="text-align: center;">姓名：<input name="data_1" title="Name" value="玉宝" leipiplugins="text" orghide="0" style="text-align: left; width: 150px;" orgalign="left" orgwidth="150" orgtype="text" type="text"/></p><p style="text-align: center;">天数：{|-<span leipiplugins="select"><select name="data_2" title="Days" leipiplugins="select" size="1" style="width: 150px;" orgwidth="150"><option value="1">1</option><option value="3" selected="selected">3</option><option value="5">5</option><option value="7">7</option></select>&nbsp;&nbsp;</span>-|}</p><p style="text-align: center;">备注：<textarea title="Comment" name="data_3" leipiplugins="textarea" value="" orgrich="1" orgfontsize="" orgwidth="300" orgheight="80" style="width: 316px; height: 139px;"></textarea></p>', 1, 0, NULL, 0, NULL, CAST(0x0000A8BA010C40B7 AS DateTime), N'', N'', CAST(0x0000A8BA010C40B7 AS DateTime), N'', N'')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'0031262c-689c-4b96-bae2-2c9d67076ade', N'.0.1.2.', N'流程设计', N'/flowSchemes/index', N'', 0, 0, N'&#xe628;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'FlowScheme')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'.0.2.', N'流程中心', N'/', N'', 0, 0, N'&#xe638;', 0, N'根节点', N'', 0, NULL, NULL)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'37bb9414-19a0-4223-9056-71f8c758a930', N'.0.2.3.', N'已处理流程', N'/flowinstances/disposed', N'', 0, 0, N'&#xe610;', 0, N'流程中心', N'', 1, N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'FlowInstanceDisposed')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'4abafc83-c8f5-452f-9882-e113a86e7a3e', N'.0.2.2.', N'待处理流程', N'/flowinstances/wait', N'', 0, 0, N'&#xe641;', 0, N'流程中心', N'', 1, N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'FlowInstanceWait')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', N'.0.1.8.', N'部门管理', N'/OrgManager/Index', N'', 0, 0, N'&#xe613;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Org')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'7580672f-a390-4bb6-982d-9a4570cb5199', N'.0.1.', N'基础配置', N' ', N' ', 1, 0, N'&#xe620;', 1, N'根节点', N' ', 0, NULL, NULL)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'92b00259-2d15-43e7-9321-adffb29e8bf2', N'.0.1.5.', N'表单设计', N'/forms/index', N'', 0, 0, N'&#xe63c;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Form')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'9486ff22-b696-4d7f-8093-8a3e53c45453', N'.0.2.1.', N'我的流程', N'/flowInstances/Index', N'', 0, 0, N'&#xe618;', 0, N'流程中心', N'', 2, N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'FlowInstance')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', N'.0.1.7.', N'分类管理', N'/Categories/Index', N'', 0, 0, N'&#xe62a;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Category')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'bc80478d-0547-4437-9cff-be4b40144bdf', N'.0.1.6.', N'模块管理', N'/ModuleManager/Index', N' ', 1, 0, N'&#xe630;', 0, N'基础配置', N' ', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Module')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'bedb41a2-f310-4775-af99-01be08adda93', N'.0.1.1.', N'角色管理', N'/RoleManager/Index', N'', 1, 0, N'&#xe627;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Role')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', N'.0.1.3.', N'资源管理', N'/Resources/Index', N'', 0, 0, N'&#xe64c;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'Resource')
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code]) VALUES (N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', N'.0.1.4.', N'用户管理', N'/UserManager/Index', N'', 0, 0, N'&#xe612;', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199', N'User')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'0d25438e-1436-48e0-aedf-0f1690693282', N'btnAccessModule', N'为角色分配模块', N'', N'assignRoleModule(this)', N'', N'layui-btn-normal', N'为角色分配模块', 4, N'bedb41a2-f310-4775-af99-01be08adda93', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', N'btnAssignReource', N'为角色分配资源', N'', N'openRoleReourceAccess(this)', N'', N'layui-btn-normal', N'为角色分配资源', 3, N'bedb41a2-f310-4775-af99-01be08adda93', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'17ae4fd4-ab4e-439e-ba1d-2a53b46d112b', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'', 2, N'0031262c-689c-4b96-bae2-2c9d67076ade', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'18cc3217-28a6-49b2-9a20-080230065984', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'', 1, N'0031262c-689c-4b96-bae2-2c9d67076ade', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1a473afd-cbd4-41e9-9471-81f9435aaabe', N'btnEdit', N'编辑', N' ', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1c870438-4260-43a5-8996-a6e1dc8bbf6a', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑角色', 1, N'bedb41a2-f310-4775-af99-01be08adda93', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'2d595a2a-5de5-479e-a331-b53c799a6b10', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'2feefce1-e3d8-42ac-b811-2352679628da', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'刪除用戶', 2, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'34730f5a-d307-457b-9041-5f7de30abfa9', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑用户', 1, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'362d1eda-c85e-4b14-a80a-b923291e08de', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加', 0, N'f0f06b8f-0a86-487c-8b0e-0a12573ccd46', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'38109ca0-32ec-44bd-a243-017e591b532b', N'btnEditStock', N'编辑', N' ', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'', 1, N'92b00259-2d15-43e7-9321-adffb29e8bf2', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'44075557-496e-4dde-bb75-7b69f51ab4fe', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑模块', 2, N'bc80478d-0547-4437-9cff-be4b40144bdf', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'4bfa8ea0-6b0d-426f-8687-b654575ca780', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑资源', 2, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'4f2737db-633f-4946-8a71-b08b9885f151', N'btnEdit', N'编辑', N'', N'edit()', N'&#xe642;', N'layui-btn-normal', N'', 2, N'92b00259-2d15-43e7-9321-adffb29e8bf2', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'50c9df24-b233-42cb-9a0d-4ce158c75f86', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加用戶', 0, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'584c7a3b-d28a-47b4-8648-7797d05d83d1', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'', 3, N'9486ff22-b696-4d7f-8093-8a3e53c45453', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae', N'btnAddMenu', N'添加菜单', N'', N'assignButton()', N'&#xe654;', N'layui-btn-normal', N'为模块分配按钮', 4, N'bc80478d-0547-4437-9cff-be4b40144bdf', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'5ed1681c-13d2-4c87-8676-a8d95c0b40ae', N'btnEditMenu', N'编辑菜单', N'', N'', N'&#xe642;', N'layui-btn-normal', N'编辑菜单', 5, N'bc80478d-0547-4437-9cff-be4b40144bdf', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'5ed1681c-13d2-4c87-8677-a8d95c0b40ae', N'btnDelMenu', N'删除菜单', N'', N'', N'', N'layui-btn-danger', N'', 6, N'bc80478d-0547-4437-9cff-be4b40144bdf', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'645b40ac-4223-44a7-aab4-66eb56cf9864', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加角色', 0, N'bedb41a2-f310-4775-af99-01be08adda93', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'6839a297-350b-4215-b680-4e5dfdae5615', N'btnAssignReource', N'为用户分配资源', N'', N'openUserReourceAccess(this)', N'', N'layui-btn-normal', N'为用户分配资源', 4, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'68484265-7802-4f06-b024-33e8b2f2edcf', N'btnAdd', N'新的申请', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'申请物品', 0, N'9486ff22-b696-4d7f-8093-8a3e53c45453', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'68fc793f-069f-43e1-a012-42ac2d7c585c', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除角色', 2, N'bedb41a2-f310-4775-af99-01be08adda93', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'6c814946-db5c-48bd-84dd-b1c38196ad74', N'btnAdd', N'添加模版', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'', 0, N'0031262c-689c-4b96-bae2-2c9d67076ade', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'6db928fe-93df-460f-9472-8bb0b6cae52c', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', N'btnVerification', N'处理', N'', N'verificationForm()', N'&#xe610;', N'layui-btn-normal', N'', 5, N'4abafc83-c8f5-452f-9882-e113a86e7a3e', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'7f071c63-1620-4486-9264-5806b2e63218', N'btnAccessRole', N'为用户分配角色', N'', N'openUserRoleAccess(this)', N'', N'layui-btn-normal', N'为用户分配角色', 5, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'816b12b3-e916-446d-a2fa-329cfd13c831', N'btnDetail', N'进度详情', N'', N'', N'&#xe60a;', N'layui-btn-normal', N'', 4, N'9486ff22-b696-4d7f-8093-8a3e53c45453', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'826b12b3-e916-446d-a2fa-329cfd13c831', N'btnDetail', N'进度详情', N'', N'', N'&#xe60a;', N'layui-btn-normal', N'', 4, N'4abafc83-c8f5-452f-9882-e113a86e7a3e', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'84694ea5-d6e1-4a65-8a59-7b5b779688d4', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加模块', 1, N'bc80478d-0547-4437-9cff-be4b40144bdf', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'84e38920-f6e5-499c-bf52-a3c6f8499ff7', N'btnDelStock', N'删除', N' ', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'8966b04f-8e26-4046-8b03-0c64f9f833dd', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'', 3, N'92b00259-2d15-43e7-9321-adffb29e8bf2', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'9c96e485-84a6-45f0-b6a7-f01dab94b0c6', N'btnPreview', N'预览', N'', N'preview()', N'', N'layui-btn-normal', N'', 4, N'92b00259-2d15-43e7-9321-adffb29e8bf2', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'9e2c6754-f258-4b14-96a0-b9d981196a65', N'btnAdd', N'添加', N'', N'add()', N'&#xe654;', N'layui-btn-normal', N'添加资源', 0, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a', N'btnDetail', N'查看详情', N'', N'', N'&#xe60a;', N'layui-btn-normal', N'', 0, N'37bb9414-19a0-4223-9056-71f8c758a930', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'c3d7b478-21e9-4c1e-b866-a3c80be7909b', N'btnRefresh', N'刷新', N'', N'refresh()', N'&#xe615;', N'layui-btn-normal', N'刷新分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'c7d7daf0-3669-4a22-8bed-b092617deb9c', N'btnDel', N'删除', N'', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除资源', 3, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a', N'btnRefresh', N'刷新', N'', N'refresh()', N'&#xe615;', N'layui-btn-normal', N'刷新用户', 3, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'd352c8ee-3dff-4d28-a0de-903ae68f2533', N'btnPreview', N'预览', N'', N'preview()', N'', N'layui-btn-normal', N'', 1, N'0031262c-689c-4b96-bae2-2c9d67076ade', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4', N'btnDel', N'删除', N' ', N'del()', N'&#xe640;', N'layui-btn-danger', N'删除模块', 3, N'bc80478d-0547-4437-9cff-be4b40144bdf', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'ef42721f-d223-4a00-a1d9-80b81121f21a', N'btnEdit', N'编辑', N' ', N'edit()', N'&#xe642;', N'layui-btn-normal', N'编辑部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'f8dde22a-2a37-47c4-8e67-70fb3af5303e', N'btnRefresh', N'刷新', N'', N'refresh()', N'&#xe615;', N'layui-btn-normal', N'刷新部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'fa816af1-a28d-47b5-9b8b-c46e18f902e9', N'btnAccessModule', N'为用户分配模块', N'', N'openUserModuleAccess(this)', N'', N'layui-btn-normal', N'为用户分配模块', 6, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', NULL, NULL)
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', N'.0.1.3.1.', N'研发小组', N'', N'研发部', 0, 0, N'', 0, N'0', N'', CAST(0x0000A69F00C0671C AS DateTime), 0, 1, N'990cb229-cc18-41f3-8e2b-13f0f0110798', NULL, NULL)
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'543a9fcf-4770-4fd9-865f-030e562be238', N'.0.1.', N'集团总部', N'', N'根节点', 0, 0, N'', 0, N'0', N'', CAST(0x0000A69F00BF7F21 AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'86449128-d5ac-44bf-b999-f7735b7458fd', N'.0.2.1.', N'汇丰软件部', N'', N'汇丰', 0, 0, N'', 0, N'0', N'', CAST(0x0000A61200FA3A14 AS DateTime), 0, 1, N'c36e43df-3a99-45da-80d9-3ac5d24f4014', NULL, NULL)
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'990cb229-cc18-41f3-8e2b-13f0f0110798', N'.0.1.3.', N'研发部', N'', N'集团总部', 0, 1, N'', 0, N'0', N'', CAST(0x0000A5EA00D73ED8 AS DateTime), 0, 0, N'543a9fcf-4770-4fd9-865f-030e562be238', NULL, NULL)
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'c36e43df-3a99-45da-80d9-3ac5d24f4014', N'.0.2.', N'汇丰', N'', N'根节点', 0, 0, N'', 0, N'0', N'', CAST(0x0000A61200FA1EF5 AS DateTime), 0, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'03be9b5e-38b0-4525-8431-b26d35ce6ce3', N'', N'UserElement', 0, CAST(0x0000A67A00FFA0E8 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'06dfd97d-17e0-42b8-bde7-40006d8c8eb2', N'', N'UserElement', 0, CAST(0x0000A8BA00F49D2B AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'06f4c4a2-faa8-4bad-9184-50ceb517f30b', N'', N'ProcessUser', 0, CAST(0x0000A67B0114EBF5 AS DateTime), N'0', N'10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'08ff97f7-17fc-4072-b29a-287135898ece', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fdf3aac3-4507-40ad-aa2f-d7f0459de252')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0db8bc97-207f-439d-99b7-8a37f74bccbe', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177D75B AS DateTime), N'', N'09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0e2316ba-8286-45a2-8767-0e01390a3ebb', N'', N'UserOrg', 0, CAST(0x0000A846010CDDCD AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0fd5b371-b010-4846-8833-95cc1e813a32', N'', N'UserElement', 0, CAST(0x0000A67A00FFC7A6 AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'10a76196-ba0c-4294-bb8f-dcd063eb4aab', N'', N'UserOrg', 0, CAST(0x0000A80A00980F22 AS DateTime), N'', N'3eacdedd-e93a-4816-b49c-99ba3d5323c2', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'10e58d75-dec1-4b85-882f-9dac79ad1210', N'', N'RoleResource', 0, CAST(0x0000A6A6012AE37E AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'ec99f670-0eca-465c-9f64-d4d5dc510b83')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'120d7a5d-203c-4261-95f5-0125757fb386', N'', N'UserElement', 0, CAST(0x0000A6A501186DFD AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'7f071c63-1620-4486-9264-5806b2e63218')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'13433400-a32c-4539-b988-8b417c09bc0e', N'', N'UserModule', 0, CAST(0x0000A67A00FF765A AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'13612a4c-b20c-4bd0-a2cd-0ae47576364d', N'', N'UserElement', 0, CAST(0x0000A6A5011110C7 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1490edd4-9bd3-4e71-bfa4-56f6558c1d3f', N'', N'UserElement', 0, CAST(0x0000A8BA00A19C71 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'79dcd3eb-3aaf-4e08-83c9-713d8ff446fe')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'16154fc4-d18e-44a3-bcf2-5539b168aba7', N'', N'RoleElement', 0, CAST(0x0000A6A9011F1678 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'18cc3217-28a6-49b2-9a20-080230065984')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'16782d9e-8cce-4ec1-a343-7ad7c83c5e25', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177D75B AS DateTime), N'', N'09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1740ff26-a4d0-44cc-9fab-a0105c2c60b6', N'', N'UserOrg', 0, CAST(0x0000A80A00E6A96D AS DateTime), N'', N'63c9c82a-e0d3-4bde-bbd2-057cda2f5283', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1873ed85-a88a-4236-bd40-2c416aa2576c', N'', N'RoleModule', 0, CAST(0x0000A67501192770 AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'7580672f-a390-4bb6-982d-9a4570cb5199')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'19c9621c-3d23-46b7-a841-54d5c82ec8e8', N'', N'UserOrg', 0, CAST(0x0000A67500E5DB32 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1acec4c4-0136-4e2b-a839-8676dbd6594a', N'', N'ProcessUser', 0, CAST(0x0000A68100BFD09D AS DateTime), N'0', N'6c6afe3c-349c-4198-8710-cf19c90f3afd', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1cb94cc4-a42a-4ee1-b129-6692a83aa85c', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177DCFA AS DateTime), N'', N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1ced1564-2fea-4c04-8aea-f071fa5bb293', N'', N'UserModule', 0, CAST(0x0000A678010E83BB AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1cf19b35-e2c2-436f-99b9-03ac2b232cc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1f1262be-cadf-4959-997a-37d40bb36493', N'', N'UserOrg', 0, CAST(0x0000A846010CE419 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2014027e-0cff-41cf-974b-56126d6eaa9a', N'', N'RoleElement', 0, CAST(0x0000A678009A68AE AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'242e9543-3343-41d4-8816-15ffeeaef551', N'', N'UserElement', 0, CAST(0x0000A67A00FFC7A6 AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'27c4d50c-32da-4dbc-88a1-84b343cdd649', N'', N'UserElement', 0, CAST(0x0000A6A501186D3A AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'6839a297-350b-4215-b680-4e5dfdae5615')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'29b06cd6-af0c-4c63-9aba-e5431c5d62ec', N'', N'UserOrg', 0, CAST(0x0000A80A00980F22 AS DateTime), N'', N'3eacdedd-e93a-4816-b49c-99ba3d5323c2', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2a36a2b7-41aa-4190-b88c-75d44a56ad6e', N'', N'UserModule', 0, CAST(0x0000A7120003EDBE AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'92b00259-2d15-43e7-9321-adffb29e8bf2')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2bb3fddb-0f51-442e-8dbf-236beb47d8a6', N'', N'RoleOrg', 0, CAST(0x0000A8C200DAD5BB AS DateTime), N'', N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2ca288a6-d222-4328-951e-c01c3e77a0c7', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7f071c63-1620-4486-9264-5806b2e63218')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d0fcc88-a7c0-4d33-8a08-1d688e9dde83', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d15e438-cc3a-41e9-9b13-325bfd5c804a', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84e38920-f6e5-499c-bf52-a3c6f8499ff7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2ebff9a4-b2d5-4a35-a7dd-2cfa2f5b0522', N'', N'ProcessUser', 0, CAST(0x0000A67A01216463 AS DateTime), N'0', N'52cc7933-a045-4dcc-8c17-1b618bfa772b', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2f01f6e6-b9f3-44c1-86f4-e83f6e4ad676', N'', N'RoleResource', 0, CAST(0x0000A8C200F1AEC5 AS DateTime), N'', N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'OPENAUTH_LOGIN')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'30c82d18-7892-4e5f-9aee-e4f483a858c2', N'', N'UserModule', 0, CAST(0x0000A678010E8402 AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'332a373c-f485-4f85-9af9-7792f7462bf1', N'', N'RoleModule', 0, CAST(0x0000A6750119308C AS DateTime), N'0', N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'340c60fe-8b95-474c-aa04-9197903998d2', N'', N'RoleModule', 0, CAST(0x0000A6770180AD27 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7580672f-a390-4bb6-982d-9a4570cb5199')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'361feb63-bde2-49c7-86ec-6df3ec6f0fe3', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3afb470e-968a-4c46-83a2-832a91da52a9', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177DCFA AS DateTime), N'', N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'543a9fcf-4770-4fd9-865f-030e562be238')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3bcaab20-e096-480e-a9bb-0fdb70686714', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'cf7388be-2677-427c-ad78-8f00f1062b96')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3de0359b-6331-4dc7-a00e-751f71dbadb5', N'', N'ProcessUser', 0, CAST(0x0000A68F009AC523 AS DateTime), N'0', N'68295d2a-4dfd-4c5e-81e3-9c787e2603bc', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'460d1c98-2a68-43cf-8d38-d40ceb89916f', N'', N'UserOrg', 0, CAST(0x0000A80A00980F22 AS DateTime), N'', N'3eacdedd-e93a-4816-b49c-99ba3d5323c2', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4757bb30-e4bc-4c2d-a824-947ef151d341', N'', N'UserRole', 0, CAST(0x0000A67A014F6DBE AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'4980a85b-e3db-4607-bc2c-0baf0140d7df')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4ba3982b-f0ae-4f9a-980e-1eaedc3b5f2e', N'', N'UserElement', 0, CAST(0x0000A67A01257D69 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4c2fb006-53d6-4041-8cf6-e5d74d788897', N'', N'UserModule', 0, CAST(0x0000A8BA00A19666 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4c69794b-9957-4f6b-b0fb-6455fe643565', N'', N'UserElement', 0, CAST(0x0000A8BA00F4A250 AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'826b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4e613188-0387-4d17-a60d-703b4a606d75', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bc80478d-0547-4437-9cff-be4b40144bdf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4ec39ee9-9ee9-4aa9-a0db-eb0fdf8d2f00', N'', N'UserElement', 0, CAST(0x0000A8BA00A19F3B AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4fde1dc6-9d73-4c7c-9238-28981858c5a6', N'', N'RoleModule', 0, CAST(0x0000A678009A5780 AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5167dbcd-3a32-4ae8-827e-6f381cc58fa2', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'53a4be87-4fa8-415b-97b5-2298ce8b17c8', N'', N'UserResource', 0, CAST(0x0000A8C200F12ABF AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'XXX_LOGIN')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'54b2e9b6-1f7c-4a39-92c9-98f58429c1fc', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bc80478d-0547-4437-9cff-be4b40144bdf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'55b10ecc-3fb3-4127-b69e-e7a3467d7a1a', N'', N'RoleElement', 0, CAST(0x0000A678009A68AE AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'6db928fe-93df-460f-9472-8bb0b6cae52c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5725ff79-43c6-4778-bbff-131cf364dab6', N'', N'UserElement', 0, CAST(0x0000A6A501186E92 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'cf7388be-2677-427c-ad78-8f00f1062b96')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5903cc95-17fc-423f-9439-bcdf1f808d7b', N'', N'UserOrg', 0, CAST(0x0000A84700E8A8B9 AS DateTime), N'', N'229f3a49-ab27-49ce-b383-9f10ca23a9d5', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5a20d59c-6ee6-4fe2-98fe-7b35b11026ae', N'', N'UserElement', 0, CAST(0x0000A67A00FF85A7 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5b2d5db8-d603-4be3-add2-c85ef3c53ddc', N'', N'UserResource', 0, CAST(0x0000A8C200F12C9F AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'OPENAUTH_LOGIN')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5ed71f83-0023-42c3-a77a-979d22d12fc7', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177DCFA AS DateTime), N'', N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'620b368a-7b56-4c74-ab85-8bc91d08ddc9', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6431a464-6f1f-4ffc-8157-89212b70f09a', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'648500cc-e1e6-426d-9f17-c6061ce606a1', N'', N'UserOrg', 0, CAST(0x0000A846010CEAA3 AS DateTime), N'', N'de8be521-f1ec-4483-b124-0be342890507', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'64e4f5aa-28ef-4690-9b20-5f0b543964f6', N'', N'UserElement', 0, CAST(0x0000A67A00FF85A6 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6645b6fb-efcf-4e48-9c13-84f79bc5be34', N'', N'RoleOrg', 0, CAST(0x0000A8C200DAD5BB AS DateTime), N'', N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'66e25fc5-093d-42ab-85dc-a38f6600889b', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'68912e65-256e-45b6-b48e-036382598d32', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5D841 AS DateTime), N'0', N'2eb423d6-6ad9-4efe-b423-872478a2a434', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'69dae19a-d92c-4fb6-b969-3c7560d999c4', N'', N'UserOrg', 0, CAST(0x0000A846010CE419 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6b9c4789-042c-4f6f-a749-ee68ee87462d', N'', N'ProcessUser', 0, CAST(0x0000A6AC0114D121 AS DateTime), N'0', N'054ff054-d8ae-4911-a596-8fb1f66b348f', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6da6d662-8cef-47cd-80b3-fa885b2dca7a', N'', N'RoleOrg', 0, CAST(0x0000A8C200DAD5BB AS DateTime), N'', N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6db5666b-6f8c-4e83-bada-0b45054bd9a4', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0d25438e-1436-48e0-aedf-0f1690693282')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6fe52499-f800-47ce-96fc-a2b5b43505d5', N'', N'UserElement', 0, CAST(0x0000A8BA00A199B2 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'715d017a-68b6-468d-aa3f-32ca4cfd4b9e', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bedb41a2-f310-4775-af99-01be08adda93')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'72b2344b-c62a-470e-9c74-83f5b1cf68f1', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177ED1A AS DateTime), N'', N'3e761e88-ddf7-4a62-b219-9a315b4564f2', N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'72bf4729-af60-42f5-b0d7-717362ffad7f', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2feefce1-e3d8-42ac-b811-2352679628da')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7475b0c3-f204-4f95-a22f-80591fe76bc7', N'', N'ProcessUser', 0, CAST(0x0000A6B000C3BC6D AS DateTime), N'0', N'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'74f4a3a3-b84b-4ad7-bca1-c85494e01e8e', N'', N'UserOrg', 0, CAST(0x0000A846010CDDCD AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'75340ad3-fb80-4646-b1de-ba801688ddc2', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'77bd93da-2c2b-4ba8-bf05-3a1382811a6a', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'77eec82a-f713-4584-872c-761fdbcdb456', N'', N'UserElement', 0, CAST(0x0000A8BA00F49D9E AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'77fc08e6-98ae-4d33-b294-bd9fed5b14ed', N'', N'UserElement', 0, CAST(0x0000A8BA00F49CA0 AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'797c6e5f-7f3c-4891-89b9-a054e10f6c00', N'', N'UserModule', 0, CAST(0x0000A8BA00A180FC AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'37bb9414-19a0-4223-9056-71f8c758a930')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7f25286f-246b-4143-98eb-c3e574fe7455', N'', N'ProcessUser', 0, CAST(0x0000A67A01216457 AS DateTime), N'0', N'52cc7933-a045-4dcc-8c17-1b618bfa772b', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7fd7f976-f10e-44aa-a7ba-7ca40d2e8f90', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'80310629-5e52-482c-9a0f-5c5bdfabcd9e', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'832f4a8f-7791-4aa6-bcd2-20dcb6f5ef37', N'', N'UserElement', 0, CAST(0x0000A67500F54A2F AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'84a52091-08a0-4a46-b661-3cd206771c29', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0031262c-689c-4b96-bae2-2c9d67076ade')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'854e0658-ab8a-4869-b157-9941955acdc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D689 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1a473afd-cbd4-41e9-9471-81f9435aaabe')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'88a4c966-d042-4a2e-b133-ff7eded1c5de', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8b633f3c-965b-4e35-8496-c364890d7760', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c3d7b478-21e9-4c1e-b866-a3c80be7909b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'92f0b297-96c1-47d4-84dd-571374431bc0', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EC AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'93bcac7a-0ff1-488c-8d1c-3da7e44cbefc', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'960224e6-5910-472b-a5ef-b2aa9a8b106f', N'', N'UserRole', 0, CAST(0x0000A6790119DE94 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'db309d88-fd21-4b81-a4d9-ae6276a1d813')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'962b278b-0894-4b36-b1a0-6c5c3d11d4c3', N'', N'UserElement', 0, CAST(0x0000A8BA00F4857A AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'965f010b-2fd6-4b34-ba23-3e44c1af2877', N'', N'RoleOrg', 0, CAST(0x0000A67B010CF904 AS DateTime), N'0', N'36094f5d-07e7-40d5-91dc-ff60f98b496a', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9ad706e3-8e6b-4bc7-a502-371b298ef062', N'', N'RoleElement', 0, CAST(0x0000A6770180DB22 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9d568d6d-d78d-47d6-8fb6-b1327cdbe83a', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9e46a946-6e81-4f61-bcba-21e4f7fac3df', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9e57e1ff-e9cf-4600-a872-ac85f7845bb0', N'', N'RoleOrg', 0, CAST(0x0000A8C200DAD5BB AS DateTime), N'', N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9edc7b81-2b51-4193-8805-6062e596ccdc', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9fa50449-5d87-4579-9f1f-9cdcd876976b', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6839a297-350b-4215-b680-4e5dfdae5615')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a051aa08-38da-4b6d-8d90-10b3c2485e4b', N'', N'RoleOrg', 0, CAST(0x0000A6780000006A AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'543a9fcf-4770-4fd9-865f-030e562be238')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a06fe8c6-3f5e-4085-9bbf-e366571a356c', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EB AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a0904102-e26a-4bc5-9c95-ed5ef977586b', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a5bef7bf-ecdb-4480-ad64-b39a02269607', N'', N'UserModule', 0, CAST(0x0000A8BA00A1AB94 AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a8094b46-de5a-40ea-a8ee-69ea905480ef', N'', N'RoleModule', 0, CAST(0x0000A678009A5734 AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a8123b37-ba70-4aab-aef6-1938733b5210', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c0d8505c-061a-467d-862a-c94f27caa208')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a9821db0-49bd-49be-a554-afa811c99760', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ec99f670-0eca-465c-9f64-d4d5dc510b83')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'aa051096-a23a-431d-9053-bb954f9453a7', N'', N'RoleElement', 0, CAST(0x0000A6770180C45E AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'4bfa8ea0-6b0d-426f-8687-b654575ca780')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ab84b111-fb5d-4ddd-99d5-479954d9d521', N'', N'RoleOrg', 0, CAST(0x0000A67B010CF908 AS DateTime), N'0', N'36094f5d-07e7-40d5-91dc-ff60f98b496a', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ab924ba7-8a74-4804-82b0-ecbbedf4c13e', N'', N'RoleElement', 0, CAST(0x0000A678009A68AD AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'38109ca0-32ec-44bd-a243-017e591b532b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ac184827-9899-4b40-8939-61fe9d2b187c', N'', N'UserElement', 0, CAST(0x0000A67A01258FB9 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'acb4d37f-8b45-4a99-b364-99f3881dfcda', N'', N'RoleElement', 0, CAST(0x0000A6770180DB1A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'acc51898-5335-4903-83b9-4701a782bc4d', N'', N'UserElement', 0, CAST(0x0000A6A501186F28 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad267296-5eba-4d59-b821-8148d8cfb3c6', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad29467e-eeee-494c-ab82-f6be5d2619d5', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad5bc7a6-e307-4fa8-a4ef-ce9e09f7e21b', N'', N'RoleModule', 0, CAST(0x0000A678009A577F AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'af263192-daa8-4f29-99b9-1efb96e31627', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'645b40ac-4223-44a7-aab4-66eb56cf9864')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b08d7763-a725-406f-a7d5-d144f00d716e', N'', N'UserOrg', 0, CAST(0x0000A67500E5CD5F AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'543a9fcf-4770-4fd9-865f-030e562be238')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b241dd3d-2965-44e4-929d-9dacb6444e09', N'', N'RoleOrg', 0, CAST(0x0000A8C200DAD5BB AS DateTime), N'', N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'543a9fcf-4770-4fd9-865f-030e562be238')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b2490ac0-ba16-48a2-b39d-49f6b87f9387', N'', N'UserModule', 0, CAST(0x0000A8BA00A193D2 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b2edfee4-f980-4aa5-b547-492d677e0674', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b3b8f695-a179-489b-90b4-7814ab048a69', N'', N'UserElement', 0, CAST(0x0000A8BA00A1986A AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b672a830-c3a5-408b-a746-65608534b24c', N'', N'UserModule', 0, CAST(0x0000A84A011A1905 AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b9e63d17-35c8-4456-abab-8f43a1c99adc', N'', N'UserModule', 0, CAST(0x0000A8BA00A17EF6 AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'4abafc83-c8f5-452f-9882-e113a86e7a3e')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bbdc3ea9-3f21-48b0-9d7a-39545d6183d0', N'', N'UserElement', 0, CAST(0x0000A8BA00A19CE7 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'826b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bd783f53-23fa-41f4-8cec-7c61fab52072', N'', N'UserOrg', 0, CAST(0x0000A8A400998F24 AS DateTime), N'', N'0ceff0f8-f848-440c-bc26-d8605ac858cd', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bda5f089-64d6-4fb8-9012-d7f3ff36902a', N'', N'UserOrg', 0, CAST(0x0000A80A00E67AEB AS DateTime), N'', N'ffd92ed2-5330-4ec2-a42d-6e0e9005db3b', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bee6572d-8fb8-4e0e-af15-93aafc989717', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'68fc793f-069f-43e1-a012-42ac2d7c585c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c14addeb-1812-4a78-9152-1f7115b22d89', N'', N'UserRole', 0, CAST(0x0000A67800003793 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'db309d88-fd21-4b81-a4d9-ae6276a1d813')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c2d3b7d6-b47d-4bd8-9dc6-d9134d86713f', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c3050d65-d26b-4e46-bece-a212b0cc00ec', N'', N'RoleElement', 0, CAST(0x0000A6770180B648 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c4771ac5-3375-4de9-adb8-a603398f0d62', N'', N'RoleElement', 0, CAST(0x0000A6770180D68B AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2d595a2a-5de5-479e-a331-b53c799a6b10')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c50fae2a-b36f-486f-9d53-e58406590101', N'', N'ProcessUser', 0, CAST(0x0000A6AC0114D121 AS DateTime), N'0', N'054ff054-d8ae-4911-a596-8fb1f66b348f', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c58cb482-6ab7-49eb-b5b0-e45424b6e502', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'34730f5a-d307-457b-9041-5f7de30abfa9')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c733cfbe-2f71-41e4-92a6-4ff97cf88dc4', N'', N'UserModule', 0, CAST(0x0000A8BA00A195B5 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'4abafc83-c8f5-452f-9882-e113a86e7a3e')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c81aaf5c-6bfa-4105-8b45-cb7959b62572', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177ED1A AS DateTime), N'', N'3e761e88-ddf7-4a62-b219-9a315b4564f2', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c8dc4685-7beb-4e42-960c-96174da1b756', N'', N'RoleOrg', 0, CAST(0x0000A8BD0177D75B AS DateTime), N'', N'09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', N'543a9fcf-4770-4fd9-865f-030e562be238')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c9099371-8d4e-4f5b-9686-2c60a2c1c641', N'', N'ProcessUser', 0, CAST(0x0000A67B0114EBF4 AS DateTime), N'0', N'10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c98b3d02-a76b-4ecc-94a5-cfeffd5e29fb', N'', N'RoleModule', 0, CAST(0x0000A67501192798 AS DateTime), N'0', N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bedb41a2-f310-4775-af99-01be08adda93')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ccae4f18-f33b-4656-9e59-93b9e29fc4b4', N'', N'UserOrg', 0, CAST(0x0000A84700E8AFA5 AS DateTime), N'', N'1df68dfd-3b6d-4491-872f-00a0fc6c5a64', N'86449128-d5ac-44bf-b999-f7735b7458fd')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'da6c0645-0bf9-4ade-9dd3-1b09e91e504c', N'', N'RoleElement', 0, CAST(0x0000A678009A6357 AS DateTime), N'0', N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'df2d90b3-4e2e-40e9-b406-220009726460', N'', N'RoleModule', 0, CAST(0x0000A6770180AD2A AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dfd5430b-3422-465a-be79-05a1e06deed2', N'', N'RoleElement', 0, CAST(0x0000A6770180C45D AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e12b77de-b7ce-4f38-b7a3-f3b2d285f33b', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5D841 AS DateTime), N'0', N'2eb423d6-6ad9-4efe-b423-872478a2a434', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e28c0dcd-168a-4b60-a514-7b6eb8026709', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e619a82e-edfb-4542-94df-0b92850667ad', N'', N'RoleResource', 0, CAST(0x0000A8C200F1ADFD AS DateTime), N'', N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'OPENAUTH_MODIFYACCOUNT')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e785147c-f46b-474f-8fad-73b14fa69822', N'', N'UserRole', 0, CAST(0x0000A6790119EE6D AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'4980a85b-e3db-4607-bc2c-0baf0140d7df')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e84f6b9c-716d-4e94-a1aa-7fd0d1a2e23e', N'', N'RoleModule', 0, CAST(0x0000A6750119308B AS DateTime), N'0', N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e9cf3d63-6305-46c7-93b4-14053387c62c', N'', N'UserModule', 0, CAST(0x0000A8BA00A19510 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'37bb9414-19a0-4223-9056-71f8c758a930')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ec72f6ae-09ee-4db9-99a1-bf15c8e35dda', N'', N'ProcessUser', 0, CAST(0x0000A68100BFD097 AS DateTime), N'0', N'6c6afe3c-349c-4198-8710-cf19c90f3afd', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ec9c80ce-dbdf-4ba5-9091-82f75392c3b0', N'', N'UserElement', 0, CAST(0x0000A67A00FFA0E8 AS DateTime), N'0', N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ee1986a0-24cc-4dec-b5f5-68ef959ab650', N'', N'UserElement', 0, CAST(0x0000A8BA00F4A08F AS DateTime), N'', N'49df1602-f5f3-4d52-afb7-3802da619558', N'79dcd3eb-3aaf-4e08-83c9-713d8ff446fe')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ee4f39fd-4fbf-4f68-9a70-d6c7d7db9723', N'', N'ProcessUser', 0, CAST(0x0000A6B000C3BC6C AS DateTime), N'0', N'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'eec41fcb-61c0-4e56-a5c0-a9f8be6e6fdc', N'', N'UserModule', 0, CAST(0x0000A67A00FF7630 AS DateTime), N'0', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f4ba636a-9002-43e6-93eb-95132a3e68c5', N'', N'ProcessUser', 0, CAST(0x0000A68F009AC522 AS DateTime), N'0', N'68295d2a-4dfd-4c5e-81e3-9c787e2603bc', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f579a427-a9ed-4ebe-8411-72e8e6abd01d', N'', N'UserElement', 0, CAST(0x0000A678010EA882 AS DateTime), N'0', N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'816b12b3-e916-446d-a2fa-329cfd13c831')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f61ee29b-7988-404d-b692-5a8f667684be', N'', N'UserElement', 0, CAST(0x0000A8BA00A19A28 AS DateTime), N'', N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f6367ca1-0486-46a4-b9c6-65c00936a516', N'', N'RoleElement', 0, CAST(0x0000A6770180C462 AS DateTime), N'0', N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'9e2c6754-f258-4b14-96a0-b9d981196a65')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'fa7c4d39-b31a-4668-8716-d40a62aa722b', N'', N'UserOrg', 0, CAST(0x0000A80A00E6A96D AS DateTime), N'', N'63c9c82a-e0d3-4bde-bbd2-057cda2f5283', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
GO
INSERT [dbo].[Resource] ([Id], [CascadeId], [Name], [SortNo], [Description], [ParentName], [ParentId], [AppId], [AppName], [TypeName], [TypeId], [Disable]) VALUES (N'OPENAUTH_DELETEACCOUNT', N'', N'注销账号', 0, N'openauth.net注销账号的权限', N'', N'', N'110', N'OpenAuth.Net', N'', N'', 0)
GO
INSERT [dbo].[Resource] ([Id], [CascadeId], [Name], [SortNo], [Description], [ParentName], [ParentId], [AppId], [AppName], [TypeName], [TypeId], [Disable]) VALUES (N'OPENAUTH_LOGIN', N'', N'登陆', 0, N'openauth.net登陆的权限', N'', N'', N'110', N'OpenAuth.Net', N'', N'', 0)
GO
INSERT [dbo].[Resource] ([Id], [CascadeId], [Name], [SortNo], [Description], [ParentName], [ParentId], [AppId], [AppName], [TypeName], [TypeId], [Disable]) VALUES (N'OPENAUTH_MODIFYACCOUNT', N'', N'修改账号', 0, N'openauth.net修改账号的权限', N'', N'', N'110', N'OpenAuth.Net', N'', N'', 0)
GO
INSERT [dbo].[Resource] ([Id], [CascadeId], [Name], [SortNo], [Description], [ParentName], [ParentId], [AppId], [AppName], [TypeName], [TypeId], [Disable]) VALUES (N'XXX_LOGIN', N'', N'登陆', 0, N'登陆xxx平台的权限', N'', N'', N'119', N'XXX管理平台', N'', N'', 0)
GO
INSERT [dbo].[Role] ([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId]) VALUES (N'09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', N'管理员', 1, CAST(0x0000A8BD0177D70C AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[Role] ([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId]) VALUES (N'0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', N'测试', 1, CAST(0x0000A8BD0177DCF6 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[Role] ([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId]) VALUES (N'3e761e88-ddf7-4a62-b219-9a315b4564f2', N'汇丰测试', 1, CAST(0x0000A8BD0177ED16 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[Role] ([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId]) VALUES (N'77e6d0c3-f9e1-4933-92c3-c1c6eef75593', N'神', 1, CAST(0x0000A8C200DAD584 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'0ceff0f8-f848-440c-bc26-d8605ac858cd', N'test5', N'test5', N'test5', 1, 1, N'', CAST(0x0000A8A400998E39 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'1df68dfd-3b6d-4491-872f-00a0fc6c5a64', N'test4', N'test4', N'test4', 1, 0, N'', CAST(0x0000A84700E8AF94 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'229f3a49-ab27-49ce-b383-9f10ca23a9d5', N'test3', N'test3', N'test3', 1, 0, N'', CAST(0x0000A84700E8A84C AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'49df1602-f5f3-4d52-afb7-3802da619558', N'admin', N'admin', N'admin', 1, 1, N'', CAST(0x0000A846010CDC90 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'test', N'test', N'test', 1, 1, N'', CAST(0x0000A846010CE416 AS DateTime), N'', N'', N'')
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId]) VALUES (N'de8be521-f1ec-4483-b124-0be342890507', N'test2', N'test2', N'test2', 1, 1, N'', CAST(0x0000A846010CEAA0 AS DateTime), N'', N'', N'')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_CATEGORY]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [PK_CATEGORY] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_CATEGORYTYPE]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[CategoryType] ADD  CONSTRAINT [PK_CATEGORYTYPE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_FLOWINSTANCE]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[FlowInstance] ADD  CONSTRAINT [PK_FLOWINSTANCE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_FLOWINSTANCEOPERATIONHISTOR]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[FlowInstanceOperationHistory] ADD  CONSTRAINT [PK_FLOWINSTANCEOPERATIONHISTOR] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_FLOWINSTANCETRANSITIONHISTO]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  CONSTRAINT [PK_FLOWINSTANCETRANSITIONHISTO] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_FLOWSCHEME]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[FlowScheme] ADD  CONSTRAINT [PK_FLOWSCHEME] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_FORM]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [PK_FORM] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_Test]    Script Date: 2018-04-14 15:19:55 ******/
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [PK_Test] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT ((0)) FOR [Disable]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[CategoryType] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[CategoryType] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [FlowLevel]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [IsFinish]
GO
ALTER TABLE [dbo].[FlowInstanceOperationHistory] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT ((0)) FOR [TransitionSate]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT ((0)) FOR [IsFinish]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [AuthorizeType]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [SortCode]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [DeleteMark]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [Fields]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [SortCode]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [Delete]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [Url]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [HotKey]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT ((1)) FOR [IsLeaf]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [IsAutoExpand]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [IconName]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [ParentName]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT (' ') FOR [Vector]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [DomId]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Attr]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Script]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Icon]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Class]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT (' ') FOR [Remark]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [HotKey]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [ParentName]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((1)) FOR [IsLeaf]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [IsAutoExpand]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [IconName]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [BizCode]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [CustomCode]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [CreateId]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (' ') FOR [Key]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (getdate()) FOR [OperateTime]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT ((0)) FOR [Disable]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT ((0)) FOR [Number]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (' ') FOR [Viewable]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (' ') FOR [User]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_1]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_2]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_3]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ((0)) FOR [checkboxs_0]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_7]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_8]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_9]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_10]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('') FOR [data_11]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (' ') FOR [Account]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (' ') FOR [Password]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Sex]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (' ') FOR [BizCode]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'AppSecret'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Disable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表ID（可作为分类的标识）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表，表示一个全集，比如：男、女、未知。关联的分类类型表示按什么进行的分类，如：按照性别对人类对象集进行分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程实例模板Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'InstanceSchemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实例编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CustomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前节点类型（0会签节点）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前一个ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'PreviousId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'DbName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单中的控件属性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmContentData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单控件位置模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmContentParse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FlowLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实例备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'MakerList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流流程实例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实例进程Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'InstanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流实例操作记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实例Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'InstanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始节点Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始节点类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束节点Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束节点类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转化状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'TransitionSate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转化时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流实例流转历史记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程内容版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板使用者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeCanUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'FrmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'FrmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板权限类型：0完全公开,1指定部门/人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'AuthorizeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流模板信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单模板Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段个数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Fields'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单中的控件属性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ContentData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单控件位置模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ContentParse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单原html模板未经处理的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Delete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'DbName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主页面URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'矢量图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Vector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOM ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'DomId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素附加属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Attr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素调用脚本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'ModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块元素表(需要权限控制的按钮)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务对照码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义扩展码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CustomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'映射标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'FirstId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'SecondId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多对多关系集中映射' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源所属应用ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属应用名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'AppName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Disable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库/入库' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可见范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Viewable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出入库信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务对照码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CrateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户基本信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User'
GO
