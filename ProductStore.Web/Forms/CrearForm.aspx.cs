using ProductsStore.Back.Fachada;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductStore.Web.Forms
{
    public partial class CrearForm : System.Web.UI.Page
    {
        private string ImagenDataURL64 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            alertVal.Visible = false;
            if (new Utils.Utils().sesionCerrada()) return;
            txtCodProd.Enabled = false;

            txtCodProd.Text = Convert.ToString(new Fachada().ValidarCodigo());
            lbtnCrearProducto.Visible = false;
        }

        protected void lbtnCrearProducto_Click(object sender, EventArgs e)
        {
            
            if (ImagenCargada.ImageUrl=="")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "Por favor cargar la imagen del producto.";
            }
            else if (txtNombre.Text == "")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "El campo Nombre de Producto es Obligatorio Ingresarlo.";
            } else if (txtDescr.Text == "")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "El campo Descripcion del Producto es Obligatorio Ingresarlo.";
            } else if (ddlCategoria.SelectedItem.Text == "Seleccione una Categoria")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "Seleccione una Categoría Válida";
            } else if (ddlDisponibilidad.SelectedItem.Text == "Seleccione Disponibilidad")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "Seleccione si el Producto es Disponible o no";
            } else if (txtPrecio.Text == "")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "El campo Precio de Producto es Obligatorio Ingresarlo.";
            } else if (txtPrecio.Text == "e")
            {
                alertVal.Visible = true;
                lblAlerta.Text = "Ingrese un Precio válido para el Producto.";
            }
            else
            {

                string respuesta = new Fachada().CrearProducto(txtNombre.Text.Trim(), txtDescr.Text.Trim(), ddlCategoria.SelectedItem.Text, ddlDisponibilidad.SelectedItem.Text, Convert.ToInt32(txtPrecio.Text), ImagenDataURL64);

                alertVal.Visible = true;
                lblAlerta.Text = respuesta;

                txtNombre.Text = string.Empty;
                txtDescr.Text = string.Empty;
                txtPrecio.Text = string.Empty;
                ddlCategoria.SelectedIndex = 0;
                ddlDisponibilidad.SelectedIndex = 0;
                lbtnSubir.Visible = true;
                lbtnCrearProducto.Visible = false;
            }

        }

        protected void lbtnSubir_Click(object sender, EventArgs e)
        {
            int TamañoImagen = FileUpload1.PostedFile.ContentLength;
            byte[] ImagenOrginal = new byte[TamañoImagen];

            FileUpload1.PostedFile.InputStream.Read(ImagenOrginal, 0, TamañoImagen);

            Bitmap ImagenBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);

            ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOrginal);

            ImagenCargada.ImageUrl = ImagenDataURL64;

            lbtnCrearProducto.Visible = true;
            lbtnSubir.Visible = false;
        }
    }
}