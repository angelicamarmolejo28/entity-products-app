using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductsStore.Back.Procesos.DAO
{
    internal class ProductosDAO
    {
        private string Conexion = ConfigurationManager.ConnectionStrings["SQLConection"].ConnectionString;

        internal string CrearProducto(string Nombre, string Descripcion, string Categoria, string Disponibilidad, int Precio, string ImagenURL)
        {
            string respuesta = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                string sentencia = "exec Products_Prod_CRUD 1,'" + Nombre + "','" + Descripcion + "','"+Categoria+"','"+Disponibilidad+"','"+Precio+"','"+ImagenURL+"'";
                SqlCommand cmd = new SqlCommand(sentencia, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    respuesta = rdr[0] == DBNull.Value ? "" : rdr.GetString(0).Trim();
                }
                return respuesta;
            }
        }

        internal int ValidarCodigo()
        {
            int cod = 0;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                string sentencia = "exec Products_Prod_CRUD 2,'','','','','',''";
                SqlCommand cmd = new SqlCommand(sentencia, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    cod = rdr[0] == DBNull.Value ? 0 : rdr.GetInt32(0);
                }
                return cod;
            }
        }


    }
}
