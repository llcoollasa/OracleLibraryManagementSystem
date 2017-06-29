using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class event_staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLEvent_SelectedIndexChanged(object sender, EventArgs e)
        {

            EventClass evt = new EventClass();
            evt.EventId = Convert.ToInt32( DDLEvent.SelectedValue);
            evt.get();

            lName.Text = evt.Name;
            lNumber.Text = evt.Number;
            lDate.Text = evt.Date.ToShortDateString();
            lLocation.Text =  evt.Location;
            lProjectCost.Text = evt.ProjectCost.ToString();

            SqlDataSource1.SelectCommand = "SELECT * FROM event WHERE eid =" + DDLEvent.SelectedValue;
        }

        protected void DDLStaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            StaffClass staff = new StaffClass();
            staff.StaffId = Convert.ToInt32(DDLStaff.SelectedValue);
            staff.get();

            lStafName.Text = staff.Name;
            lJobRole.Text = staff.JobRole;
            lType.Text = staff.Type;
        }
    }
}