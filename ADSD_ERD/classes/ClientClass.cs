using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class ClientClass 
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

        private DB db = null;
        public ClientClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO client(cid, name, add_no, add_line, city) " +
                "VALUES(" + this.cid + ", '" + this.name + "', '" + this.add_no + "', '" + this.add_line + "', '" + this.city + "')";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE client SET name = '" + this.name + "', add_no='" + this.add_no + "', add_line='" + this.add_line +
                "', city='" + this.city + "' WHERE cid = " + this.cid;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE FROM client WHERE cid = " + this.cid;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM client WHERE cid = " + this.cid;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                this.name = dt.Rows[0].Field<String>("first");
                this.add_no = dt.Rows[0].Field<String>("add_no");
                this.add_line = dt.Rows[0].Field<String>("add_line");
                this.city = dt.Rows[0].Field<String>("city");
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM client";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM client WHERE ";
            sql = this.db.prepareSearchSql(parameters, sql);
            return makeCollection(sql);
        }


        public ArrayList makeCollection(String sql)
        {
            ArrayList clientCollection = new ArrayList();
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            //add member to list
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ClientClass client = new ClientClass();
                    client.cid = item.Field<Int32>("cid");
                    client.name = item.Field<String>("name");
                    client.add_no = item.Field<String>("add_no");
                    client.add_line = item.Field<String>("add_line");
                    client.city = item.Field<String>("city");
                    clientCollection.Add(client);
                }
            }
            return clientCollection;
        }

    }
}