using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class StaffClass
    {
        private Int32 sid;

        public Int32 StaffId
        {
            get { return sid; }
            set { sid = value; }
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
        public StaffClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO staff( name, job_role, type, availability) " +
                "VALUES( '" + this.name + "', '" + this.job_role + "', '" + this.type + "', " +  Convert.ToByte( this.availability )+ ")";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE staff SET name = '" + this.name + "', job_role='" + this.job_role + "', type='" + this.type +
                "', availability=" + Convert.ToByte(this.availability) + " WHERE sid = " + this.sid;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE FROM staff WHERE sid = " + this.sid;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM staff WHERE sid = " + this.sid;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                this.name = Convert.ToString(dt.Rows[0]["name"]);
                this.job_role = Convert.ToString(dt.Rows[0]["job_role"]);
                this.type = Convert.ToString(dt.Rows[0]["type"]);
                this.availability =Convert.ToBoolean( Convert.ToInt16(dt.Rows[0]["availability"]));
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
                    StaffClass staff = new StaffClass();
                    staff.StaffId = item.Field<Int32>("sid");
                    staff.Name = item.Field<String>("name");
                    staff.JobRole = item.Field<String>("job_role");
                    staff.Type = item.Field<String>("type");
                    staff.Availability = item.Field<bool>("availability");
                    clientCollection.Add(staff);
                }
            }
            return clientCollection;
        }

    }
}
