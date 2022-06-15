using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TENTE_API
{
    public class TransactionCode
    {
        public static string GenerateTransactionCode()
        {
            Random r = new Random();
            //Or Passing in a seed value
            Random r2 = new Random(65);
            var mycode = r2.NextDouble();
            return mycode.ToString();
        }
    }
}