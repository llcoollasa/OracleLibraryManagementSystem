﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ADSD_ERD.classes
{
    public class EquipmentClass
    {
        private Int32 eqid;

        public Int32 EquipmentId
        {
            get { return eqid; }
            set { eqid = value; }
        }
        private SupplierClass sup_id;

        public SupplierClass Supplier
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
        private Int32 qty;

        public Int32 Quantity
        {
            get { return qty; }
            set { qty = value; }
        }
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private bool available;

        public bool Available
        {
            get { return available; }
            set { available = value; }
        }

        private DB db = null;
        public EquipmentClass()
        {
            this.db = new DB();
        }

        public int save()
        {
            String sql = "";
            if (this.Supplier == null)
            {
                sql = "INSERT INTO equipment( sup_id, name, qty, type, available) " +
                "VALUES( '', '" + this.name + "', " + this.qty + ", '" + this.type + "' , " + Convert.ToByte(this.available) + ")";
            }
            else
            {
                sql = "INSERT INTO equipment( sup_id, name, qty, type, available) " +
                "VALUES( " + this.Supplier.SupplierId + ", '" + this.name + "', " + this.qty + ", '" + this.type + "' , " + Convert.ToByte(this.available) + ")";
            }
             
            return this.db.executeNonQuery(sql);
        }

        public int update()
        {

            String sql = "";
            if (this.Supplier == null)
            {
                sql = "UPDATE equipment SET sup_id = null, name='" + this.name + "', qty=" + this.qty + ", type='" + this.type +
                "', available=" + Convert.ToByte(this.available) + " WHERE eqid = " + this.eqid;
            }
            else
            {
                sql = "UPDATE equipment SET sup_id = " + this.Supplier.SupplierId + ", name='" + this.name + "', qty=" + this.qty + ", type='" + this.type +
                "', available=" + Convert.ToByte(this.available) + " WHERE eqid = " + this.eqid;
            }

            return this.db.executeNonQuery(sql);
        }

        public int delete()
        {
            String sql = "DELETE FROM equipment WHERE eqid = " + this.eqid;
            return this.db.executeNonQuery(sql);
        }

        public bool get()
        {
            bool result = false;
            String sql = "SELECT * FROM equipment WHERE eqid = " + this.eqid;
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["sup_id"] != DBNull.Value) 
                {
                    //Assign Supplier
                    this.Supplier = new SupplierClass();
                    this.Supplier.SupplierId = Convert.ToInt32(dt.Rows[0]["sup_id"]);
                    this.Supplier.get();
                }
                

                this.name = Convert.ToString(dt.Rows[0]["name"]);
                this.qty = Convert.ToInt32(dt.Rows[0]["qty"]);
                this.type = Convert.ToString(dt.Rows[0]["type"]);
                this.available = Convert.ToBoolean(Convert.ToInt32(dt.Rows[0]["available"]));
                result = true;
            }
            return result;

        }

        public ArrayList getAll()
        {
            String sql = "SELECT * FROM equipment";
            return makeCollection(sql);
        }

        public ArrayList search(Dictionary<string, string> parameters)
        {
            String sql = "SELECT * FROM equipment WHERE ";
            sql = this.db.prepareSearchSql(parameters, sql);
            return makeCollection(sql);
        }


        public ArrayList makeCollection(String sql)
        {
            ArrayList EquipmentCollection = new ArrayList();
            DataTable dt = new DataTable();
            dt = this.db.getResult(sql);

            //add member to list
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    EquipmentClass equipment = new EquipmentClass();
                    equipment.EquipmentId = item.Field<Int32>("eid");

                    //Assign Supplier
                    equipment.Supplier = new SupplierClass();
                    equipment.Supplier.SupplierId = item.Field<Int32>("sup_id");
                    equipment.Supplier.get();

                    equipment.Name = item.Field<String>("name");
                    equipment.Quantity = item.Field<Int32>("qty");
                    equipment.Type = item.Field<String>("type");
                    equipment.Available = item.Field<bool>("available");
                    EquipmentCollection.Add(equipment);

                }
            }
            return EquipmentCollection;
        }

    }
}
