<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearForm.aspx.cs" Inherits="ProductStore.Web.Forms.CrearForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="container col-4">
				  <div class="alert alert-warning alert-dismissible" role="alert" runat="server" id="alertVal">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Allerta!</strong> <asp:Label ID="lblAlerta" runat="server" Text=""></asp:Label>
            </div>
			</div>
          

			<ol class="breadcrumb">
				<li><a href="Index.aspx">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Panel de Control</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Control del Sistema</h1>
			</div>
		</div><!--/.row-->

			<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="height:600px">
					<div class="panel-heading">
						Formulario para Crear un Nuevo Producto
						
					</div>
					<div class="container-fluid" style="display:flex;margin-top:3%">
						<div class="col-2" style="display:flex">
							<asp:Label ID="Label7" runat="server" Text="Código del Producto: "></asp:Label>&nbsp
                            <asp:Label ID="lblCodProd" runat="server" Text=""></asp:Label>
						</div>
						<div class="col-4" style="display:flex">
							<asp:Label ID="Label2" runat="server" Text="Nombre Producto:"></asp:Label>&nbsp
                            <asp:TextBox ID="txtNombre" CssClass="form-control" Placeholder="Ingrese Nombre del Producto" runat="server"></asp:TextBox>
						</div>
						<div class="col-6" style="display:flex">
							<asp:Label ID="Label3" runat="server" Text="Descripción Producto:"></asp:Label>&nbsp
							<asp:TextBox ID="txtDescr" CssClass="form-control" Placeholder="Ingrese Descripción del producto del Producto" runat="server"></asp:TextBox>
						</div>
						
					</div>
					<div class="container-fluid" style="display:flex;margin-top:3%">
						<div class="col-6" style="display:flex">
                            <asp:Label ID="Label1" runat="server" Text="Seleccione Categoria"></asp:Label>&nbsp
                            <asp:DropDownList ID="ddlCategoria" CssClass="form-control" runat="server">
								<asp:ListItem Value="0">Seleccione una Categoria</asp:ListItem>
								<asp:ListItem Value="1">Audio y Video</asp:ListItem>
								<asp:ListItem Value="2">Electrodomésticos</asp:ListItem>
								<asp:ListItem Value="3">Celulares</asp:ListItem>
								<asp:ListItem Value="3">Otros</asp:ListItem>
                            </asp:DropDownList>

						</div>
						<div class="col-3" style="display:flex">
							<asp:Label ID="Label4" runat="server" Text="Seleccione Disponibilidad"></asp:Label>&nbsp
                            <asp:DropDownList ID="ddlDisponibilidad" CssClass="form-control" runat="server">
								<asp:ListItem Value="0">Seleccione Disponiblidad</asp:ListItem>
								<asp:ListItem Value="1">Si</asp:ListItem>
								<asp:ListItem Value="2">No</asp:ListItem>
                            </asp:DropDownList>
						</div>
						<div class="col-3" style="display:flex">
							<asp:Label ID="Label5" runat="server" Text="Precio del Producto:"></asp:Label>&nbsp
                             <asp:TextBox ID="txtPrecio" TextMode="Number" CssClass="form-control" PlaceHolder="Ingrese Precio del Producto" runat="server"></asp:TextBox>
						</div>
					</div>
					<div class="container-fluid" style="display:flex;margin-top:3%">
						<div class="col-6">
                            <asp:Image ID="ImagenCargada" class="img-rounded"  runat="server" />
						</div>
						<div class="col-6" style="display:flex">
							<asp:Label ID="Label6" runat="server" Text="Seleccione Imagen:"></asp:Label>&nbsp
                            <asp:FileUpload ID="FileUpload1" CssClass="form-control" accept=".jpg" runat="server" />
						</div>
						
					</div>
					<div class="container col-2" style="margin-top:3%">
						
                        <asp:LinkButton ID="lbtnCrearProducto" CssClass="btn btn-success btn-block" OnClick="lbtnCrearProducto_Click" runat="server"><i class="fas fa-plus-square"></i> Crear Producto</asp:LinkButton>
					</div>


					
				</div>
			</div>
		</div><!--/.row-->

		</div>
</asp:Content>
