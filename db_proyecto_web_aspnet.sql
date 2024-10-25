USE [master]
GO
/****** Object:  Database [db_proyecto_web_aspnet]    Script Date: 24/10/2024 17:59:52 ******/
CREATE DATABASE [db_proyecto_web_aspnet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_proyecto_web_aspnet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_proyecto_web_aspnet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_proyecto_web_aspnet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_proyecto_web_aspnet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_proyecto_web_aspnet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET RECOVERY FULL 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET  MULTI_USER 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_proyecto_web_aspnet', N'ON'
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_proyecto_web_aspnet]
GO
/****** Object:  Table [dbo].[AuditoriaClientes]    Script Date: 24/10/2024 17:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaClientes](
	[AuditoriaId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[CampoModificado] [nvarchar](100) NULL,
	[ValorAnterior] [nvarchar](max) NULL,
	[ValorNuevo] [nvarchar](max) NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 24/10/2024 17:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[clienteId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[documento] [varchar](20) NULL,
	[direccion] [varchar](max) NULL,
 CONSTRAINT [PK_ClienteID] PRIMARY KEY CLUSTERED 
(
	[clienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 24/10/2024 17:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[DireccionId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Descripcion_direccion] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentos]    Script Date: 24/10/2024 17:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentos](
	[DocumentoId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[TipoDocumento] [nvarchar](50) NULL,
	[NumeroDocumento] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 24/10/2024 17:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[correo] [nvarchar](100) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[clave] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditoriaClientes] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[clientes] ([clienteId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Clientes]
GO
ALTER TABLE [dbo].[Documentos]  WITH CHECK ADD  CONSTRAINT [FK_Documentos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[clientes] ([clienteId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentos] CHECK CONSTRAINT [FK_Documentos_Clientes]
GO
USE [master]
GO
ALTER DATABASE [db_proyecto_web_aspnet] SET  READ_WRITE 
GO
