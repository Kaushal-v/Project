USE [master]
GO
/****** Object:  Database [ShareLog using blockchain]    Script Date: 10-03-2021 15:58:20 ******/
CREATE DATABASE [ShareLog using blockchain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShareLog using blockchain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\ShareLog using blockchain.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShareLog using blockchain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\ShareLog using blockchain_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShareLog using blockchain] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShareLog using blockchain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShareLog using blockchain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShareLog using blockchain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShareLog using blockchain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShareLog using blockchain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShareLog using blockchain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShareLog using blockchain] SET  MULTI_USER 
GO
ALTER DATABASE [ShareLog using blockchain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShareLog using blockchain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShareLog using blockchain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShareLog using blockchain] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShareLog using blockchain] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShareLog using blockchain] SET QUERY_STORE = OFF
GO
USE [ShareLog using blockchain]
GO
/****** Object:  Table [dbo].[blockchain_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blockchain_master](
	[block_hash] [nvarchar](200) NOT NULL,
	[block_previous_hash] [nvarchar](200) NOT NULL,
	[block_timestamp] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_blockchain_master] PRIMARY KEY CLUSTERED 
(
	[block_hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share_holder_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_holder_master](
	[user_id] [int] NOT NULL,
	[share_id] [int] NOT NULL,
	[holder_share_count] [int] NOT NULL,
	[share_holder_last_updated_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_master](
	[share_id] [int] IDENTITY(1,1) NOT NULL,
	[share_name] [nvarchar](max) NOT NULL,
	[share_price] [float] NOT NULL,
	[share_available_count] [int] NOT NULL,
	[share_sold_count] [int] NOT NULL,
	[share_received_count] [int] NOT NULL,
 CONSTRAINT [PK_share_master] PRIMARY KEY CLUSTERED 
(
	[share_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[share_price_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_price_master](
	[share_id] [int] NOT NULL,
	[share_price_changing] [float] NOT NULL,
	[share_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_master](
	[block_hash] [nvarchar](200) NOT NULL,
	[transaction_sender_hash] [nvarchar](max) NOT NULL,
	[transaction_receiver_hash] [nvarchar](max) NOT NULL,
	[transaction_chips] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_master]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[user_id] [int] IDENTITY(1001,1) NOT NULL,
	[user_name] [nvarchar](max) NOT NULL,
	[user_active] [nvarchar](max) NOT NULL,
	[user_date_created] [datetime] NOT NULL,
	[user_date_updated] [datetime] NULL,
	[user_first_name] [nvarchar](max) NOT NULL,
	[user_last_name] [nvarchar](max) NOT NULL,
	[user_display_name] [nvarchar](max) NOT NULL,
	[user_mail_address] [nvarchar](max) NULL,
	[user_contact_no] [nvarchar](max) NULL,
	[user_password] [nvarchar](max) NOT NULL,
	[user_type] [nvarchar](max) NOT NULL,
	[user_last_login] [datetime] NOT NULL,
 CONSTRAINT [PK_user_master] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_share_meta]    Script Date: 10-03-2021 15:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_share_meta](
	[user_id] [int] NOT NULL,
	[share_id] [int] NOT NULL,
	[user_share_meta_count] [int] NOT NULL,
	[user_share_meta_ope] [nvarchar](50) NOT NULL,
	[user_share_meta_time] [datetime] NOT NULL,
	[share_price] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[share_holder_master]  WITH CHECK ADD  CONSTRAINT [FK_share_holder_master_share_master] FOREIGN KEY([share_id])
REFERENCES [dbo].[share_master] ([share_id])
GO
ALTER TABLE [dbo].[share_holder_master] CHECK CONSTRAINT [FK_share_holder_master_share_master]
GO
ALTER TABLE [dbo].[share_holder_master]  WITH CHECK ADD  CONSTRAINT [FK_share_holder_master_user_master] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_master] ([user_id])
GO
ALTER TABLE [dbo].[share_holder_master] CHECK CONSTRAINT [FK_share_holder_master_user_master]
GO
ALTER TABLE [dbo].[share_price_master]  WITH CHECK ADD  CONSTRAINT [FK_share_price_master_share_master] FOREIGN KEY([share_id])
REFERENCES [dbo].[share_master] ([share_id])
GO
ALTER TABLE [dbo].[share_price_master] CHECK CONSTRAINT [FK_share_price_master_share_master]
GO
ALTER TABLE [dbo].[transaction_master]  WITH CHECK ADD  CONSTRAINT [FK_transaction_master_blockchain_master] FOREIGN KEY([block_hash])
REFERENCES [dbo].[blockchain_master] ([block_hash])
GO
ALTER TABLE [dbo].[transaction_master] CHECK CONSTRAINT [FK_transaction_master_blockchain_master]
GO
ALTER TABLE [dbo].[user_share_meta]  WITH CHECK ADD  CONSTRAINT [FK_user_share_meta_share_master] FOREIGN KEY([share_id])
REFERENCES [dbo].[share_master] ([share_id])
GO
ALTER TABLE [dbo].[user_share_meta] CHECK CONSTRAINT [FK_user_share_meta_share_master]
GO
ALTER TABLE [dbo].[user_share_meta]  WITH CHECK ADD  CONSTRAINT [FK_user_share_meta_user_master] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_master] ([user_id])
GO
ALTER TABLE [dbo].[user_share_meta] CHECK CONSTRAINT [FK_user_share_meta_user_master]
GO
USE [master]
GO
ALTER DATABASE [ShareLog using blockchain] SET  READ_WRITE 
GO
