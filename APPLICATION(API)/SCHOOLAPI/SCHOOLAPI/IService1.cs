﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace SCHOOLAPI
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "/stream/add", BodyStyle = WebMessageBodyStyle.Bare)]
        string AddSTREAM(Streamdet streamInfo);

        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
    }
    public class Streamdet
    {
        [DataMember]
        public string StreamCode { get; set; }

        [DataMember]
        public string Username { get; set; }

        [DataMember]
        public string TerminalType { get; set; }

        [DataMember]
        public string Timestamp { get; set; }

        [DataMember]
        public string BusinessKey { get; set; }

        [DataMember]
        public string AccessKey { get; set; }

        [DataMember]
        public string TerminalID { get; set; }

        [DataMember]
        public string StreamName { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string MiddleName { get; set; }

        [DataMember]
        public string LastName { get; set; }

       
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
