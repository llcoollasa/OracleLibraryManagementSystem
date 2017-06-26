using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class Client
    {
        private Int32 cid;

        public Int32 Cid
        {
            get { return cid; }
            set { cid = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string add_no;

        public string AddNo
        {
            get { return add_no; }
            set { add_no = value; }
        }
        private string add_line;

        public string AddLine
        {
            get { return add_line; }
            set { add_line = value; }
        }
        private string city;

        public string City
        {
            get { return city; }
            set { city = value; }
        }

    }
}