USE [master]
GO
/****** Object:  Database [TesteDeConhecimento]    Script Date: 02/06/2023 00:43:05 ******/
CREATE DATABASE [TesteDeConhecimento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TesteDeConhecimento', FILENAME = N'C:\Users\Guilherme\TesteDeConhecimento.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TesteDeConhecimento_log', FILENAME = N'C:\Users\Guilherme\TesteDeConhecimento_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TesteDeConhecimento] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TesteDeConhecimento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TesteDeConhecimento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET ARITHABORT OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TesteDeConhecimento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TesteDeConhecimento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TesteDeConhecimento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TesteDeConhecimento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TesteDeConhecimento] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TesteDeConhecimento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TesteDeConhecimento] SET  MULTI_USER 
GO
ALTER DATABASE [TesteDeConhecimento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TesteDeConhecimento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TesteDeConhecimento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TesteDeConhecimento] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TesteDeConhecimento] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TesteDeConhecimento] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TesteDeConhecimento] SET QUERY_STORE = OFF
GO
USE [TesteDeConhecimento]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02/06/2023 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 02/06/2023 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nmCliente] [nvarchar](max) NOT NULL,
	[Cidade] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 02/06/2023 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[ValoUnitario] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendas]    Script Date: 02/06/2023 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[ProdutoId] [int] NOT NULL,
	[QtdVenda] [int] NOT NULL,
	[VlrUnitarioVenda] [decimal](10, 2) NULL,
	[DthVenda] [datetime2](7) NOT NULL,
	[VlrTotalVenda] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Vendas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TesteDeConhecimento] SET  READ_WRITE 
GO
