using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            StaffClass staff = new StaffClass();
            staff.Name = txtName.Text;
            staff.JobRole = txtJobRole.Text;
            staff.Type = DDLType.SelectedItem.Value;
            staff.Availability = Convert.ToBoolean(ChkAvailability.Checked);
            staff.save();

            Response.Redirect("staff.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            StaffClass staff = new StaffClass();
            staff.StaffId = Convert.ToInt32(txtsid.Text);
            staff.Name = txtName.Text;
            staff.JobRole = txtJobRole.Text;
            staff.Type = DDLType.SelectedItem.Value;
            staff.Availability =Convert.ToBoolean(ChkAvailability.Checked);

            staff.update();

            Response.Redirect("staff.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("staff.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtsid.Text.Length > 0)
            {
                StaffClass staff = new StaffClass();
                staff.StaffId = Convert.ToInt32(txtsid.Text);
                staff.delete();
                Response.Redirect("staff.aspx");
            }
        }

        protected void GVStaff_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtsid.Text = GVStaff.SelectedRow.Cells[0].Text;
            txtName.Text = GVStaff.SelectedRow.Cells[1].Text;
            txtJobRole.Text = GVStaff.SelectedRow.Cells[2].Text;
            DDLType.SelectedValue = GVStaff.SelectedRow.Cells[3].Text;
            ChkAvailability.Checked = Convert.ToBoolean(Convert.ToInt16(GVStaff.SelectedRow.Cells[4].Text));
        }
    }
}