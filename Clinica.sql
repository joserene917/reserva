USE [master]
GO
/****** Object:  Database [Clinica ]    Script Date: 29/1/2020 4:36:23 p. m. ******/
CREATE DATABASE [Clinica ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinica .mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinica _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinica _log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Clinica ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica ] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica ] SET RECOVERY FULL 
GO
ALTER DATABASE [Clinica ] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Clinica ', N'ON'
GO
USE [Clinica ]
GO
/****** Object:  Table [dbo].[Cat_Categorias]    Script Date: 29/1/2020 4:36:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Categorias](
	[Cod_Cate] [int] IDENTITY(1,1) NOT NULL,
	[Nomb_Cate] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Cod_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cat_Categorias] PRIMARY KEY CLUSTERED 
(
	[Cod_Cate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_Especialidad]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Especialidad](
	[Cod_Especialidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Especialidad] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Cod_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cat_Especialidad] PRIMARY KEY CLUSTERED 
(
	[Cod_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_Fisioterapeuta]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Fisioterapeuta](
	[Cod_Fisioterapeuta] [int] IDENTITY(1,1) NOT NULL,
	[Nomb_Fisioterapeuta] [nvarchar](50) NOT NULL,
	[Apellido_Paterno] [nvarchar](50) NOT NULL,
	[Apellido_Materno] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[Num_Cedula] [nvarchar](50) NULL,
	[Telefono_Fisioterapeuta] [numeric](18, 0) NULL,
	[Cod_Especialidad] [int] NOT NULL,
	[Cod_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cat_Fisioterapeuta] PRIMARY KEY CLUSTERED 
(
	[Cod_Fisioterapeuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_Paciente]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Paciente](
	[Cod_Paciente] [int] IDENTITY(1,1) NOT NULL,
	[Nomb_Paciente] [nvarchar](50) NOT NULL,
	[Apellido_Paterno] [nvarchar](50) NOT NULL,
	[Apellido_Materno] [nvarchar](50) NULL,
	[Num_Cedula] [nvarchar](50) NULL,
	[Edad] [int] NOT NULL,
	[Fecha_Nac] [date] NOT NULL,
	[Direccion_Paciente] [nvarchar](100) NOT NULL,
	[Telefono_Paciente] [numeric](18, 0) NULL,
	[Cod_Sexo] [int] NOT NULL,
	[Cod_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cat_Paciente] PRIMARY KEY CLUSTERED 
(
	[Cod_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_Servicios]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Servicios](
	[Cod_Servicio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Servicio] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Cod_Cate] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Cod_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cat_Terapias_Rehabilitaciones] PRIMARY KEY CLUSTERED 
(
	[Cod_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_Sexo]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Sexo](
	[Cod_Sexo] [int] IDENTITY(1,1) NOT NULL,
	[Nomb_Sexo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cat_Sexo] PRIMARY KEY CLUSTERED 
(
	[Cod_Sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estado]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Cod_Estado] [int] NOT NULL,
	[Nombre_Estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Cod_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Cod_Roles] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Cod_Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_AsignacionPrecio]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AsignacionPrecio](
	[Cod_precio] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tbl_AsignacionPrecio] PRIMARY KEY CLUSTERED 
(
	[Cod_precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_ColorEvento]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ColorEvento](
	[Cod_Color] [nvarchar](50) NOT NULL,
	[Nombre_Color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_ColorEvento] PRIMARY KEY CLUSTERED 
(
	[Cod_Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_DetalleFact]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DetalleFact](
	[Cod_Deta] [int] IDENTITY(1,1) NOT NULL,
	[Num_Fact] [int] NOT NULL,
	[Cod_Reservacion] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Tbl_DetalleFact_1] PRIMARY KEY CLUSTERED 
(
	[Num_Fact] ASC,
	[Cod_Reservacion] ASC,
	[Cod_Deta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_DetalleReservacion]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DetalleReservacion](
	[Cod_Reservacion] [int] NOT NULL,
	[Cod_Servicio] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_DetalleReservacion_1] PRIMARY KEY CLUSTERED 
(
	[Cod_Reservacion] ASC,
	[Cod_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_DetallesAsisgnacion]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DetallesAsisgnacion](
	[Cod_precio] [int] NOT NULL,
	[Cod_Servicio] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_DetallesAsisgnacion] PRIMARY KEY CLUSTERED 
(
	[Cod_precio] ASC,
	[Cod_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Factura]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Factura](
	[Num_Fact] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_fact] [date] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Descuento] [float] NULL,
	[Total] [float] NOT NULL,
	[Cod_Fisioterapeuta] [int] NOT NULL,
	[Cod_Paciente] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Factura] PRIMARY KEY CLUSTERED 
(
	[Num_Fact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Reservacion]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Reservacion](
	[Cod_Reservacion] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Fecha_Reservacion] [datetime] NOT NULL,
	[Cod_Paciente] [int] NOT NULL,
	[Cod_Fisioterapeuta] [int] NOT NULL,
	[TituloEvent] [nvarchar](max) NOT NULL,
	[Cod_Color] [nvarchar](50) NOT NULL,
	[Total] [float] NOT NULL,
	[Padecimiento] [nvarchar](50) NOT NULL,
	[Descripcion_Pade] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Reservacion] PRIMARY KEY CLUSTERED 
(
	[Cod_Reservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioRoles]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRoles](
	[Cod_Usuario] [int] NOT NULL,
	[Cod_Roles] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioRoles] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC,
	[Cod_Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/1/2020 4:36:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Cod_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cat_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cat_Categorias] ON 

INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (1, N'Fracturas', N'masaje corporal', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (2, N'Rehabilitación Fisica ', N'masajes Corporales y ejercicios', 0)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (3, N'Terapias respiratorias', N'Para DX: de complicaciones respiratorias', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (4, N'Retraso psicomotor', N'DX: Problemas psicomotores', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (5, N'Parálisis', N'Atención Especializada Parálisis', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (6, N'Masajes Corporales', N'Para DX: Estrés, Relajación etc.   ', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (7, N'Lumbalgias', N'DX: músculo-esquelético de la columna vertebral', 1)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (8, N'Masajes relajantes', N'masajes Corporales', 0)
INSERT [dbo].[Cat_Categorias] ([Cod_Cate], [Nomb_Cate], [Descripcion], [Cod_Estado]) VALUES (9, N'Diagnosticos', N'Para atenciones de consultas', 1)
SET IDENTITY_INSERT [dbo].[Cat_Categorias] OFF
SET IDENTITY_INSERT [dbo].[Cat_Especialidad] ON 

INSERT [dbo].[Cat_Especialidad] ([Cod_Especialidad], [Nombre_Especialidad], [Descripcion], [Cod_Estado]) VALUES (1, N'Terapias Respiratorias', N'masajes Corporales', 1)
INSERT [dbo].[Cat_Especialidad] ([Cod_Especialidad], [Nombre_Especialidad], [Descripcion], [Cod_Estado]) VALUES (2, N'Rehabilitación Fisica', N'masaje corporal', 1)
INSERT [dbo].[Cat_Especialidad] ([Cod_Especialidad], [Nombre_Especialidad], [Descripcion], [Cod_Estado]) VALUES (3, N'Lumbalgias', N'Especialista en lumbalgias', 1)
SET IDENTITY_INSERT [dbo].[Cat_Especialidad] OFF
SET IDENTITY_INSERT [dbo].[Cat_Fisioterapeuta] ON 

INSERT [dbo].[Cat_Fisioterapeuta] ([Cod_Fisioterapeuta], [Nomb_Fisioterapeuta], [Apellido_Paterno], [Apellido_Materno], [Direccion], [Num_Cedula], [Telefono_Fisioterapeuta], [Cod_Especialidad], [Cod_Estado]) VALUES (1, N'Gloria', N'Sánchez', N'Parrales', N'Jinotepe', N'041-190296-000F', CAST(85955885 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Cat_Fisioterapeuta] ([Cod_Fisioterapeuta], [Nomb_Fisioterapeuta], [Apellido_Paterno], [Apellido_Materno], [Direccion], [Num_Cedula], [Telefono_Fisioterapeuta], [Cod_Especialidad], [Cod_Estado]) VALUES (2, N'Marvin', N'Guevara', N'Parrales', N'Jinotepe', N'041-031179-0002H', CAST(85955885 AS Numeric(18, 0)), 3, 1)
SET IDENTITY_INSERT [dbo].[Cat_Fisioterapeuta] OFF
SET IDENTITY_INSERT [dbo].[Cat_Paciente] ON 

INSERT [dbo].[Cat_Paciente] ([Cod_Paciente], [Nomb_Paciente], [Apellido_Paterno], [Apellido_Materno], [Num_Cedula], [Edad], [Fecha_Nac], [Direccion_Paciente], [Telefono_Paciente], [Cod_Sexo], [Cod_Estado]) VALUES (1, N'José Rene', N'Gonzalez', N'Altamirano', N'041-190296-00F', 23, CAST(N'1996-06-12' AS Date), N'Jinotepe', CAST(83534425 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Cat_Paciente] ([Cod_Paciente], [Nomb_Paciente], [Apellido_Paterno], [Apellido_Materno], [Num_Cedula], [Edad], [Fecha_Nac], [Direccion_Paciente], [Telefono_Paciente], [Cod_Sexo], [Cod_Estado]) VALUES (2, N'Wilmer', N'Guevara', N'Aburto', N'041-190996-0006X', 23, CAST(N'1996-09-19' AS Date), N'Jinotepe', CAST(83534418 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Cat_Paciente] ([Cod_Paciente], [Nomb_Paciente], [Apellido_Paterno], [Apellido_Materno], [Num_Cedula], [Edad], [Fecha_Nac], [Direccion_Paciente], [Telefono_Paciente], [Cod_Sexo], [Cod_Estado]) VALUES (3, N'Juan Carlos', N'Sánchez', N'Altamirano', N'041-201179-0000X', 40, CAST(N'1979-11-20' AS Date), N'Jinotepe', CAST(25525542 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Cat_Paciente] ([Cod_Paciente], [Nomb_Paciente], [Apellido_Paterno], [Apellido_Materno], [Num_Cedula], [Edad], [Fecha_Nac], [Direccion_Paciente], [Telefono_Paciente], [Cod_Sexo], [Cod_Estado]) VALUES (4, N'Daniel', N'Guevara', N'Aburto', N'-', 10, CAST(N'2010-01-12' AS Date), N'Jinotepe', CAST(25525542 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Cat_Paciente] ([Cod_Paciente], [Nomb_Paciente], [Apellido_Paterno], [Apellido_Materno], [Num_Cedula], [Edad], [Fecha_Nac], [Direccion_Paciente], [Telefono_Paciente], [Cod_Sexo], [Cod_Estado]) VALUES (5, N'Gabriel ', N'Herrera', N'Aburto', N'Menor de edad', 13, CAST(N'2007-09-02' AS Date), N'Jinotepe', CAST(85124745 AS Numeric(18, 0)), 1, 1)
SET IDENTITY_INSERT [dbo].[Cat_Paciente] OFF
SET IDENTITY_INSERT [dbo].[Cat_Servicios] ON 

INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (1, N'Parálisis facial', N'Atención Especializada Parálisis', 1, 250, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (2, N'Masaje Relajantes', N'masajes Corporales', 6, 300, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (3, N'Consulta', N'Para atenciones de consultas', 9, 200, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (4, N'Parálisis cerebral infantil', N'Atención infantil (PCI)', 5, 300, 0)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (5, N'Lumbalgias cervicalgias', N'Dx: Problemas de cervicalgias', 7, 250, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (6, N'Hernias díscales', N'DX: Prob parte baja de la espalda', 7, 300, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (7, N'Fracturas', N'Dx: Rehabilitaciones de fracturas', 1, 250, 1)
INSERT [dbo].[Cat_Servicios] ([Cod_Servicio], [Nombre_Servicio], [Descripcion], [Cod_Cate], [Precio], [Cod_Estado]) VALUES (8, N'paraliisis cerebral', N'Atención para paraliisis', 1, 200, 1)
SET IDENTITY_INSERT [dbo].[Cat_Servicios] OFF
SET IDENTITY_INSERT [dbo].[Cat_Sexo] ON 

INSERT [dbo].[Cat_Sexo] ([Cod_Sexo], [Nomb_Sexo]) VALUES (1, N'Masculino')
INSERT [dbo].[Cat_Sexo] ([Cod_Sexo], [Nomb_Sexo]) VALUES (2, N'Femenino')
SET IDENTITY_INSERT [dbo].[Cat_Sexo] OFF
INSERT [dbo].[Estado] ([Cod_Estado], [Nombre_Estado]) VALUES (0, N'Desactivado')
INSERT [dbo].[Estado] ([Cod_Estado], [Nombre_Estado]) VALUES (1, N'Activado')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#008080', N'Verde Azulado')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#228B22', N'Verde')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#2E9AFE', N'Azul')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#EF4133', N'Rojo')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#FF00FF', N'Rosado')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#FF4500', N'Naranja')
INSERT [dbo].[Tbl_ColorEvento] ([Cod_Color], [Nombre_Color]) VALUES (N'#FFD700', N'Amarillo')
SET IDENTITY_INSERT [dbo].[Tbl_DetalleFact] ON 

INSERT [dbo].[Tbl_DetalleFact] ([Cod_Deta], [Num_Fact], [Cod_Reservacion], [Precio]) VALUES (20, 20, 66, 250)
SET IDENTITY_INSERT [dbo].[Tbl_DetalleFact] OFF
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (64, 1, 300)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (65, 6, 300)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (66, 1, 250)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (67, 3, 200)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (68, 6, 300)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (69, 7, 250)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (70, 5, 250)
INSERT [dbo].[Tbl_DetalleReservacion] ([Cod_Reservacion], [Cod_Servicio], [Precio]) VALUES (71, 6, 300)
SET IDENTITY_INSERT [dbo].[Tbl_Factura] ON 

INSERT [dbo].[Tbl_Factura] ([Num_Fact], [Fecha_fact], [SubTotal], [Descuento], [Total], [Cod_Fisioterapeuta], [Cod_Paciente]) VALUES (20, CAST(N'2020-01-27' AS Date), 250, 10, 225, 1, 4)
SET IDENTITY_INSERT [dbo].[Tbl_Factura] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Reservacion] ON 

INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (64, CAST(N'2020-01-27 08:00:00.000' AS DateTime), CAST(N'2020-01-27 09:00:00.000' AS DateTime), 1, 1, N'Jose Rene', N'#FF00FF', 300, N'Dolor Muscular', N'Dolor Muscular')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (65, CAST(N'2020-01-28 08:00:00.000' AS DateTime), CAST(N'2020-01-28 09:00:00.000' AS DateTime), 1, 1, N'Juan carlos', N'#008080', 300, N'DX: dolor lumbal', N'DX: dolor lumbal')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (66, CAST(N'2020-01-27 15:00:00.000' AS DateTime), CAST(N'2020-01-27 16:00:00.000' AS DateTime), 4, 1, N'Daniel', N'#008080', 250, N'Dolor Muscular', N'Dolor Muscular')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (67, CAST(N'2020-01-28 15:00:00.000' AS DateTime), CAST(N'2020-01-28 16:00:00.000' AS DateTime), 1, 1, N'René', N'#008080', 200, N'Parálisis facial', N'Parálisis facial')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (68, CAST(N'2020-01-29 08:00:00.000' AS DateTime), CAST(N'2020-01-29 09:00:00.000' AS DateTime), 2, 1, N'Wilmer', N'#008080', 300, N'Dolor Muscular', N'Dolor Muscular')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (69, CAST(N'2020-01-30 08:00:00.000' AS DateTime), CAST(N'2020-01-30 09:00:00.000' AS DateTime), 3, 1, N'Juan', N'#FF00FF', 250, N'Parálisis facial', N'Parálisis facial')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (70, CAST(N'2020-01-31 08:00:00.000' AS DateTime), CAST(N'2020-01-31 09:00:00.000' AS DateTime), 2, 1, N'Wilmer', N'#FFD700', 250, N'Dolor lumbal', N'Dolor lumbal')
INSERT [dbo].[Tbl_Reservacion] ([Cod_Reservacion], [Fecha], [Fecha_Reservacion], [Cod_Paciente], [Cod_Fisioterapeuta], [TituloEvent], [Cod_Color], [Total], [Padecimiento], [Descripcion_Pade]) VALUES (71, CAST(N'2020-01-28 10:00:00.000' AS DateTime), CAST(N'2020-01-28 11:00:00.000' AS DateTime), 1, 1, N'jose', N'#008080', 300, N'Dolor Muscular', N'Dolor Muscular')
SET IDENTITY_INSERT [dbo].[Tbl_Reservacion] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Cod_Usuario], [Correo], [Contraseña], [Nombre]) VALUES (1, N'Wilmer', N'123', NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Cat_Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Categorias_Estado] FOREIGN KEY([Cod_Estado])
REFERENCES [dbo].[Estado] ([Cod_Estado])
GO
ALTER TABLE [dbo].[Cat_Categorias] CHECK CONSTRAINT [FK_Cat_Categorias_Estado]
GO
ALTER TABLE [dbo].[Cat_Especialidad]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Especialidad_Estado] FOREIGN KEY([Cod_Estado])
REFERENCES [dbo].[Estado] ([Cod_Estado])
GO
ALTER TABLE [dbo].[Cat_Especialidad] CHECK CONSTRAINT [FK_Cat_Especialidad_Estado]
GO
ALTER TABLE [dbo].[Cat_Fisioterapeuta]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Fisioterapeuta_Cat_Especialidad] FOREIGN KEY([Cod_Especialidad])
REFERENCES [dbo].[Cat_Especialidad] ([Cod_Especialidad])
GO
ALTER TABLE [dbo].[Cat_Fisioterapeuta] CHECK CONSTRAINT [FK_Cat_Fisioterapeuta_Cat_Especialidad]
GO
ALTER TABLE [dbo].[Cat_Fisioterapeuta]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Fisioterapeuta_Estado] FOREIGN KEY([Cod_Estado])
REFERENCES [dbo].[Estado] ([Cod_Estado])
GO
ALTER TABLE [dbo].[Cat_Fisioterapeuta] CHECK CONSTRAINT [FK_Cat_Fisioterapeuta_Estado]
GO
ALTER TABLE [dbo].[Cat_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Paciente_Cat_Sexo] FOREIGN KEY([Cod_Sexo])
REFERENCES [dbo].[Cat_Sexo] ([Cod_Sexo])
GO
ALTER TABLE [dbo].[Cat_Paciente] CHECK CONSTRAINT [FK_Cat_Paciente_Cat_Sexo]
GO
ALTER TABLE [dbo].[Cat_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Paciente_Estado] FOREIGN KEY([Cod_Estado])
REFERENCES [dbo].[Estado] ([Cod_Estado])
GO
ALTER TABLE [dbo].[Cat_Paciente] CHECK CONSTRAINT [FK_Cat_Paciente_Estado]
GO
ALTER TABLE [dbo].[Cat_Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Servicios_Cat_Categorias] FOREIGN KEY([Cod_Cate])
REFERENCES [dbo].[Cat_Categorias] ([Cod_Cate])
GO
ALTER TABLE [dbo].[Cat_Servicios] CHECK CONSTRAINT [FK_Cat_Servicios_Cat_Categorias]
GO
ALTER TABLE [dbo].[Cat_Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Servicios_Estado] FOREIGN KEY([Cod_Estado])
REFERENCES [dbo].[Estado] ([Cod_Estado])
GO
ALTER TABLE [dbo].[Cat_Servicios] CHECK CONSTRAINT [FK_Cat_Servicios_Estado]
GO
ALTER TABLE [dbo].[Tbl_DetalleFact]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DetalleFact_Tbl_Factura] FOREIGN KEY([Num_Fact])
REFERENCES [dbo].[Tbl_Factura] ([Num_Fact])
GO
ALTER TABLE [dbo].[Tbl_DetalleFact] CHECK CONSTRAINT [FK_Tbl_DetalleFact_Tbl_Factura]
GO
ALTER TABLE [dbo].[Tbl_DetalleFact]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DetalleFact_Tbl_Reservacion] FOREIGN KEY([Cod_Reservacion])
REFERENCES [dbo].[Tbl_Reservacion] ([Cod_Reservacion])
GO
ALTER TABLE [dbo].[Tbl_DetalleFact] CHECK CONSTRAINT [FK_Tbl_DetalleFact_Tbl_Reservacion]
GO
ALTER TABLE [dbo].[Tbl_DetalleReservacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DetalleReservacion_Cat_Servicios] FOREIGN KEY([Cod_Servicio])
REFERENCES [dbo].[Cat_Servicios] ([Cod_Servicio])
GO
ALTER TABLE [dbo].[Tbl_DetalleReservacion] CHECK CONSTRAINT [FK_Tbl_DetalleReservacion_Cat_Servicios]
GO
ALTER TABLE [dbo].[Tbl_DetalleReservacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DetalleReservacion_Tbl_Reservacion] FOREIGN KEY([Cod_Reservacion])
REFERENCES [dbo].[Tbl_Reservacion] ([Cod_Reservacion])
GO
ALTER TABLE [dbo].[Tbl_DetalleReservacion] CHECK CONSTRAINT [FK_Tbl_DetalleReservacion_Tbl_Reservacion]
GO
ALTER TABLE [dbo].[Tbl_DetallesAsisgnacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DetallesAsisgnacion_Tbl_AsignacionPrecio] FOREIGN KEY([Cod_precio])
REFERENCES [dbo].[Tbl_AsignacionPrecio] ([Cod_precio])
GO
ALTER TABLE [dbo].[Tbl_DetallesAsisgnacion] CHECK CONSTRAINT [FK_Tbl_DetallesAsisgnacion_Tbl_AsignacionPrecio]
GO
ALTER TABLE [dbo].[Tbl_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Factura_Cat_Fisioterapeuta] FOREIGN KEY([Cod_Fisioterapeuta])
REFERENCES [dbo].[Cat_Fisioterapeuta] ([Cod_Fisioterapeuta])
GO
ALTER TABLE [dbo].[Tbl_Factura] CHECK CONSTRAINT [FK_Tbl_Factura_Cat_Fisioterapeuta]
GO
ALTER TABLE [dbo].[Tbl_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Factura_Cat_Paciente] FOREIGN KEY([Cod_Paciente])
REFERENCES [dbo].[Cat_Paciente] ([Cod_Paciente])
GO
ALTER TABLE [dbo].[Tbl_Factura] CHECK CONSTRAINT [FK_Tbl_Factura_Cat_Paciente]
GO
ALTER TABLE [dbo].[Tbl_Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reservacion_Cat_Fisioterapeuta] FOREIGN KEY([Cod_Fisioterapeuta])
REFERENCES [dbo].[Cat_Fisioterapeuta] ([Cod_Fisioterapeuta])
GO
ALTER TABLE [dbo].[Tbl_Reservacion] CHECK CONSTRAINT [FK_Tbl_Reservacion_Cat_Fisioterapeuta]
GO
ALTER TABLE [dbo].[Tbl_Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reservacion_Cat_Paciente1] FOREIGN KEY([Cod_Paciente])
REFERENCES [dbo].[Cat_Paciente] ([Cod_Paciente])
GO
ALTER TABLE [dbo].[Tbl_Reservacion] CHECK CONSTRAINT [FK_Tbl_Reservacion_Cat_Paciente1]
GO
ALTER TABLE [dbo].[Tbl_Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reservacion_Tbl_ColorEvento] FOREIGN KEY([Cod_Color])
REFERENCES [dbo].[Tbl_ColorEvento] ([Cod_Color])
GO
ALTER TABLE [dbo].[Tbl_Reservacion] CHECK CONSTRAINT [FK_Tbl_Reservacion_Tbl_ColorEvento]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRoles_Roles] FOREIGN KEY([Cod_Roles])
REFERENCES [dbo].[Roles] ([Cod_Roles])
GO
ALTER TABLE [dbo].[UsuarioRoles] CHECK CONSTRAINT [FK_UsuarioRoles_Roles]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRoles_Usuarios] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuarios] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[UsuarioRoles] CHECK CONSTRAINT [FK_UsuarioRoles_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [Clinica ] SET  READ_WRITE 
GO
