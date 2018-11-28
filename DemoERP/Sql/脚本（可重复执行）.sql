
/****** Object:  Table [dbo].[Myuser]    Script Date: 2018/11/21 14:07:38 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

SET ANSI_PADDING ON;
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Myuser]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN
    CREATE TABLE [dbo].[Myuser]
    (
        [UserGUID] [UNIQUEIDENTIFIER] NOT NULL,
        [IsAdmin] INT NOT NULL DEFAULT(0),  
        [UserCode] [VARCHAR](100) NOT NULL UNIQUE,
        [UserPassword] [VARCHAR](256) NOT NULL,
		Verifycode VARCHAR(10),
		ClassGUID UNIQUEIDENTIFIER,
        UserName VARCHAR(50) NOT NULL,
        Sex VARCHAR(20),
        Birthday DATETIME,
        UserNo INT, --ѧ��
        Hobby VARCHAR(500),
		IsForbidden INT NOT NULL DEFAULT(0),
		Remember BIT DEFAULT(0)
        PRIMARY KEY CLUSTERED ([UserGUID] ASC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
              ALLOW_PAGE_LOCKS = ON
             ) ON [PRIMARY]
    ) ON [PRIMARY];
END;
GO


TRUNCATE TABLE dbo.Myuser;
GO

INSERT INTO [dbo].[Myuser]
(
    [UserGUID],
    [IsAdmin],
    [UserCode],
    [UserPassword],
	UserName
)
VALUES
('b48f127c-3f12-40b8-923e-ba0da9657244', 1, 'admin', 'vqwGhTKTO6Gv7z/wKAz2gTMbU3fXHbpzwCqp6SWeYdc=','Ժϵ����Ա');
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[MyTaskwake]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE MyTaskwake
    (
        MyTaskwakeGUID UNIQUEIDENTIFIER PRIMARY KEY,
        TaskwakeDetail VARCHAR(2000)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Course]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE Course
    (
        CourseGUID UNIQUEIDENTIFIER PRIMARY KEY,
        CoureseName VARCHAR(50),
		IfNecessary BIT,
		CourseDate bit
    );

END;
GO
TRUNCATE TABLE dbo.Course;
GO

INSERT INTO dbo.Course
(
    CourseGUID,
    CoureseName,
    IfNecessary,
	CourseDate
)
VALUES
(   NEWID(), -- CourseGUID - uniqueidentifier
    '��ѧ����',  -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	2
    ),
(   NEWID(), -- CourseGUID - uniqueidentifier
    '�ߵ���ѧ',  -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	1
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    '��ɢ��ѧ',  -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	5
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    '���Դ���',  -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	7
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    '������',   -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	5
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    'C����',   -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	6
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    'JAVA',  -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	4
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    'C#',    -- CoureseName - varchar(50)
    1,        -- IfNecessary - bit
	3
),
(   NEWID(), -- CourseGUID - uniqueidentifier
    'Ӣ��',    -- CoureseName - varchar(50)
    0 ,       -- IfNecessary - bit
	2
);


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[StuCourse]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE StuCourse
    (
        StuCourseGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		CourseGUID UNIQUEIDENTIFIER
    );

END;
GO



IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Class]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE Class
    (
        ClassGUID UNIQUEIDENTIFIER PRIMARY KEY,
		ClassName VARCHAR(50)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[MyFile]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE MyFile
    (
        MyFileGUID UNIQUEIDENTIFIER PRIMARY KEY,
		FileName VARCHAR(200),
		Location VARCHAR(500)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[StuScore]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE StuScore
    (
        StuScoreGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		CourseGUID UNIQUEIDENTIFIER,
		Score DECIMAL(3,1)
    );

END;
GO



IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[StudyCondition]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE StudyCondition
    (
        StudyConditionGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		Condition VARCHAR(50)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[PrizeCondition]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE PrizeCondition
    (
        PrizeConditionGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		Condition VARCHAR(50)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[PartyCondition]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE PartyCondition
    (
        PartyConditionGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		Condition VARCHAR(50)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[SuperviseInfo]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE SuperviseInfo
    (
        SuperviseInfoGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		Condition VARCHAR(500)
    );

END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[JobAndPractice]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE JobAndPractice
    (
        JobAndPracticeGUID UNIQUEIDENTIFIER PRIMARY KEY,
		UserGUID UNIQUEIDENTIFIER,
		Condition VARCHAR(500)
    );

END;
GO



IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Instructor]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE Instructor
    (
        InstructorGUID UNIQUEIDENTIFIER PRIMARY KEY,
		InstructorName UNIQUEIDENTIFIER,
        Sex VARCHAR(20),
        Birthday DATETIME,
		Hobby VARCHAR(500)
    );

END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Station]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE Station
    (
        StationGUID UNIQUEIDENTIFIER PRIMARY KEY,
		StationName VARCHAR(200),
		StationCode VARCHAR(50)
    );
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[StationUser]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE StationUser
    (
        StationUserGUID UNIQUEIDENTIFIER PRIMARY KEY,
		StationGUID UNIQUEIDENTIFIER NOT NULL,
		StationCode VARCHAR(50) NOT NULL,
		UserGUID UNIQUEIDENTIFIER NOT NULL,
		UserCode VARCHAR(100) NOT NULL
    );
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[SystemRight]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

    CREATE TABLE SystemRight
    (
        RightGUID UNIQUEIDENTIFIER PRIMARY KEY,
		RightName VARCHAR(100),
		RightCode VARCHAR(50) NOT NULL,
		ParentCode VARCHAR(50) NOT NULL,
		Sort INT
    );
END;
GO


/****** Object:  Table [dbo].[System_Menu]    Script Date: 2018/11/21 15:08:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[SystemMenu]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

CREATE TABLE [dbo].[SystemMenu]
(
	[SystemMenuGUID] UNIQUEIDENTIFIER NOT NULL,
	SystemMenuCode VARCHAR(50) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	URL VARCHAR(255) NOT NULL,
	[NavigateUrl] [varchar](255) NOT NULL,
	[Target] [varchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[ParentMenuCode] VARCHAR(50) NOT NULL,
	[CssClass] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SystemMenu] PRIMARY KEY CLUSTERED 
(
	[SystemMenuGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END 
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[System_RightMenu]    Script Date: 2018/11/21 15:09:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[RightMenu]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN


CREATE TABLE [dbo].[RightMenu](
	[RightMenuGUID] UNIQUEIDENTIFIER NOT NULL,
	[RightGUID] UNIQUEIDENTIFIER NOT NULL,
	[SystemMenuGUID] UNIQUEIDENTIFIER NOT NULL,
 CONSTRAINT [PK_SystemRightMenu] PRIMARY KEY CLUSTERED 
(
	[RightMenuGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO




/****** Object:  Table [dbo].[SystemStationRight]    Script Date: 2018/11/21 15:10:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[StationRight]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
BEGIN

CREATE TABLE [dbo].[StationRight](
	[StationRightGUID] UNIQUEIDENTIFIER,
	[StationGUID] UNIQUEIDENTIFIER NOT NULL,
	StationCode VARCHAR(50) NOT NULL,
	[RightGUID] UNIQUEIDENTIFIER NOT NULL,
 CONSTRAINT [PK_StationRight] PRIMARY KEY CLUSTERED 
(
	[StationRightGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO



-------------------------------------������Ȩ������ begin��-----------------------------------

TRUNCATE TABLE dbo.Station;
TRUNCATE TABLE dbo.SystemMenu;
TRUNCATE TABLE dbo.RightMenu;
TRUNCATE TABLE dbo.StationRight;
TRUNCATE TABLE dbo.StationUser;
TRUNCATE TABLE dbo.SystemRight;
GO

DECLARE @StationGUID1 UNIQUEIDENTIFIER=NEWID(),--ѧ��
@StationGUID2 UNIQUEIDENTIFIER=NEWID(),--����Ա
@StationGUID3 UNIQUEIDENTIFIER=NEWID()--����Ա
INSERT INTO dbo.Station
(
    StationGUID,
    StationName,
    StationCode
)
VALUES
(   @StationGUID1, -- StationGUID - uniqueidentifier
    'ѧ��',          -- StationName - varchar(200)
    'Student'      -- StationCode - varchar(50)
    ),
(   @StationGUID2, -- StationGUID - uniqueidentifier
    '����Ա',         -- StationName - varchar(200)
    'Tutor'        -- StationCode - varchar(50)
),
(   @StationGUID3, -- StationGUID - uniqueidentifier
    'Ժϵ����Ա',       -- StationName - varchar(200)
    'CollegeAdmin'        -- StationCode - varchar(50)
);

INSERT INTO dbo.StationUser
(
    StationUserGUID,
    StationGUID,
    StationCode,
    UserGUID,
    UserCode
)
SELECT NEWID(),       -- StationUserGUID - uniqueidentifier
       @StationGUID3, -- StationGUID - uniqueidentifier
       'CollegeAdmin',       -- StationCode - varchar(50)
       UserGUID,      -- UserGUID - uniqueidentifier
       UserCode       -- UserCode - varchar(100)

FROM dbo.Myuser
WHERE UserCode = 'Admin';

----------------��ģ��һ��----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'BaseDataManage', -- SystemMenuCode - varchar(50)
    '�������ݹ���',         -- MenuName - varchar(50)
	'',				  -- URL - varchar(255)	
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
(   NEWID(),                       -- SystemMenuGUID - uniqueidentifier
    'ClassManage',                 -- SystemMenuCode - varchar(50)
    '�༶����',                        -- MenuName - varchar(50)
	'javascript:addTab(''ClassManage'',''�༶����'', ''BaseDataManage/ClassManage'')',				  -- URL - varchar(255)	
    '/BaseDataManage/ClassManage', -- NavigateUrl - varchar(255)
    '',                            -- Target - varchar(50)
    1,                             -- Sort - int
    'BaseDataManage',              -- ParentMenuCode - varchar(50)
    ''                             -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'StuManage',                 -- SystemMenuCode - varchar(50)
    'ѧ������',                      -- MenuName - varchar(50)
	'javascript:addTab(''StuManage'',''ѧ������'', ''BaseDataManage/StuManage'')',
    '/BaseDataManage/StuManage', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    2,                           -- Sort - int
    'BaseDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
);
-------------��ģ��һ��----------


----------------��ģ�����----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'PaticularDataManage', -- SystemMenuCode - varchar(50)
    'ר�����ݹ���',         -- MenuName - varchar(50)
	'',				  -- URL - varchar(255)	
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
(   NEWID(),                       -- SystemMenuGUID - uniqueidentifier
    'ColligateTestSerch',                 -- SystemMenuCode - varchar(50)
    '�ۺϲ�����ѯ',                        -- MenuName - varchar(50)
	'javascript:addTab(''ColligateTestSerch'',''�ۺϲ�����ѯ'', ''PaticularDataManage/ColligateTestSerch'')',
    '/PaticularDataManage/ColligateTestSerch', -- NavigateUrl - varchar(255)
    '',                            -- Target - varchar(50)
    1,                             -- Sort - int
    'PaticularDataManage',              -- ParentMenuCode - varchar(50)
    ''                             -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'StudyCondition',                 -- SystemMenuCode - varchar(50)
    'ѧϰ���',                      -- MenuName - varchar(50)
	'javascript:addTab(''StudyCondition'',''ѧϰ���'', ''PaticularDataManage/StudyCondition'')',
    '/PaticularDataManage/StudyCondition', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    2,                           -- Sort - int
    'PaticularDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'PrizeCondition',                 -- SystemMenuCode - varchar(50)
    '�����',                      -- MenuName - varchar(50)
	'javascript:addTab(''PrizeCondition'',''�����'', ''PaticularDataManage/PrizeCondition'')',
    '/PaticularDataManage/PrizeCondition', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    3,                           -- Sort - int
    'PaticularDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'PartyCondition',                 -- SystemMenuCode - varchar(50)
    '������Ϣ',                      -- MenuName - varchar(50)
	'javascript:addTab(''PartyCondition'',''������Ϣ'', ''PaticularDataManage/PartyCondition'')',
    '/PaticularDataManage/PartyCondition', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    4,                           -- Sort - int
    'PaticularDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'SuperviseManage',                 -- SystemMenuCode - varchar(50)
    '�ͼ����',                      -- MenuName - varchar(50)
	'javascript:addTab(''SuperviseManage'',''�ͼ����'', ''PaticularDataManage/SuperviseManage'')',
    '/PaticularDataManage/SuperviseManage', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    5,                           -- Sort - int
    'PaticularDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
),
(   NEWID(),                     -- SystemMenuGUID - uniqueidentifier
    'JobAndPractice',                 -- SystemMenuCode - varchar(50)
    '��ҵʵ��',                      -- MenuName - varchar(50)
	'javascript:addTab(''JobAndPractice'',''��ҵʵ��'', ''PaticularDataManage/JobAndPractice'')',
    '/PaticularDataManage/JobAndPractice', -- NavigateUrl - varchar(255)
    '',                          -- Target - varchar(50)
    6,                           -- Sort - int
    'PaticularDataManage',            -- ParentMenuCode - varchar(50)
    ''                           -- CssClass - varchar(50)
);
-------------��ģ�����----------


----------------��ģ������----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'TaskwakeManage', -- SystemMenuCode - varchar(50)
    '֪ͨ�¼�����',         -- MenuName - varchar(50)
	'',				  -- URL - varchar(255)	
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
(   NEWID(),                       -- SystemMenuGUID - uniqueidentifier
    'TaskwakeDetail',                 -- SystemMenuCode - varchar(50)
    '֪ͨ��ѯ',                        -- MenuName - varchar(50)
	'javascript:addTab(''TaskwakeDetail'',''֪ͨ��ѯ'', ''TaskwakeManage/TaskwakeDetail'')',
    '/TaskwakeManage/TaskwakeDetail', -- NavigateUrl - varchar(255)
    '',                            -- Target - varchar(50)
    1,                             -- Sort - int
    'TaskwakeManage',              -- ParentMenuCode - varchar(50)
    ''                             -- CssClass - varchar(50)
);
-------------��ģ������----------




----------------��ģ���ġ�----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'InfoManage', -- SystemMenuCode - varchar(50)
    '��Ϣ����',         -- MenuName - varchar(50)
	'',				  -- URL - varchar(255)	
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
(   NEWID(),                       -- SystemMenuGUID - uniqueidentifier
    'PersonalInfo',                 -- SystemMenuCode - varchar(50)
    '������Ϣ',                        -- MenuName - varchar(50)
	'javascript:addTab(''PersonalInfo'',''������Ϣ'', ''InfoManage/PersonalInfo'')',
    '/InfoManage/PersonalInfo', -- NavigateUrl - varchar(255)
    '',                            -- Target - varchar(50)
    1,                             -- Sort - int
    'InfoManage',              -- ParentMenuCode - varchar(50)
    ''                             -- CssClass - varchar(50)
),
(   NEWID(),                       -- SystemMenuGUID - uniqueidentifier
    'TaskwakeSer',                 -- SystemMenuCode - varchar(50)
    '֪ͨ��ѯ',                        -- MenuName - varchar(50)
	'javascript:addTab(''TaskwakeSer'',''֪ͨ��ѯ'', ''InfoManage/TaskwakeSer'')',
    '/InfoManage/TaskwakeSer', -- NavigateUrl - varchar(255)
    '',                            -- Target - varchar(50)
    2,                             -- Sort - int
    'InfoManage',              -- ParentMenuCode - varchar(50)
    ''                             -- CssClass - varchar(50)
);
-------------��ģ���ġ�----------




----------------��ģ���ġ�----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'CoureseManage', -- SystemMenuCode - varchar(50)
    '�γ̹���',         -- MenuName - varchar(50)
	'',
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
	(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'CoureseManageDetail', -- SystemMenuCode - varchar(50)
    '�γ̹���',         -- MenuName - varchar(50)
	'javascript:addTab(''CoureseManageDetail'',''�γ̹���'', ''CoureseManage/CoureseManageDetail'')',
    '/CoureseManage/CoureseManageDetail',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    1,                -- Sort - int
    'CoureseManage',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    );
-------------��ģ���ġ�----------


----------------��ģ���塷----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'DataDownload', -- SystemMenuCode - varchar(50)
    '��������',         -- MenuName - varchar(50)
	'',
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
	(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'DataDownloadDetail', -- SystemMenuCode - varchar(50)
    '��������',         -- MenuName - varchar(50)
	'javascript:addTab(''DataDownload'',''��������'', ''DataDownload/DataDownloadDetail'')',
    '/DataDownload/DataDownloadDetail',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    1,                -- Sort - int
    'DataDownload',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    );
-------------��ģ���塷----------




----------------��ģ������----------
INSERT INTO dbo.SystemMenu
(
    SystemMenuGUID,
    SystemMenuCode,
    MenuName,
    NavigateUrl,
	URL,
    Target,
    Sort,
    ParentMenuCode,
    CssClass
)
VALUES
(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'TutorManage', -- SystemMenuCode - varchar(50)
    '����Ա����',         -- MenuName - varchar(50)
	'',
    '',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    0,                -- Sort - int
    '0',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    ),
	(   NEWID(),          -- SystemMenuGUID - uniqueidentifier
    'TutorManageDetail', -- SystemMenuCode - varchar(50)
    '����Ա����',         -- MenuName - varchar(50)
	'javascript:addTab(''TutorManageDetail'',''����Ա����'', ''InfoManage/PersonalInfo'')',
    '/InfoManage/PersonalInfo',               -- NavigateUrl - varchar(255)
    '',               -- Target - varchar(50)
    1,                -- Sort - int
    'TutorManage',              -- ParentMenuCode - varchar(50)
    ''                -- CssClass - varchar(50)
    );
-------------��ģ������----------


INSERT INTO dbo.SystemRight
(
    RightGUID,
    RightName,
    RightCode,
    ParentCode,
    Sort
)
SELECT 
   NEWID(), -- RightGUID - uniqueidentifier
    MenuName,   -- RightName - varchar(100)
    SystemMenuCode,   -- RightCode - varchar(50)
    ParentMenuCode,   -- ParentCode - varchar(50)
    Sort     -- Sort - int
  FROM SystemMenu 
  WHERE NavigateUrl = '';


DECLARE @RightCode VARCHAR(50),
        @ParentCode VARCHAR(50);

SELECT *
INTO #tempTable
FROM dbo.SystemMenu
WHERE NavigateUrl <> '';

WHILE EXISTS (SELECT 1 FROM #tempTable)
BEGIN
    SELECT TOP 1
           @RightCode = SystemMenuCode,
           @ParentCode = ParentMenuCode
    FROM #tempTable;
    INSERT INTO dbo.SystemRight
    (
        RightGUID,
        RightName,
        RightCode,
        ParentCode,
        Sort
    )
    VALUES
    (   NEWID(),                -- RightGUID - uniqueidentifier
        '��ѯ',                   -- RightName - varchar(100)
        @RightCode, -- RightCode - varchar(50)
        @ParentCode,            -- ParentCode - varchar(50)
        1                       -- Sort - int
        ),
    (   NEWID(),             -- RightGUID - uniqueidentifier
        '����',                -- RightName - varchar(100)
        @RightCode + '_Add', -- RightCode - varchar(50)
        @ParentCode,         -- ParentCode - varchar(50)
        1                    -- Sort - int
    ),
    (   NEWID(),                -- RightGUID - uniqueidentifier
        '�޸�',                   -- RightName - varchar(100)
        @RightCode + '_Modify', -- RightCode - varchar(50)
        @ParentCode,            -- ParentCode - varchar(50)
        1                       -- Sort - int
    ),
    (   NEWID(),             -- RightGUID - uniqueidentifier
        'ɾ��',                -- RightName - varchar(100)
        @RightCode + '_Del', -- RightCode - varchar(50)
        @ParentCode,         -- ParentCode - varchar(50)
        1                    -- Sort - int
    );
	DELETE FROM #tempTable WHERE SystemMenuCode=@RightCode;
END;

DROP TABLE #tempTable

INSERT INTO dbo.SystemRight
(
    RightGUID,
    RightName,
    RightCode,
    ParentCode,
    Sort
)
VALUES
(   NEWID(), -- RightGUID - uniqueidentifier
    '�ļ�����',   -- RightName - varchar(100)
    'FileManage',   -- RightCode - varchar(50)
    'StuManage',   -- ParentCode - varchar(50)
    1     -- Sort - int
    );

INSERT INTO dbo.RightMenu
(
    RightMenuGUID,
    RightGUID,
    SystemMenuGUID
)
SELECT NEWID(),         -- RightMenuGUID - uniqueidentifier
       RightGUID,       -- RightGUID - uniqueidentifier
       b.SystemMenuGUID -- SystemMenuGUID - uniqueidentifier
FROM dbo.SystemRight a
    INNER JOIN dbo.SystemMenu b
        ON a.RightCode = b.SystemMenuCode;


INSERT INTO dbo.StationRight
(
    StationRightGUID,
    StationGUID,
    StationCode,
    RightGUID
)
SELECT NEWID(),       -- StationRightGUID - uniqueidentifier
       @StationGUID1, -- StationGUID - uniqueidentifier
       'Student',     -- StationCode - varchar(50)
       RightGUID      -- RightGUID - uniqueidentifier
FROM dbo.SystemRight
WHERE RightCode IN ( 'InfoManage', 'PersonalInfo', 'PersonalInfo', 'PersonalInfo_Modify', 'TaskwakeSer',
                     'CoureseManage', 'CoureseManage_Add', 'CoureseManage_Del', 'CoureseManage_Modify', 'DataDownload'
                   );


INSERT INTO dbo.StationRight
(
    StationRightGUID,
    StationGUID,
    StationCode,
    RightGUID
)
SELECT NEWID(),       -- StationRightGUID - uniqueidentifier
       @StationGUID2, -- StationGUID - uniqueidentifier
       'Tutor',       -- StationCode - varchar(50)
       RightGUID      -- RightGUID - uniqueidentifier
FROM dbo.SystemRight
WHERE RightCode IN ( 'BaseDataManage', 'ClassManage', 'StuManage', 'StuManage_Add', 'FileManage',
                     'CoureseManage', 'PaticularDataManage', 'ColligateTestSerch', 'ColligateTestSerch_Modify', 'StudyCondition',
					 'StudyCondition_Modify','PrizeCondition','PrizeCondition_Modify','PartyCondition','PartyCondition_Modify',
					 'SuperviseManage','SuperviseManage_Modify','JobAndPractice','JobAndPractice_Modify',
					 'TaskwakeManage','TaskwakeDetail','TaskwakeDetail_Add','TaskwakeDetail_Modify'
                   );


INSERT INTO dbo.StationRight
(
    StationRightGUID,
    StationGUID,
    StationCode,
    RightGUID
)
SELECT NEWID(),       -- StationRightGUID - uniqueidentifier
       @StationGUID3, -- StationGUID - uniqueidentifier
       'CollegeAdmin',       -- StationCode - varchar(50)
       RightGUID      -- RightGUID - uniqueidentifier
FROM dbo.SystemRight
WHERE RightCode IN ( 'TutorManage', 'TutorManage_Add', 'TutorManage_Modify', 'BaseDataManage', 'ClassManage',
                     'ClassManage_Add', 'StuManage', 'StuManage_Add', 'FileManage', 'CoureseManage',
					 'CoureseManage_Add','TaskwakeManage','TaskwakeDetail','TaskwakeDetail_Add','TaskwakeDetail_Del','TaskwakeDetail_Modify'
                   );
GO
-------------------------------------������Ȩ������ end��-----------------------------------

IF EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Sp_UserRight]')
          AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)
    DROP PROCEDURE Sp_UserRight;
GO


CREATE PROC Sp_UserRight
    @Options VARCHAR(100),
    @UserGUID UNIQUEIDENTIFIER=NULL,
    @UserCode VARCHAR(50)=NULL
AS
BEGIN

    IF @Options = 'GetAllUserRight'
    BEGIN
        SELECT Url = URL,
               STU.UserCode
        FROM dbo.StationUser STU
            INNER JOIN dbo.StationRight SR
                ON SR.StationGUID = STU.StationGUID
            INNER JOIN dbo.RightMenu RM
                ON RM.RightGUID = SR.RightGUID
            INNER JOIN dbo.SystemMenu
                ON SystemMenu.SystemMenuGUID = RM.SystemMenuGUID
        WHERE NavigateUrl <> '';
    END;
END;
GO


IF EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[SpMenu]')
          AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)
    DROP PROCEDURE SpMenu;
GO



CREATE PROCEDURE [SpMenu]
						@Options VarChar(100),
						@UserGUID uniqueidentifier=Null,		
						@GUID UNIQUEIDENTIFIER=Null,
						@RightGUID UNIQUEIDENTIFIER=Null,
						@GroupTypeId Int=Null
 AS
/*���ݲ˵�ID��ȡ�˵�����*/
IF @Options = 'GetMenuViewByGUID'
BEGIN
    SELECT SM.SystemMenuGUID,
           SM.SystemMenuCode,
           SM.MenuName,
           SM.NavigateUrl,
           SM.Target,
           SM.Sort,
           SM.ParentMenuCode,
           SM.CssClass
    FROM dbo.SystemMenu (NOLOCK) SM
    WHERE SM.SystemMenuGUID = @GUID;
