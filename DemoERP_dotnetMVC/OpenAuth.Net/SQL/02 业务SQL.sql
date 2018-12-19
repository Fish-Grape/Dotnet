
-----列是否存在
IF COL_LENGTH('User', 'UnitBelongTo') IS NULL
    ALTER TABLE dbo.[User] ADD UnitBelongTo VARCHAR(50);
GO
-----列是否存在
IF COL_LENGTH('User', 'AdminPower') IS NULL
    ALTER TABLE dbo.[User] ADD AdminPower VARCHAR(50);
GO

-----列是否存在
IF COL_LENGTH('User', 'QueryPower') IS NULL
    ALTER TABLE dbo.[User] ADD QueryPower VARCHAR(50);
GO

-----列是否存在
IF COL_LENGTH('User', 'WarehousePower') IS NULL
    ALTER TABLE dbo.[User] ADD WarehousePower VARCHAR(50);
GO




-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Textbook]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Textbook
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        TextbookName VARCHAR(50),
        OutputName VARCHAR(50),
        Author VARCHAR(50),
        MajorFor VARCHAR(50),
        BookUnit VARCHAR(50),
        TextbookNum INT,
        Remarks VARCHAR(50),
        FRIDNum VARCHAR(50),
        ForClass VARCHAR(50)
    );
GO



-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Class]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Class
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        ClassNick INT,
        ClassName VARCHAR(50),
        GetinDate DATETIME,
        Department VARCHAR(50),
        Major VARCHAR(50),
        Monitor VARCHAR(50),
        MonitorGUID UNIQUEIDENTIFIER,
        SummaryStus INT,
        Tutor VARCHAR(50),
		ClassNum INT
    );
GO



-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Teacher]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Teacher
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        TeacherNum INT,
        TeacherName VARCHAR(50),
        Gender VARCHAR(50),
        Department VARCHAR(50)
    );
GO



-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Provider]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Provider
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        ProviderNum INT,
        ProviderName VARCHAR(50),
        Address VARCHAR(50),
        Telephone VARCHAR(50)
    );
GO



-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Orders]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Orders
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        TextbookName VARCHAR(50),
        OutputName VARCHAR(50),
        Author VARCHAR(50),
        MajorFor VARCHAR(50),
        BookUnit VARCHAR(50),
        CreateBy VARCHAR(50),
        TextbookNum INT,
        Remarks VARCHAR(50),
        OrderDate DATETIME,
        FRIDNum VARCHAR(50),
        ForClass VARCHAR(50)
    );
GO



-- 判断要创建的表名是否存在
IF NOT EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[Inventory]')
          AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)
    CREATE TABLE Inventory
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY,
        TextbookName VARCHAR(50),
        OutputName VARCHAR(50),
        Author VARCHAR(50),
        MajorFor VARCHAR(50),
        BookUnit VARCHAR(50),
        TextbookNum INT,
        Remarks VARCHAR(50),
        GetInDate DATETIME,
        GetOutDate DATETIME,
        BookDate DATETIME,
        FRIDNum VARCHAR(50),
        ReceivedBy VARCHAR(50)
    );
GO



------------------------------------------------新增部门数据【begin】-------------------

DELETE [dbo].[User]
FROM [dbo].[User] AS j0
    INNER JOIN
    (
        SELECT 1 AS [C1],
               [Extent1].[Id] AS [Id]
        FROM [dbo].[User] AS [Extent1]
        WHERE [Extent1].[Id] IN ( N'6ba79766-faa0-4259-8139-a4a6d35784e0', N'de8be521-f1ec-4483-b124-0be342890507',
                                  N'229f3a49-ab27-49ce-b383-9f10ca23a9d5', N'1df68dfd-3b6d-4491-872f-00a0fc6c5a64',
                                  N'0ceff0f8-f848-440c-bc26-d8605ac858cd'
                                )
    ) AS j1
        ON (j0.[Id] = j1.[Id]);
GO

EXEC sp_executesql N'DELETE [dbo].[Org]
FROM [dbo].[Org] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Org] AS [Extent1]
    WHERE [Extent1].[CascadeId] LIKE @p__linq__0 ESCAPE N''~''
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(9)',
@p__linq__0 = N'%.0.2.1.%';
GO


