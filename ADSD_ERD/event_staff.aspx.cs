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

            refreshGrid(evt.EventId);
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

        private void refreshGrid(int id)
        {
            SqlDataSourceGrid.SelectCommand = @"SELECT 
	                                        ES.EID,
	                                        ES.SID,
	                                        S.NAME,
	                                        S.job_role,
		                                        CASE S.TYPE
			                                        WHEN 'INT' THEN 'INTERNAL'
			                                        ELSE 'EXTERNAL'
		                                        END
	
                                        FROM EVENT_STAFF ES

	                                        LEFT JOIN STAFF S
	                                        ON ES.SID = S.SID

                                        WHERE ES.EID =" + id;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            StaffClass staff = new StaffClass();
            staff.StaffId = Convert.ToInt32(DDLStaff.SelectedValue);
            staff.get();

            EventClass evt = new EventClass();
            evt.EventId = Convert.ToInt32( DDLEvent.SelectedValue);
            evt.get();

            EventStaffClass ESClass = new EventStaffClass();
            ESClass.Event = evt;
            ESClass.Staff = staff;
            ESClass.save();

            refreshGrid(evt.EventId);
        }

        protected void GVEvent_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void GVEvent_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
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

                StaffClass staff = new StaffClass();
                staff.StaffId = Convert.ToInt32(row.Cells[1].Text);
                staff.get();

                EventStaffClass ESClass = new EventStaffClass();
                ESClass.Event = evt;
                ESClass.Staff = staff;
                ESClass.delete();

                SqlDataSourceGrid.DeleteCommand = "";

                refreshGrid(evt.EventId);
            }
        }
    }
}