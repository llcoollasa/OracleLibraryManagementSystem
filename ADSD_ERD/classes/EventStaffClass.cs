using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class EventStaffClass
    {
        private EventClass _event;

        public EventClass Event
        {
            get { return _event; }
            set { _event = value; }
        }
        private StaffClass staff;

        public StaffClass Staff
        {
            get { return staff; }
            set { staff = value; }
        }

        private DB db = null;

        public EventStaffClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO event_staff(eid, sid) " +
                "VALUES(" + this.Event.EventId + ", " + this.Staff.StaffId + " )";
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE event_staff WHERE eid = " + this.Event.EventId + " AND sid = " + this.Staff.StaffId;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM event_staff WHERE eid = " + this.Event.EventId + " AND eqid = " + this.Staff.StaffId;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                //Assign Event
                this.Event = new EventClass();
                this.Event.EventId = dt.Rows[0].Field<Int32>("eid");
                this.Event.get();

                //Assign Equipment
                this.Staff = new StaffClass();
                this.Staff.StaffId = dt.Rows[0].Field<Int32>("sid");
                this.Staff.get();

                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM event_staff";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM event_staff WHERE ";
            sql = this.db.prepareSearchSql(parameters, sql);
            return makeCollection(sql);
        }


        public ArrayList makeCollection(String sql)
        {
            ArrayList eventStaffCollection = new ArrayList();
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            //add member to list
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    EventStaffClass eventStaff = new EventStaffClass();

                    //Assign Event
                    eventStaff.Event = new EventClass();
                    eventStaff.Event.EventId = item.Field<Int32>("eid");
                    eventStaff.Event.get();

                    //Assign Equipment
                    eventStaff.Staff = new StaffClass();
                    eventStaff.Staff.StaffId = item.Field<Int32>("sid");
                    eventStaff.Staff.get();

                    eventStaffCollection.Add(eventStaff);

                }
            }
            return eventStaffCollection;
        }

    }
}
