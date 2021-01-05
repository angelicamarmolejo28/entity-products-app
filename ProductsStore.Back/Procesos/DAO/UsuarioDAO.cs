using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductsStore.Back.Procesos.DAO
{
    internal class UsuarioDAO
    {
        private string Conexion= ConfigurationManager.ConnectionStrings["SQLConection"].ConnectionString;

        internal string ValidarUsuario(string UserName, string Pass)
        {
            string respuesta = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                string sentencia = "exec Products_User_Loguin 1,'"+UserName+"','"+Pass+"'";
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
    }
}