END;
 
/*����Ȩ��ID��ò˵��б����β˵���*/
IF @Options = 'GetMenuList'
BEGIN
    SELECT SM.SystemMenuGUID,
           SM.SystemMenuCode,
           SM.MenuName,
           SM.NavigateUrl,
           SM.Target,
           SM.Sort,
           SM.ParentMenuCode,
           SM.CssClass
    FROM dbo.SystemMenu (NOLOCK) SM
    ORDER BY SM.Sort DESC,
             SM.SystemMenuGUID;
END;

 
/*����Ȩ��ID��ò˵��б����β˵���*/
If @Options='GetMenuListByRightGUID' Begin
		SELECT  SM.SystemMenuGUID, 
					sm.SystemMenuCode,
					SM.MenuName, 
					SM.NavigateUrl, 
      				SM.Target, 
					SM.Sort,
					SM.ParentMenuCode,
					RM.RightMenuGUID
		FROM dbo.SystemMenu(nolock) SM 
		INNER JOIN dbo.RightMenu(nolock) RM ON SM.SystemMenuGUID=RM.SystemMenuGUID AND RM.RightGUID=@RightGUID
	Order by SM.Sort Desc,SM.SystemMenuGUID
End

/*����Ա��ID�˵�����*/
If @Options='GetMenuListByUserGUID' Begin
		SELECT DISTINCT 	
					SM.SystemMenuGUID, 
					sm.SystemMenuCode,
					SM.MenuName, 
					SM.NavigateUrl, 
      				SM.Target, 
					SM.Sort,
					SM.ParentMenuCode,
					SM.CssClass
		FROM dbo.SystemMenu(nolock) SM 
		INNER JOIN dbo.RightMenu(nolock) RM ON SM.SystemMenuGUID=RM.SystemMenuGUID
		INNER JOIN dbo.StationRight(nolock) SR ON SR.RightGUID = RM.RightGUID
		Inner Join dbo.StationUser(NOLOCK) SU ON SU.StationGUID = SR.StationGUID
		Where SU.UserGUID=@UserGUID
		ORDER BY SM.Sort DESC, SM.SystemMenuGUID
End
GO