EXEC sp_executesql N'DELETE [dbo].[Org]
FROM [dbo].[Org] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Org] AS [Extent1]
    WHERE [Extent1].[CascadeId] LIKE @p__linq__0 ESCAPE N''~''
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(11)',
@p__linq__0 = N'%.0.1.3.1.%';
GO
EXEC sp_executesql N'DELETE [dbo].[Org]
FROM [dbo].[Org] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Org] AS [Extent1]
    WHERE [Extent1].[CascadeId] LIKE @p__linq__0 ESCAPE N''~''
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'%.0.1.%';
GO
EXEC sp_executesql N'DELETE [dbo].[Org]
FROM [dbo].[Org] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Org] AS [Extent1]
    WHERE [Extent1].[CascadeId] LIKE @p__linq__0 ESCAPE N''~''
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(9)',
@p__linq__0 = N'%.0.1.3.%';
GO

DELETE FROM org WHERE id='b47c8c2c-6463-4158-9044-9677889ad8bb'
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'b47c8c2c-6463-4158-9044-9677889ad8bb',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:48:31.3060300',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.1.',
@15 = N'电子与自动化系';
GO

DELETE FROM dbo.Org
WHERE Id = '666ed2bf-c13b-4e56-a0f1-3299b269fa8b';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'666ed2bf-c13b-4e56-a0f1-3299b269fa8b',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:52:20.0490310',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'b47c8c2c-6463-4158-9044-9677889ad8bb',
@14 = N'电子与自动化系',
@15 = N'.0.1.1.',
@16 = N'电子科学与技术';
GO


DELETE FROM dbo.Org
WHERE Id = '9c28b2fb-731e-482a-a182-9e7a80bf7221';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'9c28b2fb-731e-482a-a182-9e7a80bf7221',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:53:24.3578314',
@9 = 0,
@10 = 2,
@11 = N'',
@12 = N'',
@13 = N'b47c8c2c-6463-4158-9044-9677889ad8bb',
@14 = N'电子与自动化系',
@15 = N'.0.1.2.',
@16 = N'物流工程';
GO

DELETE FROM dbo.Org
WHERE Id = '01e9b788-4c6f-4af6-995a-c3c07b815763';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'01e9b788-4c6f-4af6-995a-c3c07b815763',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:54:08.1272316',
@9 = 0,
@10 = 3,
@11 = N'',
@12 = N'',
@13 = N'b47c8c2c-6463-4158-9044-9677889ad8bb',
@14 = N'电子与自动化系',
@15 = N'.0.1.3.',
@16 = N'机械电子工程';
GO


DELETE FROM dbo.Org
WHERE Id = '0140de66-ae16-43f6-ba00-2dd1d7673971';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'0140de66-ae16-43f6-ba00-2dd1d7673971',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:55:31.8774320',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.2.',
@15 = N'艺术与传媒学院';
GO

DELETE FROM dbo.Org
WHERE Id = 'a8e64fd3-4175-44cc-af58-808941c209bf';
GO


EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'a8e64fd3-4175-44cc-af58-808941c209bf',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:56:24.9990322',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'0140de66-ae16-43f6-ba00-2dd1d7673971',
@14 = N'艺术与传媒学院',
@15 = N'.0.2.1.',
@16 = N'数字媒体技术';
GO

DELETE FROM dbo.Org
WHERE Id = '00f14a66-e135-46be-9fb8-722c7d4d6852';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'00f14a66-e135-46be-9fb8-722c7d4d6852',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:57:07.4490325',
@9 = 0,
@10 = 2,
@11 = N'',
@12 = N'',
@13 = N'0140de66-ae16-43f6-ba00-2dd1d7673971',
@14 = N'艺术与传媒学院',
@15 = N'.0.2.2.',
@16 = N'数字媒体艺术';
GO



DELETE FROM dbo.Org
WHERE Id = '389dd41f-5184-4a6e-8cd3-c20ea0fa2d08';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'389dd41f-5184-4a6e-8cd3-c20ea0fa2d08',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:57:45.0236327',
@9 = 0,
@10 = 3,
@11 = N'',
@12 = N'',
@13 = N'0140de66-ae16-43f6-ba00-2dd1d7673971',
@14 = N'艺术与传媒学院',
@15 = N'.0.2.3.',
@16 = N'传播学';
GO


