using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace TENTE_API
{
    public class JSSONClass
    {
        public static string ConvertToJSON(SqlDataReader david)
        {
            string json = string.Empty;
            try
            {
                var dTable = new DataTable();
                dTable.Load(david);
                json = JsonConvert.SerializeObject(dTable);

            }
            catch (Exception)
            {
                json = "q wAinvalid";
            }
            return json;
        }
        public static string DataTableToJSOON(DataTable dTable)
        {
            string json = string.Empty;
            try
            {
                json = JsonConvert.SerializeObject(dTable);

            }
            catch (Exception)
            {
                json = "q wAinvalid";
            }
            return json;
        }
    }

}