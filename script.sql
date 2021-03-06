USE [ProductsStoreDB]
GO
/****** Object:  Table [dbo].[Products_Prod]    Script Date: 15/01/2021 11:04:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Prod](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [varchar](50) NOT NULL,
	[DescriptionProduct] [varchar](200) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Available] [varchar](3) NOT NULL,
	[Price] [decimal](38, 2) NOT NULL,
	[ImagenProduct] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Products_Prod] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_User]    Script Date: 15/01/2021 11:04:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_User](
	[UserName] [varchar](15) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[LastName] [varchar](200) NOT NULL,
	[TypeUser] [varchar](5) NOT NULL,
	[StatusUser] [bit] NOT NULL,
	[EmailUser] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Products_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products_Prod] ON 

INSERT [dbo].[Products_Prod] ([IdProduct], [NameProduct], [DescriptionProduct], [Category], [Available], [Price], [ImagenProduct]) VALUES (2, N'Radio', N'Radio MP3, FM y USB', N'Audio y Video', N'Si', CAST(200000.00 AS Decimal(38, 2)), N'~//ImagenesProductos//radio.jpg')
SET IDENTITY_INSERT [dbo].[Products_Prod] OFF
GO
INSERT [dbo].[Products_User] ([UserName], [Password], [Name], [LastName], [TypeUser], [StatusUser], [EmailUser]) VALUES (N'Admin', N'12345', N'Administrador', N'Sistema', N'Admin', 1, N'admin@correo.com')
INSERT [dbo].[Products_User] ([UserName], [Password], [Name], [LastName], [TypeUser], [StatusUser], [EmailUser]) VALUES (N'User', N'54321', N'Usuario', N'Genérico', N'User', 1, N'user@correo.com')
GO
/****** Object:  StoredProcedure [dbo].[Products_Prod_CRUD]    Script Date: 15/01/2021 11:04:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Products_Prod_CRUD] (
  @opc int,
  @CodProd int,
  @Nombre varchar(50),
  @Descripcion varchar(200),
  @Categoria varchar(50),
  @Disponibilidad varchar(2),
  @Precio int,
  @Imagen varchar(200)
	)
AS

IF @opc=1 BEGIN

   INSERT INTO Products_Prod
   SELECT @Nombre, @Descripcion, @Categoria, @Disponibilidad, @Precio, @Imagen

   SELECT 'El producto se ha creado correctamente.'

END


IF @opc=2	BEGIN


   SELECT IdProduct+1 FROM Products_Prod

END

IF @opc=3 BEGIN

   IF EXISTS (SELECT '' FROM Products_Prod WHERE NameProduct like '%'+@Nombre+'%' or DescriptionProduct like '%'+@Nombre+'%' ) BEGIN

   SELECT TOP 1 * FROM Products_Prod where NameProduct like '%'+@Nombre+'%' or DescriptionProduct like '%'+@Nombre+'%'

   END ELSE BEGIN

   SELECT TOP 1 * FROM Products_Prod where  IdProduct=CONVERT(int, @Nombre) 

   END
END


IF @opc=4 BEGIN

    IF EXISTS (SELECT '' FROM Products_Prod WHERE IdProduct= @CodProd) BEGIN

	UPDATE Products_Prod
	SET NameProduct=@Nombre, DescriptionProduct=@Descripcion, Price=@Precio
	WHERE IdProduct=@CodProd

	SELECT 'Producto editado con éxito!'

	END ELSE BEGIN

	SELECT 'El producto no se encuentra o no existe!'

	END

END

IF @opc=5 BEGIN


   DELETE Products_Prod WHERE IdProduct=@CodProd

   SELECT 'Producto eliminado con éxito!'

END

IF @opc=6 BEGIN

  SELECT * FROM Products_Prod

END

IF @opc=7 BEGIN
  
  IF @Categoria='Lista completa' BEGIN

   SELECT * FROM Products_Prod 

  END ELSE BEGIN

    SELECT * FROM Products_Prod WHERE Category=@Categoria

  END

END
GO
/****** Object:  StoredProcedure [dbo].[Products_User_Loguin]    Script Date: 15/01/2021 11:04:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Products_User_Loguin](

@opc int,
@User varchar(15),
@Password varchar(15)

)
	
AS

IF @opc=1 BEGIN


    IF EXISTS (SELECT '' FROM Products_User WHERE UserName=@User AND Password=@Password AND StatusUser=1) BEGIN

	SELECT 'Acceso es permitido'

	END ELSE BEGIN

	SELECT 'Acceso Denegado'

	END

END

IF @opc=2 BEGIN


   SELECT * FROM Products_User WHERE UserName=@User AND Password=@Password AND StatusUser=1

END

GO
