using ProductsStore.Back.Procesos.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductsStore.Back.Fachada
{
    public class Fachada
    {
        public string ValidarUsuario(string UserName, string Pass)
        {
            return new UsuarioNegocio().ValidarUsuario(UserName, Pass);
        }
    }
}
