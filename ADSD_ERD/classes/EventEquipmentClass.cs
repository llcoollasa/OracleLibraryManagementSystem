using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class EventEquipmentClass
    {
        private EventClass _event;

        public EventClass Event
        {
            get { return _event; }
            set { _event = value; }
        }
        private EquipmentClass equipment;

        public EquipmentClass Equipment
        {
            get { return equipment; }
            set { equipment = value; }
        }
        private Int32 qty;

        public Int32 Quantity
        {
            get { return qty; }
            set { qty = value; }
        }

        private DB db = null;

        public EventEquipmentClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "INSERT INTO event_equipment(eid, eqid, qty) " +
                "VALUES(" + this.Event.EventId + ", " + this.Equipment.EquipmentId + ", " + this.Quantity + ")";
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {
            String sql = "UPDATE event_equipment SET qty=" + this.Quantity + " WHERE eid = " + this.Event.EventId + " AND eqid = " + this.Equipment.EquipmentId;
            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE event_equipment WHERE eid = " + this.Event.EventId + " AND eqid = " + this.Equipment.EquipmentId;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM event_equipment WHERE eid = " + this.Event.EventId + " AND eqid = " + this.Equipment.EquipmentId;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                //Assign Event
                this.Event = new EventClass();
                this.Event.EventId = dt.Rows[0].Field<Int32>("eid");
                this.Event.get();

                //Assign Equipment
                this.Equipment = new EquipmentClass();
                this.Equipment.EquipmentId = dt.Rows[0].Field<Int32>("equid");
                this.Equipment.get();

                this.Quantity = dt.Rows[0].Field<Int32>("qty");
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM event_equipment";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM event_equipment WHERE ";
            sql = this.db.prepareSearchSql(parameters, sql);
            return makeCollection(sql);
        }


        public ArrayList makeCollection(String sql)
        {
            ArrayList eventEquipmentCollection = new ArrayList();
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            //add member to list
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    EventEquipmentClass eventEquipment = new EventEquipmentClass();

                    //Assign Event
                    eventEquipment.Event = new EventClass();
                    eventEquipment.Event.EventId = Convert.ToInt32(item["eid"]);
                    eventEquipment.Event.get();

                    //Assign Equipment
                    eventEquipment.Equipment = new EquipmentClass();
                    eventEquipment.Equipment.EquipmentId = Convert.ToInt32(item["eqid"]);
                    eventEquipment.Equipment.get();

                    eventEquipment.Quantity = Convert.ToInt32(item["qty"]);
                    eventEquipmentCollection.Add(eventEquipment);

                }
            }
            return eventEquipmentCollection;
        }

        public ArrayList getEquipments()
        {
            String sql = "SELECT * FROM event_equipment WHERE EID=" + this.Event.EventId;
            ArrayList eventEquipmentCollection = makeCollection(sql);
            return eventEquipmentCollection;
        }

    }
}