DELETE FROM dbo.Org
WHERE Id = 'b161815e-1ddb-484d-bfda-7bbfd876c8f0';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'b161815e-1ddb-484d-bfda-7bbfd876c8f0',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:58:38.4636329',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.3.',
@15 = N'计算机科学与技术系';
GO


DELETE FROM dbo.Org
WHERE Id = '34f20632-e470-4700-92a1-1ac171e734c7';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'34f20632-e470-4700-92a1-1ac171e734c7',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:59:21.3424331',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'b161815e-1ddb-484d-bfda-7bbfd876c8f0',
@14 = N'计算机科学与技术系',
@15 = N'.0.3.1.',
@16 = N'计算机科学与技术';
GO


DELETE FROM dbo.Org
WHERE Id = 'b5616fd1-bd71-4a7f-8feb-e21c36410cee';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'b5616fd1-bd71-4a7f-8feb-e21c36410cee',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 11:59:58.8932333',
@9 = 0,
@10 = 2,
@11 = N'',
@12 = N'',
@13 = N'b161815e-1ddb-484d-bfda-7bbfd876c8f0',
@14 = N'计算机科学与技术系',
@15 = N'.0.3.2.',
@16 = N'软件工程';
GO


DELETE FROM dbo.Org
WHERE Id = '04d40ec5-b93a-407a-b0e9-907a21adc407';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'04d40ec5-b93a-407a-b0e9-907a21adc407',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 12:00:40.0636335',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.4.',
@15 = N'经济管理系';
GO

DELETE FROM dbo.Org
WHERE Id = 'd2da3089-bf58-403d-9981-35df65350fc9';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'd2da3089-bf58-403d-9981-35df65350fc9',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:13:04.7276609',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'04d40ec5-b93a-407a-b0e9-907a21adc407',
@14 = N'经济管理系',
@15 = N'.0.4.1.',
@16 = N'市场营销';
GO


DELETE FROM dbo.Org
WHERE Id = 'e2c7c2cb-22c1-4a2c-ad89-57a847465677';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'e2c7c2cb-22c1-4a2c-ad89-57a847465677',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:13:53.7956609',
@9 = 0,
@10 = 2,
@11 = N'',
@12 = N'',
@13 = N'04d40ec5-b93a-407a-b0e9-907a21adc407',
@14 = N'经济管理系',
@15 = N'.0.4.2.',
@16 = N'电子商务';
GO



DELETE FROM dbo.Org
WHERE Id = 'c688d6ab-dcd6-4123-94a4-f16bd2adb3c5';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'c688d6ab-dcd6-4123-94a4-f16bd2adb3c5',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:14:43.9076609',
@9 = 0,
@10 = 3,
@11 = N'',
@12 = N'',
@13 = N'04d40ec5-b93a-407a-b0e9-907a21adc407',
@14 = N'经济管理系',
@15 = N'.0.4.3.',
@16 = N'财务管理';
GO


DELETE FROM dbo.Org
WHERE Id = 'e260d7f2-868b-4e1a-b987-0ec55d0e74f3';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'e260d7f2-868b-4e1a-b987-0ec55d0e74f3',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:15:19.9486609',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.5.',
@15 = N'通信与信息工程系';
GO



DELETE FROM dbo.Org
WHERE Id = 'b5cffb36-d3c3-4b01-bba4-fc70b5fea8eb';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'b5cffb36-d3c3-4b01-bba4-fc70b5fea8eb',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:15:59.7086609',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'e260d7f2-868b-4e1a-b987-0ec55d0e74f3',
@14 = N'通信与信息工程系',
@15 = N'.0.5.1.',
@16 = N'通信工程';
GO


DELETE FROM dbo.Org
WHERE Id = '0fad7a34-6af0-4dad-8c92-a943502443c1';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'0fad7a34-6af0-4dad-8c92-a943502443c1',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:16:38.2896609',
@9 = 0,
@10 = 2,
@11 = N'',
@12 = N'',
@13 = N'e260d7f2-868b-4e1a-b987-0ec55d0e74f3',
@14 = N'通信与信息工程系',
@15 = N'.0.5.2.',
@16 = N'电子信息工程';
GO


