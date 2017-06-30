using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;
using System.Collections;

namespace ADSD_ERD
{
    public partial class event_requirement_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLEvent_SelectedIndexChanged(object sender, EventArgs e)
        {
            EventClass evt = new EventClass();
            evt.EventId = Convert.ToInt32(DDLEvent.SelectedValue);
            evt.get();

            lblEventDate.Text = evt.Date.ToShortDateString();
            lblEventLocation.Text = evt.Location;
            lblEventNumber.Text = evt.Number;
            lblProjectCost.Text = evt.ProjectCost.ToString();
            
            
            //Client Address
            evt.Client.get();
            
            string clientAddress =  "";
            clientAddress = evt.Client.AddNo + ", " + evt.Client.AddLine + ", " + evt.Client.City;
            lblClientAddress.Text = clientAddress;
            lblClientName.Text = evt.Client.Name;

            //staff
            EventStaffClass evtStaff = new EventStaffClass();
            evtStaff.Event = evt;

            ArrayList staffCollection =  evtStaff.getStaff();

            string staffDiv = "";
            foreach (EventStaffClass item in staffCollection)
            {
                string type = "External";
                if (item.Staff.Type == "INT")
                {
                    type = "Internal";
                }

                staffDiv += "<div>" + item.Staff.Name + " (" + type + ") - " + item.Staff.JobRole + "</div>";

            }
            lblStaff.Text = staffDiv;

            //Equipments
            EventEquipmentClass evtEquipment = new EventEquipmentClass();
            evtEquipment.Event = evt;

            ArrayList equipmentCollection = evtEquipment.getEquipments();

            string equipmentDiv = "";
            foreach (EventEquipmentClass item in equipmentCollection)
            {

                equipmentDiv += "<div>" + item.Equipment.Name + "</div>";

                if (item.Equipment.Supplier != null) 
                {
                    equipmentDiv += "<div> Quantity: " + item.Quantity.ToString() + " From " + item.Equipment.Supplier.Name + "</div>";
                }
                else
                {
                    equipmentDiv += "<div> Quantity: " + item.Quantity.ToString() + "</div>";
                }

            }
            lblEquipment.Text = equipmentDiv;

        }
    }
}