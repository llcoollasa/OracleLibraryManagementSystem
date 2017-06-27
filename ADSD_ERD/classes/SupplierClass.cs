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
        private string job_role;

        public string JobRole
        {
            get { return job_role; }
            set { job_role = value; }
        }
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private bool availability;

        public bool Availability
        {
            get { return availability; }
            set { availability = value; }
        }

        private DB db = null;
        public SupplierClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO staff(sid, name, job_role, type, availability) " +
                "VALUES(" + this.sup_id + ", '" + this.name + "', '" + this.job_role + "', '" + this.type + "', " + this.availability + ")";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE staff SET name = '" + this.name + "', job_role='" + this.job_role + "', type='" + this.type +
                "', availability=" + this.availability + " WHERE sup_id = " + this.sup_id;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE FROM staff WHERE sup_id = " + this.sup_id;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM staff WHERE sup_id = " + this.sup_id;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                this.name = dt.Rows[0].Field<String>("name");
                this.job_role = dt.Rows[0].Field<String>("job_role");
                this.type = dt.Rows[0].Field<String>("type");
                this.availability = dt.Rows[0].Field<Boolean>("availability");
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM staff";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM staff WHERE ";
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
                    supplier.JobRole = item.Field<String>("job_role");
                    supplier.Type = item.Field<String>("type");
                    supplier.Availability = item.Field<bool>("availability");
                    clientCollection.Add(supplier);
                }
            }
            return clientCollection;
        }

    }
}
