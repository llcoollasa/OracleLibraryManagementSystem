using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class SupplierClass
    {
        private Int32 sup_id;

        public Int32 SupplierId
        {
            get { return sup_id; }
            set { sup_id = value; }
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
        public SupplierClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO supplier(sup_id, name, add_no, add_line, city) " +
                "VALUES('', '" + this.name + "', '" + this.add_no + "', '" + this.add_line + "', '" + this.city + "')";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE supplier SET name = '" + this.name + "', add_no='" + this.add_no + "', add_line='" + this.add_line +
                "', city=" + this.city + " WHERE sup_id = " + this.sup_id;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE FROM supplier WHERE sup_id = " + this.sup_id;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM supplier WHERE sup_id = " + this.sup_id;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                this.name = dt.Rows[0].Field<String>("name");
                this.add_no = dt.Rows[0].Field<String>("add_no");
                this.add_line = dt.Rows[0].Field<String>("add_line");
                this.city = dt.Rows[0].Field<String>("city");
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM supplier";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM supplier WHERE ";
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
                    SupplierClass supplier = new SupplierClass();
                    supplier.SupplierId = item.Field<Int32>("sup_id");
                    supplier.Name = item.Field<String>("name");
                    supplier.AddNo = item.Field<String>("add_no");
                    supplier.AddLine = item.Field<String>("add_line");
                    supplier.City = item.Field<String>("city");
                    clientCollection.Add(supplier);
                }
            }
            return clientCollection;
        }

    }
}