DELETE FROM dbo.Org
WHERE Id = '2a36c10c-5bf6-4d58-9159-5c5cb6f61798';
GO


EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(50),@14 nvarchar(255),@15 nvarchar(255),@16 nvarchar(255)',
@0 = N'2a36c10c-5bf6-4d58-9159-5c5cb6f61798',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:17:08.0626609',
@9 = 0,
@10 = 3,
@11 = N'',
@12 = N'',
@13 = N'e260d7f2-868b-4e1a-b987-0ec55d0e74f3',
@14 = N'通信与信息工程系',
@15 = N'.0.5.3.',
@16 = N'物联网工程';
GO


DELETE FROM dbo.Org
WHERE Id = 'b4045d69-e494-4705-8d8c-a800f95baf04';
GO

EXEC sp_executesql N'INSERT [dbo].[Org]([Id], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [TypeName], [TypeId], [ParentId], [ParentName], [CascadeId], [Name])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, NULL, @13, @14, @15)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 bit,@3 bit,@4 nvarchar(255),@5 int,@6 nvarchar(255),@7 nvarchar(4000),@8 datetime2(7),@9 int,@10 int,@11 nvarchar(20),@12 nvarchar(50),@13 nvarchar(255),@14 nvarchar(255),@15 nvarchar(255)',
@0 = N'b4045d69-e494-4705-8d8c-a800f95baf04',
@1 = N'',
@2 = 0,
@3 = 0,
@4 = N'',
@5 = 0,
@6 = N'',
@7 = N'',
@8 = '2018-12-18 13:17:49.7146609',
@9 = 0,
@10 = 1,
@11 = N'',
@12 = N'',
@13 = N'根节点',
@14 = N'.0.6.',
@15 = N'外语系';
GO
------------------------------------------------新增部门数据【end】-------------------




------------------------------------------------新增角色数据【begin】-------------------

DELETE FROM dbo.Role WHERE Id='b494f517-8a44-47f1-8722-62196a723cde'
GO


EXEC sp_executesql N'INSERT [dbo].[Role]([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId])
VALUES (@0, @1, @2, @3, @4, @5, @6)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 int,@3 datetime2(7),@4 nvarchar(50),@5 nvarchar(20),@6 nvarchar(50)',
@0 = N'b494f517-8a44-47f1-8722-62196a723cde',
@1 = N'管理员',
@2 = 1,
@3 = '2018-12-18 13:24:01.7796609',
@4 = N'',
@5 = N'',
@6 = N'';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''b494f517-8a44-47f1-8722-62196a723cde'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'RoleOrg';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'RoleOrg',
@p__linq__1 = N'b494f517-8a44-47f1-8722-62196a723cde',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';

GO

EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'e66e9a3e-3481-434e-b347-88ebca99fe87',
@1 = N'',
@2 = N'RoleOrg',
@3 = 0,
@4 = '2018-12-18 13:24:01.7966609',
@5 = N'',
@6 = N'b494f517-8a44-47f1-8722-62196a723cde',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO




DELETE FROM dbo.Role WHERE Id='ea9d7a3a-6075-4156-8206-18548f84f89b'
GO

EXEC sp_executesql N'INSERT [dbo].[Role]([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId])
VALUES (@0, @1, @2, @3, @4, @5, @6)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 int,@3 datetime2(7),@4 nvarchar(50),@5 nvarchar(20),@6 nvarchar(50)',
@0 = N'ea9d7a3a-6075-4156-8206-18548f84f89b',
@1 = N'教师',
@2 = 1,
@3 = '2018-12-18 13:29:49.4116609',
@4 = N'',
@5 = N'',
@6 = N'';
GO
EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''ea9d7a3a-6075-4156-8206-18548f84f89b'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'RoleOrg';
GO
EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'RoleOrg',
@p__linq__1 = N'ea9d7a3a-6075-4156-8206-18548f84f89b',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO
EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'a5a1db34-b2c8-4f72-8660-a51247a7b0d6',
@1 = N'',
@2 = N'RoleOrg',
@3 = 0,
@4 = '2018-12-18 13:29:49.4276609',
@5 = N'',
@6 = N'ea9d7a3a-6075-4156-8206-18548f84f89b',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO




