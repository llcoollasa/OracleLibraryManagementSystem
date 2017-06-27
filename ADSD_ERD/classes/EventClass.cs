using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class EventClass
    {
        private Int32 eid;

        public Int32 EventId
        {
            get { return eid; }
            set { eid = value; }
        }
        private ClientClass client;

        public ClientClass Client
        {
            get { return client; }
            set { client = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string number;

        public string Number
        {
            get { return number; }
            set { number = value; }
        }
        private DateTime date;

        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        private string location;

        public string Location
        {
            get { return location; }
            set { location = value; }
        }
        private Decimal project_cost;

        public Decimal ProjectCost
        {
            get { return project_cost; }
            set { project_cost = value; }
        }

        private DB db = null;
        public EventClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO event(cid, name, number, date, location, project_cost) " +
                "VALUES(" + this.Client.ClientId + ", '" + this.name + "', '" + this.number + "', '" + this.date + "', '" + this.location + "', " + this.project_cost + ")";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE event SET cid = " + this.Client.ClientId + ", name='" + this.name + "', number='" + this.number +
                "', date='" + this.date + "', location='" + this.location + "', project_cost=" + this.project_cost + " WHERE eid = " + this.eid;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE event event WHERE eid = " + this.eid;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM event WHERE eid = " + this.eid;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                //Assign Client
                this.Client = new ClientClass();
                this.Client.ClientId = dt.Rows[0].Field<Int32>("cid");
                this.Client.get();

                this.name = dt.Rows[0].Field<String>("name");
                this.number = dt.Rows[0].Field<String>("number");
                this.date = dt.Rows[0].Field<DateTime>("date");
                this.location = dt.Rows[0].Field<String>("location");
                this.project_cost = dt.Rows[0].Field<Decimal>("project_cost");
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM event";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM event WHERE ";
            sql = this.db.prepareSearchSql(parameters, sql);
            return makeCollection(sql);
        }


        public ArrayList makeCollection(String sql)
        {
            ArrayList eventCollection = new ArrayList();
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            //add member to list
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    EventClass eventcls = new EventClass();
                    eventcls.EventId = item.Field<Int32>("eid");

                    //Assign Client
                    eventcls.Client = new ClientClass();
                    eventcls.Client.ClientId = item.Field<Int32>("cid");
                    eventcls.Client.get();

                    eventcls.Name = item.Field<String>("name");
                    eventcls.Number = item.Field<String>("number");
                    eventcls.Date = item.Field<DateTime>("date");
                    eventcls.Location = item.Field<String>("location");
                    eventcls.ProjectCost = item.Field<Decimal>("project_cost");
                    eventCollection.Add(eventcls);

                }
            }
            return eventCollection;
        }

    }
}
