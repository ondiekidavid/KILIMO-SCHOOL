using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace TENTE_API
{
    public class CONNECTION_CLASS
    {
        public static string mine = ConfigurationManager.ConnectionStrings["CHURCH"].ConnectionString.ToString();
    }
}