DELETE FROM dbo.Role WHERE Id='79d5d872-c2bf-4cb2-8c91-c0e0f044893b'
GO

EXEC sp_executesql N'INSERT [dbo].[Role]([Id], [Name], [Status], [CreateTime], [CreateId], [TypeName], [TypeId])
VALUES (@0, @1, @2, @3, @4, @5, @6)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 int,@3 datetime2(7),@4 nvarchar(50),@5 nvarchar(20),@6 nvarchar(50)',
@0 = N'79d5d872-c2bf-4cb2-8c91-c0e0f044893b',
@1 = N'班长',
@2 = 1,
@3 = '2018-12-18 13:30:54.2676609',
@4 = N'',
@5 = N'',
@6 = N'';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''79d5d872-c2bf-4cb2-8c91-c0e0f044893b'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'RoleOrg';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'RoleOrg',
@p__linq__1 = N'79d5d872-c2bf-4cb2-8c91-c0e0f044893b',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO
EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'0b07d303-f535-4970-aaf5-d93fde5042f5',
@1 = N'',
@2 = N'RoleOrg',
@3 = 0,
@4 = '2018-12-18 13:30:54.2906609',
@5 = N'',
@6 = N'79d5d872-c2bf-4cb2-8c91-c0e0f044893b',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO

------------------------------------------------新增角色数据【end】-------------------







------------------------------------------------新增用户数据【begin】-------------------
DELETE FROM dbo.[User]
WHERE Id = 'd4d7f45f-95d8-434a-92d2-8e574dbf3bae';
GO

EXEC sp_executesql N'INSERT [dbo].[User]([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId], [UnitBelongTo], [AdminPower], [QueryPower], [WarehousePower])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 nvarchar(255),@3 nvarchar(255),@4 int,@5 int,@6 nvarchar(255),@7 datetime2(7),@8 nvarchar(50),@9 nvarchar(20),@10 nvarchar(50),@11 nvarchar(max) ,@12 nvarchar(max) ,@13 nvarchar(max) ,@14 nvarchar(max) ',
@0 = N'd4d7f45f-95d8-434a-92d2-8e574dbf3bae',
@1 = N'Monitor',
@2 = N'Monitor',
@3 = N'班长',
@4 = 1,
@5 = 1,
@6 = N'',
@7 = '2018-12-18 14:35:11.5056609',
@8 = N'',
@9 = N'',
@10 = N'',
@11 = N'',
@12 = N'',
@13 = N'',
@14 = N'';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''d4d7f45f-95d8-434a-92d2-8e574dbf3bae'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'UserOrg';
GO
EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'UserOrg',
@p__linq__1 = N'd4d7f45f-95d8-434a-92d2-8e574dbf3bae',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO
EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'f4331a4b-8cb5-4aae-b378-86c72c845f75',
@1 = N'',
@2 = N'UserOrg',
@3 = 0,
@4 = '2018-12-18 14:35:11.7276609',
@5 = N'',
@6 = N'd4d7f45f-95d8-434a-92d2-8e574dbf3bae',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO





DELETE FROM dbo.[User] WHERE Id='eb496818-66d4-463d-b1fe-e4ae42e289d2'
GO


