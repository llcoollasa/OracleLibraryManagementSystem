using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class event_equipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void DDLEquipment_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    EquipmentClass equipment = new EquipmentClass();
        //    equipment.EquipmentId = Convert.ToInt32(DDLEquipment.SelectedValue);
        //    equipment.get();

        //    lSupplierName.Text = equipment.Supplier.Name;
        //    lQty.Text = equipment.Quantity.ToString();
        //    lType.Text = equipment.Type;
        //}

       

        protected void DDLEvent_SelectedIndexChanged(object sender, EventArgs e)
        {
            EventClass evt = new EventClass();
            evt.EventId = Convert.ToInt32(DDLEvent.SelectedValue);
            evt.get();

            lName.Text = evt.Name;
            lNumber.Text = evt.Number;
            lDate.Text = evt.Date.ToShortDateString();
            lLocation.Text = evt.Location;
            lProjectCost.Text = evt.ProjectCost.ToString();

            refreshGrid(evt.EventId);
        }
        private void refreshGrid(int id)
        {
            SqlDataSourceGrid.SelectCommand = @"SELECT 
	                                                EE.EID,
	                                                EE.EQID,
	                                                EE.QTY,
	                                                S.NAME,
	                                                E.NAME,
		                                                CASE E.TYPE
			                                                WHEN 'INT' THEN 'INTERNAL'
			                                                ELSE 'EXTERNAL'
		                                                END
	
                                                FROM EVENT_EQUIPMENT EE
                                                LEFT JOIN EQUIPMENT E
                                                ON EE.EQID = E.EQID

                                                LEFT JOIN SUPPLIER S
                                                ON E.SUP_ID = S.SUP_ID

                                        WHERE EE.EID =" + id;
        }

        protected void DDLEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            EquipmentClass equipment = new EquipmentClass();
            equipment.EquipmentId = Convert.ToInt32(DDLEquipment.SelectedValue);
            equipment.get();

            if (equipment.Supplier != null)
            {
                lStafName.Text = equipment.Supplier.Name;
            }
            else
            {
                lStafName.Text = "";
            }
            
            lQty.Text = equipment.Quantity.ToString();
            lType.Text = equipment.Type;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            EquipmentClass equipment = new EquipmentClass();
            equipment.EquipmentId = Convert.ToInt32(DDLEquipment.SelectedValue);
            equipment.get();

            EventClass evt = new EventClass();
            evt.EventId = Convert.ToInt32(DDLEvent.SelectedValue);
            evt.get();

            EventEquipmentClass EEClass = new EventEquipmentClass();
            EEClass.Event = evt;
            EEClass.Equipment = equipment;
            EEClass.Quantity = Convert.ToInt32(txtAllocatedQty.Text);
            EEClass.save();

            refreshGrid(evt.EventId);
        }

        protected void GVEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDelete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GVEvent.Rows[index];

                EventClass evt = new EventClass();
                evt.EventId = Convert.ToInt32(row.Cells[0].Text);
                evt.get();

                EquipmentClass equipment = new EquipmentClass();
                equipment.EquipmentId = Convert.ToInt32(row.Cells[1].Text);
                equipment.get();

                EventEquipmentClass EEClass = new EventEquipmentClass();
                EEClass.Event = evt;
                EEClass.Equipment = equipment;
                EEClass.delete();

                SqlDataSourceGrid.DeleteCommand = "";

                refreshGrid(evt.EventId);
            }
        }


    }
}