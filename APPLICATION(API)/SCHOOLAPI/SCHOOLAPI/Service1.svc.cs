using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;

using System.Data.SqlClient;
using SCHOOLAPI.GLOBAL_CLASS;


namespace SCHOOLAPI
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public string AddSTREAM(Streamdet streamInfo)
        {
            string response = string.Empty;

            try
            {
                bool proceed = false;

                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(Convert.ToString(streamInfo.BusinessKey)) == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("BusinessKey"); } else { proceed = true; }
               // if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(Convert.ToString(streamInfo.AccessKey)) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("AccessKey"); } else { proceed = true; }
                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(Convert.ToString(streamInfo.TerminalID)) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("TerminalID"); } else { proceed = true; }
                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(streamInfo.Timestamp) == true && proceed == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("TimeStamp"); } else { proceed = true; }

                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(Customerinfo.Username) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("User Name"); } else { proceed = true; }
               // if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(streamInfo.FirstName) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("First Name"); } else { proceed = true; }
               // if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(streamInfo.MiddleName) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("Middle Name"); } else { proceed = true; }
                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(streamInfo.LastName) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("Last Name"); } else { proceed = true; }
                //if (GLOBAL_CLASS.GLOBAL_PARAMETERS.CheckEmpty(streamInfo.MPhoneNumber) == true && proceed == true) { proceed = false; response = GLOBAL_PARAMETERS.IsMissing("Phone Number Name"); } else { proceed = true; }

                if (proceed == true)
                {
                    SqlConnection con = new SqlConnection(CONNECTION_CLASS.mine);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("streamdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    cmd.Parameters.AddWithValue("@StremeID", "0");
                    cmd.Parameters.AddWithValue("@StremeCode", streamInfo.StremeCode);
                    cmd.Parameters.AddWithValue("@StreamName", streamInfo.StreamName);
                    cmd.Parameters.AddWithValue("@MiddleName", streamInfo.MiddleName);             
                    cmd.Parameters.AddWithValue("@Username", streamInfo.Username);
                    cmd.Parameters.AddWithValue("@IsUpdate", false);
                    cmd.Parameters.AddWithValue("@Valid", true);
                   cmd.Parameters.AddWithValue("@transactioncode", streamInfo.GenerateTransactionCode());
                    cmd.Parameters.AddWithValue("@PageUrl", GLOBAL_CLASS.GLOBAL_PARAMETERS.GetterminalType(Convert.ToString(streamInfo.TerminalType)));
                    cmd.Parameters.AddWithValue("@PageName", GLOBAL_CLASS.GLOBAL_PARAMETERS.GetPageUlr());

                    cmd.Parameters.AddWithValue("@CompanyID", GLOBAL_CLASS.GLOBAL_PARAMETERS.GetCompanyID(Convert.ToString(streamInfo.BusinessKey)));
                    cmd.Parameters.AddWithValue("@BranchID", GLOBAL_CLASS.GLOBAL_PARAMETERS.GetBranchID(Convert.ToString(streamInfo.AccessKey)));
                    cmd.Parameters.AddWithValue("@IpAddress", membershipInfo.TerminalID);
                    cmd.Parameters.AddWithValue("@InterfaceDatetime", GLOBAL_CLASS.GLOBAL_PARAMETERS.ExtractTimeStamp(streamInfo.Timestamp));
                    DataTable table = new DataTable();
                    using (var da = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        da.Fill(table);
                    }
                    con.Close(); con.Dispose();
                    response = JSSONClass.DataTableToJSOON(table);
                }

            }
            catch (Exception ex)

            {
                response = GLOBAL_PARAMETERS.OperationFailedResponse(ex.Message);

            }
            return response.Replace("]", string.Empty).Replace("[", string.Empty);
        }
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
