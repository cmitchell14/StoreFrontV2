/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
ALTER TABLE [dbo].[Suppliers] DROP CONSTRAINT IF EXISTS [FK_Suppliers_ContactInformation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Suppliers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Department]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_ContactInformation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductStatus]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Department]
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[ContactInformation]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContactInformation](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](75) NOT NULL,
	[City] [varchar](25) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[Country] [varchar](25) NOT NULL,
	[Phone] [nchar](12) NOT NULL,
	[Email] [nvarchar](75) NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
	[BirthDate] [date] NOT NULL,
	[HireDate] [date] NOT NULL,
	[DirectReportID] [int] NULL,
	[ContactID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NULL,
	[StatusID] [int] NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsOnOrder] [int] NULL,
	[SupplierID] [int] NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ProdImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[ContactID] [int] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[FavoriteColor] [varchar](7) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108302119380_InitialCreate', N'StoreFront.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85B649DA40DBAB9609D2CFAB6A025DA1156A2B412952628FA657DE827F5173A94A81B2FBAD88AED14058A581C9E190E67C8E170B8FFFEFDCFF8E747DF331E7014BB01999807A37DD3C0C40E1C972C27664217AFDE9A3FBFFBF69BF199E33F1A9F72BA2346073D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF641D1C5818204CC0328CF1C78450D7C7E90FF8390D888D439A20EF3270B017F3EFD0324B518D2BE4E33844369E98331A44F83C0A081DDD5D8C2E3F4D47591FD338F15C04F2CCB0B7300D4448401105698FEF623CA3D061390BE103F26E9F420C740BE4C5988FE2B824EF3AA0FD433620ABEC9843D9494C03BF27E0C111D79025765F49CF66A141D0E119E89A3EB151A77A9C98170E4E3F7D0C3C5080C8F078EA458C78625E162C4EE2F00AD351DE7194419E4700F747107D195511F78CCEFDF60A8B3A1CEDB3FFF68C69E2D124C21382131A216FCFB849E69E6BFF869F6E832F984C8E0EE68BA3B7AFDF20E7E8CD8FF8E87575A43056A0AB7D804F375110E20864C38B62FCA661D5FB5962C7A25BA54FA615B025700ED3B8448F1F3059D27B709BC3B7A671EE3E6227FFC28DEB8EB8E04BD0894609FCBC4A3C0FCD3D5CB45B8D3CD9FF1BB81EBE7E3308D72BF4E02ED3A917F883E344E0571FB197B6C6F76E98B9576DBE3F7332F0499FFDAEDB57D6FA79162491CD061368496E51B4C4B42EDDD82A8DB7934933A8E1CD3A47DD7DD36692CAE6AD2465035AC51372169BF6865CDEE7E5DBD9E24EC210262F352DA6912683D36D59230163CF90284B333AE86A460486F77F5E15CF7CE47A032C8B1DB8405CB270231F17A37C1F801122D25BE61B14C7B02A38BFA2F8BE4174F87300D167D84E2230D619457EF8ECDC6EEE0382AF127FCE7C6073BC069B9ADB3F82736483DF9D11D66B6DBC0F81FD2548E819714E11C577D4CE01D9CF5BD7EF0E30883827B68DE3F81C8C193BD300C2EE1CF082D0A3C3DE706C99DA765832F590EBABE3126141FD9C9396B1899A428A4F3464AA18A549D40FC1D225DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D560515F3A43C3877D29ECEEC77DEB6DDEBAB5A0A2C63432F905131CC132E6DC204A7144CA19E8B26E6C235848A78F317DF6BD29E5F40979C9D0AC56F286741118DE1B52D8DDF786544CF8FCE03A2C2AE97018CA8901BE13BDFA9CD5EE7382649B7687DA3037CD7C336B80CE5D4EE238B0DDD40B1469309EC4A8CB0F319CD19ED1C846236645606060E82EDBF2E00B8CCD148DEA9A9C620F536C9CD8599A708A621B39B21A61404E0FC1F21D552158991DA90BF783C4132C1D47AC136287A0183CD52554760B97D86E88BC562D093D3B6E616CEC050FB1E51487983086AD9AE8C25C9D0C6102147C844969D3D0D8AA585CB3216AA256DD9CB785B0E5BC4B398A8DD8644BECACB14B1EBF3D8B61366B6C03C6D9AC922E0268137BDB30507E56E96A00E2C165D70C543831690C9487541B31D0BAC6B660A07595BC3803CD8EA85DE75F38AFEE9A79D60FCA9BDFD61BD5B505DBACE963C74C338B3DA10F851E3892CDF374CE1AF123551CCE404E7E3E8B79A82B9A08039F615A4FD994F1AE320EB59A4144236A022C0DAD05945F094A409243F5102ECFE5354AC7A3881EB079DEAD1196AFFD026CC50664ECEAD56885507F812A1A67A7D34731B2C21A2423EF7458A8E0280C425CBCEA03EFA0145D5E56564C9758B84F345C19189F8C0605B544AE1A25E583195C4BB969B66B491590F509C9D6D292103E69B4940F66702D711B6D57922228E81116ACA5A2FA163E90B3E5998E62B729DAC6565637C53F8C2D4D81D5F81285A14B9695822BFEC59865D556D357B3FE05487E8661D9B1A20EA990B6E04483082DB1D00AAC41D273378AE929A2688E589E67EAF81299726FD52CFF39CBEAF6294F62BE0FE4D4EC6F7EB3AABBC8AFEDB87248C291CE619C3E8B6B521C8515A8BB1BAC0C0E792852E4EFA78197F8441F66E97B67B778D5FED91719616C09F24B6194A43329D8AD4F40A7E9915D63D0A92A6299D5A74B0FA1537A1E8956D5AE8B4EF52879B2AA8AA24B606D6DFA7441CD0A5326468DFD67AC15E1797C8C97AA5401F8A79E18956A0709ACD2D61DB55E9052C5ACB7744714AA4EAA9042530F29ABB5253521AB0D2BE16934AAA6E8CE41AE26A9A2CBADDD91157525556845F30AD80A99C5B6EEA88AD2932AB0A2B93B765987222EA53BBC8B69CF326B6E63D9A177BD7D4C83F13CEBE230DB60E56EBF0A54F9DC138BDFDE4B60FCFB4EDA94F6E4B7A64D65198FF56C4A83A15F856A77E3F545A8F1425F8F59BBF0AE2DF44D17FE7ABC7E96FBACF6211DFF4492827B710C148E7B637EF46A7F74239DC53212D3C8D50856F51453EC8F18C168F6D59B7A2E664B7A4E708988BBC031CD8A3CCCC3FD8343E1C5CEEEBC9EB1E2D8F1144757DD139AFA9C6DA05E8B3CA0C8BE47915C3DB1C60B9312544A4C5F10073F4ECC3FD35EC7698E83FD957EDE332EE23BE27E4DA0E1364AB0F1975C0D3A4CC57D87371E85A07FBD88C713DD557EF1FBE7ACEB9E711D813B1D1BFB82A25799FEFA938A5ED2645DD79066E587162FD7DB6A2F1794A882B7ACFE5061EED2411E29E4527EE7A3C7EFFB8AA67C88B016A2E2B1C1507883A850F79860152CED4302077ED2F42141BFC1AA1F16AC229AF651814BFA83894F0ABA2F4379CF2DEE438A63D32696A454CFAD25D96BD5676E7B6F922AB7D77274B93ABB07DCA015D8EB85282FACB279B0AD5351B83C18F636EDFED9AB9577A540B90CDAB75B97BCC952E4862BA6FF5505F20ED4CC296A80B65F67BC695BD3E58177BC58B35F35F18E191BDFE6B75F33BC6963D3258877DCD87A5506EF98AD6D6BFFDCB2A575DE42B75EE72B972C69EE735459E4B63ADE2CE50EC7FF790046904594D9F34B75E15853D16B0BC39244CF545FB12632961C47E22B5134B3ED3756BEE1370E96D334B3D5D47936F1E6EB7F236F4ED3CC5B533DB98D0A6465FDA2AA2ABC651D6B2AA87A4915C7B591B414B8B7C5AC8D97F32FA9C07810A5D4BC4773BBFC72EA890751C990AED3A37E58BE2886BDB3F26F38C2FE1DBBCB1282FD8B8E04DBB55DB3A0B9208B20DFBC05897212214373892972604B3D89A8BB4036856696804EDF8FA7493D760D32C7CE05B94E6898501832F6E75E2DE1C5828026FE6991745DE6F175C87EC5430C01C47459E2FE9ABC4F5CCF29E43E57E48434102CBAE0E95E369794A57D974F05D255403A0271F51541D12DF6430FC0E26B32430F7815D9C0FC3EE025B29FCA0CA00EA47D22EA6A1F9FBA6819213FE618657FF80936ECF88FEFFE031800276BCA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fcf6f560-7bb3-4bf7-8447-09169a6b62e5', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'86f2c369-39f9-4323-b235-ad35e88dabb2', N'Customer')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c8176ff-6949-4418-97eb-aea82a28abdc', N'86f2c369-39f9-4323-b235-ad35e88dabb2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f9cd9cab-68d2-41e5-a807-472234f34588', N'fcf6f560-7bb3-4bf7-8447-09169a6b62e5')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'010aa344-a47a-40f3-816c-ea74c02227f1', N'bye@hi.com', 0, N'AOrycxTsFD1u3m1CNrERENZ1fmh9tx+s/eCPLehq5iGgBm8QqsWHzTjFXbPT3eYW7A==', N'c21eb8a3-b684-4c35-bd05-f6c8facdde30', NULL, 0, 0, NULL, 1, 0, N'bye@hi.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6c8176ff-6949-4418-97eb-aea82a28abdc', N'angelica.herrera1992@gmail.com', 0, N'AP1XYlRjWHZ3ZgmCjpUTnUvUnzyiFhlXTSnTQKQICQHSIg4D6UjFSzzXxbUXcuIXsg==', N'7cb8affa-78af-450d-b457-4c77be67c207', NULL, 0, 0, NULL, 1, 0, N'angelica.herrera1992@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9d584698-57cf-454b-9e4a-ef4c86969702', N'hello@test.com', 0, N'ADRna6et14SQi2/j6iBmr+Id1VHsovS5yU5bWw8a+ZYVH3ASvzsTnVOxKu3hRi/EMQ==', N'1a88657a-59ca-4670-a4a3-b3773f34a85c', NULL, 0, 0, NULL, 1, 0, N'hello@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a45bbdcf-8bbd-469a-9486-70c920029fd6', N'test@test.com', 1, N'ABpbBs54a5aj24pZslpw5cXPVMY+bDx2DNgHh2ZgLaloVH3hfyB78g1rymYgNjo2DQ==', N'27a4e492-355e-4183-90a8-1484047a3320', NULL, 0, 0, NULL, 1, 0, N'test@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f9cd9cab-68d2-41e5-a807-472234f34588', N'calmitch14@gmail.com', 0, N'AKNYjnxFkQ4xU7y5L+6n+/irFMTB2lHQ8voPnj2T6q14Sj4zMq1/TxK1Th+8EMzTrg==', N'632c585a-ed29-4a9b-8415-5813be2395c1', NULL, 0, 0, NULL, 1, 0, N'calmitch14@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fb900c43-640f-4fa0-ac9b-b0b19c16f603', N'larry@bird.com', 0, N'AC2aae6cs2YOOQQxHgCr6mzNM16N79+V8B+798rlSv7ygijXV0syhCNG6aJb8SOVLg==', N'4f16942d-b822-4616-9a2b-5b4a3319a7eb', NULL, 0, 0, NULL, 1, 0, N'larry@bird.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Backpacks')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Tents')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Clothing')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Footwear')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Food')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Accessories')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'Sleeping Bags')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[ContactInformation] ON 

INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (1, N'1651 Wisher
', N'Overland Park', N'KS', N'66210', N'USA', N'555-555-6235', N'cwillerby@backswithpacks.com
')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (2, N'785 N Hampton
', N'Overlan Park', N'KS', N'66211', N'USA', N'555-555-6236', N'tjones@backswithpacks.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (4, N'3734 Place St
', N'Overland Park', N'KS', N'66221', N'USA', N'555-555-6237', N'vlenny@backswithpacks.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (5, N'245 Evergreen Ter.', N'Springfield', N'IL', N'62629', N'USA', N'555-555-6238', N'ghack@backswithpacks.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (6, N'624 Pokerface', N'Bartlesville', N'OK', N'74003', N'USA', N'555-555-6239', N'lgeegee@backswithpacks.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (7, N'7222 Welp
', N'Overland Park', N'KS', N'66220', N'USA', N'555-555-6240', N'mrofone@backswithpacks.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (8, N'1447 Osprey Ln.
', N'Santa Cruz', N'CA', N'95060', N'USA', N'866-284-7830', N'Bilbo.B.Baggin@osprey.com
')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (11, N'1 International Court
', N'Broomfield', N'CO', N'80021', N'USA', N'800-535-3589', N'wclimate@kelty.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (12, N'1400 Industries Road
', N'Richmond', N'IN', N'47374', N'USA', N'800-288-3124', N'cpariq@merrell.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (13, N'515 NW 13th Avenue
', N'Portland', N'OR', N'97209', N'USA', N'866-676-5336', N'fgargoyle@keenfootwear.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (14, N'75 Panorama Creek Dr
', N'Rochester', N'NY', N'14625', N'USA', N'800-625-4327', N'ibottle@nalgene.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (15, N'8550 White Fir St.
', N'Reno', N'NV', N'89523', N'USA', N'800-638-6464', N'pagonia@patagonia.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (16, N'562 North Face Ln.
', N'Appleton', N'WI', N'54914', N'USA', N'888-863-1968', N'bwire@northface.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (17, N'525 25th Ave SW', N'Albany', N'OR', N'97322', N'USA', N'800-547-0244', N'afroman@mountainhouse.com')
INSERT [dbo].[ContactInformation] ([ContactID], [Address], [City], [State], [ZipCode], [Country], [Phone], [Email]) VALUES (18, N'333 W Ostend St', N'Baltimore', N'MD', N'21230', N'USA', N'555-986-5523', N'contact@lifestraw.com')
SET IDENTITY_INSERT [dbo].[ContactInformation] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'Executive')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'Sales')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'HR')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (4, N'Operations')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (5, N'CustomerService')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (1, N'Clarence', N'Willerby', N'CEO', 1, CAST(N'1972-12-07' AS Date), CAST(N'2010-03-02' AS Date), NULL, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (2, N'Tara', N'Jones', N'Director of Sales', 2, CAST(N'1990-04-23' AS Date), CAST(N'2010-06-21' AS Date), 1, 2)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (7, N'Vinny', N'Lenny', N'HR Director', 3, CAST(N'1971-05-08' AS Date), CAST(N'2018-08-24' AS Date), 8, 4)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (8, N'Gene', N'Hack', N'Operations Director', 4, CAST(N'1986-08-14' AS Date), CAST(N'2015-07-20' AS Date), 1, 5)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (9, N'Lady', N'Geegee', N'Customer Support Specialist', 5, CAST(N'1995-10-13' AS Date), CAST(N'2020-09-23' AS Date), 2, 6)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Title], [DepartmentID], [BirthDate], [HireDate], [DirectReportID], [ContactID]) VALUES (10, N'Mike', N'Rofone', N'Executive Assistant', 1, CAST(N'1994-11-07' AS Date), CAST(N'2017-04-25' AS Date), 1, 7)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (4, N'Chicken and Dumplings - 2 Servings', 5, 1, 8.5000, 42, 8, 8, N'Chicken, vegetable and fluffy dumpling bites in a creamy white gravy make the soul-satisfying Southern Mountain House Chicken and Dumplings recipe perfect for outdoor or indoor adventures.', N'be313332-993a-4212-9c8d-1172a28b8e00.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (7, N'Nine Trails Shorts - Men''s 8" Inseam', 3, 1, 65.0000, 15, 10, 6, N'Perfect for heart-pumping day hikes and predawn jogs, the Patagonia Nine Trails shorts promote breathable comfort with a recycled polyester blend. They feature an 8 in. inseam with 2 in. side notches.', N'a8481901-0c21-4645-956e-8cca99e04cf4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (8, N'Newport H2 Sandals - Men''s', 4, 1, 109.9500, 6, 2, 4, N'The freedom of comfy sandals meets the support of rugged shoes in the men''s KEEN Newport H2 sandals, which feature quick-dry webbing, toe protection and an adjustable fit with room for your toes.', N'c7be0d68-66da-446f-ad6a-add91d8d41a6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (9, N'Cosmic 20 Sleeping Bag - Men''s', 7, 1, 149.9500, 4, 4, 2, N'A 3-season superstar for nights when temps dip to subfreezing, the men''s Kelty Cosmic 20 sleeping bag''s thermally efficient trapezoidal baffle construction and 550-fill-power down keep you warm.', N'78edbcf4-b6e8-4f90-ab9e-2473178b8587.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (10, N'Wawona 6 Tent', 2, 2, 450.0000, 0, 6, 7, N'With its huge vestibule and high interior, The North Face Wawona 6-person tent has a homey feel. Plus, it''s been entirely refreshed with double-wall construction, re-engineered poles and easier setup.', N'cf89d2a0-029e-4336-987b-9dcea3c00e80.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (11, N'Moab 2 Mid Waterproof Hiking Boots', 4, 1, 135.0000, 8, 4, 3, N'Merrell Moab 2 Mid waterproof hikers deliver out-of-the-box comfort with durable leather, supportive footbeds and Vibram® grip. You''ll soon understand why Moab stands for Mother-Of-All-Boots.', N'fb630a74-50bd-472d-8eae-8138f2ed9bc3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (12, N'Sustain Wide-Mouth Water Bottle', 6, 1, 14.9500, 54, 31, 5, N'Made from Tritan Renew copolyester—using 50% certified recycled content—the 32 fl. oz. Nalgene Sustain wide-mouth water bottle helps you lessen your impact on the environment.', N'09e80181-1ea2-4001-a4d6-09e9551e2416.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (13, N'Aphrodite 2.0 Pants - Women''s', 3, 2, 70.0000, 0, 76, 7, N'With technical FlashDry XD™ fabric and an adjustable waistband, you''ll hit the road or trail in comfort in the extremely durable, stretch-woven Aphrodite 2.0 pants from The North Face.', N'a02f354c-1f19-4ac8-8f79-fd7f08d3f465.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (14, N'Atmos AG 50 Pack - Men''s', 1, 1, 240.0000, 16, 4, 1, N'Linger on the trail a little longer with the Osprey Atmos AG 50 pack. Its ventilated Anti-Gravity™ suspension system and 9 pockets make it a pleasure to shoulder your backcountry essentials.', N'ce022628-492f-4efb-a3aa-b04851506a44.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (19, N'LifeStraw Personal Water Filter', 6, 1, 14.8300, 42, 12, 10, N'Removes bacteria & parasites: The microfiltration membrane removes 99.999999% of waterborne bacteria (including E. coli and salmonella), and 99.999% of waterborne parasites (including giardia and cryptosporidium)', N'b56da464-ba33-4ee9-993b-565d7d205adc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (20, N'LifeStraw Go - Stainless Steel', 6, 1, 59.9500, 8, 2, 10, N'INSULATED STAINLESS STEEL WATER BOTTLE WITH FILTER
Protects against bacteria, parasites, microplastics, chlorine, organic chemical matter, dirt, sand, and cloudiness; improves taste
Independently lab tested
Every fill avoids single use plastic bottled water!
Double wall vacuum insulation keeps water refreshingly cold for hours
Get replacement filters and accessories here', N'1721c621-4de7-448d-988f-f72451fa2070.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [StatusID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [SupplierID], [Description], [ProdImage]) VALUES (21, N'Rumpus 6 - Tent', 1, 1, 299.9500, 3, 2, 2, N'An epic camping trip sometimes requires space for ALL the things. And with the Kelty Rumpus 6 tent, there’s ample space to put your unique spin on every trip! The Rumpus tent’s extra-large vestibule has room for whatever moves you—from mountain bikes and pups, to a badass wilderness porch with easy access to your cooler(s). Use it to store gear, or happy hour with friends, and then retire to your spacious sleeping quarters to rest up for whatever’s up next. Let the wild Rumpus begin!', N'64c593a4-c4cb-472c-bc67-6380945f7f41.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([StatusID], [Status]) VALUES (1, N'In Stock')
INSERT [dbo].[ProductStatus] ([StatusID], [Status]) VALUES (2, N'Out of Stock')
INSERT [dbo].[ProductStatus] ([StatusID], [Status]) VALUES (3, N'Backordered')
INSERT [dbo].[ProductStatus] ([StatusID], [Status]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (1, N'Osprey', 8)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (2, N'Kelty', 11)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (3, N'Merrell', 12)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (4, N'Keen', 13)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (5, N'Nalgene', 14)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (6, N'Patagonia', 15)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (7, N'The North Face', 16)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (8, N'Mountain House', 17)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactID]) VALUES (10, N'LifeStraw', 18)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'010aa344-a47a-40f3-816c-ea74c02227f1', N'hi', N'bye', N'#000000')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'6c8176ff-6949-4418-97eb-aea82a28abdc', N'Angelica', N'Herrera', N'#000000')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'9d584698-57cf-454b-9e4a-ef4c86969702', N'test', N'testerson', N'#111111')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'a45bbdcf-8bbd-469a-9486-70c920029fd6', N'hello', N'test', N'#222222')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'f9cd9cab-68d2-41e5-a807-472234f34588', N'Caleb', N'Mitchell', N'#112321')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'fb900c43-640f-4fa0-ac9b-b0b19c16f603', N'Larry', N'Bird', N'#000000')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_ContactInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ContactInformation] FOREIGN KEY([ContactID])
REFERENCES [dbo].[ContactInformation] ([ContactID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_ContactInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_ContactInformation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ProductStatus] ([StatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suppliers_ContactInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suppliers]'))
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_ContactInformation] FOREIGN KEY([ContactID])
REFERENCES [dbo].[ContactInformation] ([ContactID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Suppliers_ContactInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Suppliers]'))
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_ContactInformation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers1] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers1]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers1]
GO
