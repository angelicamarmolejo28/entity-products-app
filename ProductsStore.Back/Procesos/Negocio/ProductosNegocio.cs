using ProductsStore.Back.Procesos.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductsStore.Back.Procesos.Negocio
{
    internal class ProductosNegocio
    {
        internal string CrearProducto(string Nombre, string Descripcion, string Categoria, string Disponibilidad, int Precio, string ImagenURL)
        {
            return new ProductosDAO().CrearProducto(Nombre, Descripcion, Categoria, Disponibilidad, Precio, ImagenURL);
        }

        internal int ValidarCodigo()
        {
            return new ProductosDAO().ValidarCodigo();
        }
    }
}
