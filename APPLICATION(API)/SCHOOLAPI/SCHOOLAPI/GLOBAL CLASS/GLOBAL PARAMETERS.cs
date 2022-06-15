using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace TENTE_API.GLOBAL_CLASS
{
    public class GLOBAL_PARAMETERS
    {
        public static string GetCompanyID(string BusinessKey)
        {
            string CompanyID = "1";
            return CompanyID;
        }

        public static string GetPageUlr()
        {
            string PageUlr = "API";
            return PageUlr;
        }
        public static string GetterminalType(string TerminalType)
        {
            string Terminal = "Url";
            return Terminal;
        }
        public static string GetBranchID(string AccessKey)
        {
            string BranchID = "1";
            return BranchID;
        }
        public static DateTime ExtractDateout(string DateOut)
        {
            string FormatString = "yyyyMMdd";
            DateTime dt = DateTime.ParseExact(DateOut, FormatString, null);
            return dt;
        }
        public static DateTime ExtractTimeStamp(string TimeStamp)
        {
            string FormatString = "yyyyMMddHHmmss";
            DateTime dt = DateTime.ParseExact(TimeStamp, FormatString, null);
            return dt;
        }
        public static bool CheckEmpty(string myinput)
        {
            bool isempty = true;

            if (myinput == string.Empty || myinput == null || myinput == "" || myinput.Length == 0)


            {
                isempty = true;
            }
            else
            {
                isempty = false;
            }
            return isempty;
        }

        public static bool CheckIsEmail(string mail)
        {
            bool IsEmail = true;

            string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";

            var regex = new Regex(pattern, RegexOptions.IgnoreCase);

            if (regex.IsMatch(mail))
            {
                IsEmail = true;
            }
            else
            {
                IsEmail = false;
            }
            return IsEmail;
        }


        public static string IsMissing(string work)
        {
            string _response = "{\"ResponseCode\":\"700\",\"Response Description\":\"" + work + "\" Is Missing\"}";
            return _response;
        }
        public static string OperationFailedResponse(string failurInformation)
        {
            string _response = "{\"ResponseCode\":\"005\",\"Response Description\":\"" + failurInformation + "\" Is Missing\"}";
            return _response;
        }
        public static string InvalidEmail(string Invalid)
        {
            string _response = "{\"ResponseCode\":\"005\",\"Response Description\":\"" + Invalid + "\" Is invalid\"}";
            return _response;
        }
    }
}