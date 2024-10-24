
GO
/****** Object:  Table [dbo].[AuditoriaClientes]    Script Date: 24/10/2024 18:48:31 ******/
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
/****** Object:  Table [dbo].[clientes]    Script Date: 24/10/2024 18:48:31 ******/
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
/****** Object:  Table [dbo].[Direcciones]    Script Date: 24/10/2024 18:48:31 ******/
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
/****** Object:  Table [dbo].[Documentos]    Script Date: 24/10/2024 18:48:31 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 24/10/2024 18:48:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuditoriaClientes] ON 

INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (2, 1, N'nombre', N'Darwin', N'DarwinNuevo', CAST(N'2024-10-23T19:23:56.190' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (3, 1011, N'nombre', N'KARLA DANIELA REYES FUENTES', N'KARLA DANIELA REYES FUENTES DE AYALS', CAST(N'2024-10-24T05:31:46.590' AS DateTime), 3)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (4, 1010, N'telefono', N'12345678', N'202012045', CAST(N'2024-10-24T05:32:38.267' AS DateTime), 3)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (5, 1010, N'direccion', N'Calle Falsa 123', N'aVENIDA SAN SALVADOR CALLE ORIENTE', CAST(N'2024-10-24T05:32:38.277' AS DateTime), 3)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (6, 1008, N'nombre', N'NANCY FERNANDEZ', N'NANCY FERNANDEZ JUAREZ GALDAMEZ', CAST(N'2024-10-24T05:35:02.570' AS DateTime), 3)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (7, 2, N'direccion', N'La Paz', N'La Paz, Santiago Nonualco', CAST(N'2024-10-24T05:47:20.767' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (49, 1013, N'Descripcion_direccion', N'SOYAPANGO', N'SOYAPANGO NUEVO', CAST(N'2024-10-24T13:02:00.587' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (50, 1013, N'Descripcion_direccion', N'SANTA TECLA', N'SANTA TECLA  RENE', CAST(N'2024-10-24T13:02:09.260' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (51, 1013, N'Descripcion_direccion', N'sad', N'LA LIBERTAD', CAST(N'2024-10-24T13:02:16.587' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (70, 1013, N'Descripcion_direccion', N'SOYAPANGO NUEVO', N'SOYAPANGO NUEVO s', CAST(N'2024-10-24T13:08:22.020' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (71, 1013, N'Descripcion_direccion', N'SOYAPANGO NUEVO s', N'SOYAPANGO SUR', CAST(N'2024-10-24T13:08:39.260' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (72, 1011, N'Descripcion_direccion', N'NUEVA CALLE', N'NUEVA CALLE SA', CAST(N'2024-10-24T13:08:46.643' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (73, 1009, N'Descripcion_direccion', N'DIRECCI�N', N'DIRECCI�N NUEVA', CAST(N'2024-10-24T13:09:06.517' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (74, 2, N'Descripcion_direccion', N'San salvador, avenida', N'San salvador, avenida 2025', CAST(N'2024-10-24T13:54:23.370' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (75, 1011, N'TipoDocumento', N'DUI', N'NIT', CAST(N'2024-10-24T16:37:04.260' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (76, 1011, N'NumeroDocumento', N'201245454', N'66054545454', CAST(N'2024-10-24T16:37:04.273' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (77, 1011, N'TipoDocumento', N'DUI', N'PASAPORTE', CAST(N'2024-10-24T16:37:13.847' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (78, 1011, N'NumeroDocumento', N'201245454', N'3055454545454', CAST(N'2024-10-24T16:37:13.853' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (79, 1011, N'TipoDocumento', N'DUI', N'0', CAST(N'2024-10-24T16:47:37.453' AS DateTime), 1)
INSERT [dbo].[AuditoriaClientes] ([AuditoriaId], [ClienteId], [CampoModificado], [ValorAnterior], [ValorNuevo], [FechaModificacion], [UsuarioId]) VALUES (80, 1011, N'TipoDocumento', N'0', N'NIT', CAST(N'2024-10-24T16:47:43.627' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AuditoriaClientes] OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1, N'DARWIN ALFONSO FLORES COLINDRES', N'darwin@gmail.com', N'20250501', N'2120545454', N'San juan talpa')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (2, N'JOSE ANTONIO FLORES RAMIREZ', N'jose@gmail.com', N'202104058', N'25210212-0', N'La Paz, Santiago Nonualco')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (5, N'MARCOS ANTONIO', N'marcos@gmail.com', N'20504201', N'00054545-4', N'San Salvador')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (6, N'FERNANDO ANTONIO CONTRERAS FUENTES', N'coore@gmail.com', N'210245454', N'65454545', N'SAN SALVADOR')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1004, N'Ana L�pez', N'analopez@example.com', N'5558765', N'05060419-1', N'Calle Nueva 456')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1005, N'DANIEL ALEXANDER VALLADARES MARTINEZ', N'DANIEL.ALEXANDER@nuevoemail.com', N'20507888', N'09088947-0', N'Calle Actualizada NUEVA SAN LA LIBERTAD ESTE')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1006, N'MAURICIO ANTONIO JUAREZ MARTINEZ', N'MAURICIO.ANTONIO@nuevoemail.com', N'5551234', N'87210210-0', N'Calle Actualizada NUEVA SAN SALVADOR')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1007, N'RENE ANTONIO GARC�A', N'RENE.ANTONIO@nuevoemail.com', N'5551234', N'87210210-0', N'Calle Actualizada NUEVA CASA')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1008, N'NANCY FERNANDEZ JUAREZ GALDAMEZ', N'NANCY.FERNANDEZ@nuevoemail.com', N'5551234', N'555123402-0', N'Calle Actualizada 205454')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1009, N'Roxana Fuente', N'roxana.perez@nuevoemail.com', N'5551234', N'555123402-0', N'Calle Actualizada 789')
INSERT [dbo].[clientes] ([clienteId], [nombre], [correo], [telefono], [documento], [direccion]) VALUES (1011, N'KARLA DANIELA REYES FUENTES DE AYALS', N'karla.daniela@gmail.com', N'20652505', N'20125454-0', N'Avenida alberto masferrer, calle principal')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Direcciones] ON 

INSERT [dbo].[Direcciones] ([DireccionId], [ClienteId], [Descripcion_direccion]) VALUES (1, 1, N'Calle 123, Colonia X, Ciudad Y, Edificio Z, Apartamento 45, Segundo piso')
INSERT [dbo].[Direcciones] ([DireccionId], [ClienteId], [Descripcion_direccion]) VALUES (12, 1011, N'NUEVA CALLE SA')
INSERT [dbo].[Direcciones] ([DireccionId], [ClienteId], [Descripcion_direccion]) VALUES (13, 1009, N'DIRECCI�N NUEVA')
INSERT [dbo].[Direcciones] ([DireccionId], [ClienteId], [Descripcion_direccion]) VALUES (16, 2, N'San salvador, avenida 2025')
SET IDENTITY_INSERT [dbo].[Direcciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Documentos] ON 

INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (1, 1011, N'DUI', N'201245454')
INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (2, 1011, N'PASAPORTE', N'3055454545454')
INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (3, 1011, N'NIT', N'66054545454')
INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (4, 1011, N'NIT', N'2015454')
INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (5, 1011, N'OTRO', N'06545454-0')
INSERT [dbo].[Documentos] ([DocumentoId], [ClienteId], [TipoDocumento], [NumeroDocumento]) VALUES (6, 1009, N'OTRO', N'540545454')
SET IDENTITY_INSERT [dbo].[Documentos] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([usuarioId], [nombre], [correo], [user_name], [clave]) VALUES (1, N'JUAN RENE JACOBO BENAVIDES', N'juanrene.benavides@gmail.com', N'rene', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=')
INSERT [dbo].[usuarios] ([usuarioId], [nombre], [correo], [user_name], [clave]) VALUES (2, N'JOSE LOPEZ', N'jose@gmail.com', N'jose', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=')
INSERT [dbo].[usuarios] ([usuarioId], [nombre], [correo], [user_name], [clave]) VALUES (3, N'JONATHAN ALBERTO LOPEZ FUENTES', N'dfd@g.com', N'jorge', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=')
INSERT [dbo].[usuarios] ([usuarioId], [nombre], [correo], [user_name], [clave]) VALUES (1002, N'GERSON ANTONIO FLORES', N'gerson@gmail.com', N'gerson', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=')
INSERT [dbo].[usuarios] ([usuarioId], [nombre], [correo], [user_name], [clave]) VALUES (1003, N'LUIS COLINDRES', N'luis@gmail.com', N'luis', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__2A586E0B026A1BBD]    Script Date: 24/10/2024 18:48:32 ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__9AFF8FC692E34B08]    Script Date: 24/10/2024 18:48:32 ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
select * from usuarios