EXEC sp_executesql N'INSERT [dbo].[User]([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId], [UnitBelongTo], [AdminPower], [QueryPower], [WarehousePower])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 nvarchar(255),@3 nvarchar(255),@4 int,@5 int,@6 nvarchar(255),@7 datetime2(7),@8 nvarchar(50),@9 nvarchar(20),@10 nvarchar(50),@11 nvarchar(max) ,@12 nvarchar(max) ,@13 nvarchar(max) ,@14 nvarchar(max) ',
@0 = N'eb496818-66d4-463d-b1fe-e4ae42e289d2',
@1 = N'Tutor',
@2 = N'Tutor',
@3 = N'导师',
@4 = 1,
@5 = 1,
@6 = N'',
@7 = '2018-12-18 14:37:18.2356609',
@8 = N'',
@9 = N'',
@10 = N'',
@11 = N'',
@12 = N'',
@13 = N'',
@14 = N'';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''eb496818-66d4-463d-b1fe-e4ae42e289d2'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'UserOrg';
GO
EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'UserOrg',
@p__linq__1 = N'eb496818-66d4-463d-b1fe-e4ae42e289d2',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO
EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'6d17760e-96dd-45d9-9f52-5c25c6fd83c4',
@1 = N'',
@2 = N'UserOrg',
@3 = 0,
@4 = '2018-12-18 14:37:18.2546609',
@5 = N'',
@6 = N'eb496818-66d4-463d-b1fe-e4ae42e289d2',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO




DELETE FROM dbo.[User]
WHERE Id = '7e32b891-3a76-4b4e-bc7d-1327c1bb5457';
GO

EXEC sp_executesql N'INSERT [dbo].[User]([Id], [Account], [Password], [Name], [Sex], [Status], [BizCode], [CreateTime], [CrateId], [TypeName], [TypeId], [UnitBelongTo], [AdminPower], [QueryPower], [WarehousePower])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14)
',
N'@0 nvarchar(50),@1 nvarchar(255),@2 nvarchar(255),@3 nvarchar(255),@4 int,@5 int,@6 nvarchar(255),@7 datetime2(7),@8 nvarchar(50),@9 nvarchar(20),@10 nvarchar(50),@11 nvarchar(max) ,@12 nvarchar(max) ,@13 nvarchar(max) ,@14 nvarchar(max) ',
@0 = N'7e32b891-3a76-4b4e-bc7d-1327c1bb5457',
@1 = N'admin',
@2 = N'admin',
@3 = N'管理员',
@4 = 1,
@5 = 1,
@6 = N'',
@7 = '2018-12-19 10:19:56.3180621',
@8 = N'',
@9 = N'',
@10 = N'',
@11 = N'',
@12 = N'',
@13 = N'',
@14 = N'';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[FirstId] IN (N''7e32b891-3a76-4b4e-bc7d-1327c1bb5457'')) AND ([Extent1].[Key] = @p__linq__0)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7)',
@p__linq__0 = N'UserOrg';
GO

EXEC sp_executesql N'DELETE [dbo].[Relevance]
FROM [dbo].[Relevance] AS j0 INNER JOIN (
SELECT 
    1 AS [C1], 
    [Extent1].[Id] AS [Id]
    FROM [dbo].[Relevance] AS [Extent1]
    WHERE ([Extent1].[Key] = @p__linq__0) AND ([Extent1].[FirstId] = @p__linq__1) AND ([Extent1].[SecondId] = @p__linq__2)
) AS j1 ON (j0.[Id] = j1.[Id])',
N'@p__linq__0 nvarchar(7),@p__linq__1 nvarchar(36),@p__linq__2 nvarchar(36)',
@p__linq__0 = N'UserOrg',
@p__linq__1 = N'7e32b891-3a76-4b4e-bc7d-1327c1bb5457',
@p__linq__2 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO

EXEC sp_executesql N'INSERT [dbo].[Relevance]([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId])
VALUES (@0, @1, @2, @3, @4, @5, @6, @7)
',
N'@0 nvarchar(50),@1 nvarchar(100),@2 nvarchar(100),@3 int,@4 datetime2(7),@5 nvarchar(50),@6 nvarchar(50),@7 nvarchar(50)',
@0 = N'be7b8d72-cb4e-4b67-8f6b-9ebddb2eecd7',
@1 = N'',
@2 = N'UserOrg',
@3 = 0,
@4 = '2018-12-19 10:19:56.3500621',
@5 = N'',
@6 = N'7e32b891-3a76-4b4e-bc7d-1327c1bb5457',
@7 = N'0140de66-ae16-43f6-ba00-2dd1d7673971';
GO

------------------------------------------------新增用户数据【end】-------------------




------------------------------------------------新增权限数据【begin】-------------------



------------------------------------------------新增权限数据【end】-------------------
