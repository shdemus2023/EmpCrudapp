USE [EmployeeDemo]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 25-04-2023 09:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmp]
@Id INT
AS
BEGIN
    DELETE FROM emp
    WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 25-04-2023 09:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmp]
    @Name NVARCHAR(10),
    @Salary DECIMAL(18, 2),
    @City NVARCHAR(10)
AS
BEGIN
    INSERT INTO emp (Name, Salary, City)
    VALUES (@Name, @Salary, @City);
END

GO
/****** Object:  StoredProcedure [dbo].[SelectEmp]    Script Date: 25-04-2023 09:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectEmp]
AS
BEGIN
    SELECT ID, NAME, CITY, SALARY FROM emp;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmp]    Script Date: 25-04-2023 09:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmp]
    @Id INT,
	@Name NVARCHAR(10),
    @Salary DECIMAL(18, 2),
    @City NVARCHAR(10)
AS
BEGIN
    UPDATE emp 
	SET
		Name = @Name, 
		Salary = @Salary, 
		City = @City
	WHERE Id = @Id;
END

GO
/****** Object:  Table [dbo].[Emp]    Script Date: 25-04-2023 09:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[City] [nvarchar](10) NULL,
	[Salary] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Emp] ON 

INSERT [dbo].[Emp] ([id], [Name], [City], [Salary]) VALUES (1, N'a', N'aa', 11111)
INSERT [dbo].[Emp] ([id], [Name], [City], [Salary]) VALUES (2, N'b', N'bb', 22222)
INSERT [dbo].[Emp] ([id], [Name], [City], [Salary]) VALUES (3, N'c', N'cc', 33333)
SET IDENTITY_INSERT [dbo].[Emp] OFF
