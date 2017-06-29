using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class _event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("event.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            EventClass evt = new EventClass();

            ClientClass client = new ClientClass();
            client.ClientId = Convert.ToInt32(DDLClient.SelectedValue);
            client.get();
            evt.Client = client;

            evt.Name = txtName.Text;
            evt.Number = txtNumber.Text;
            evt.Date = Calendar1.SelectedDate;
            evt.Location = DDLLocation.SelectedValue;
            evt.ProjectCost = Convert.ToDecimal(txtProjectCost.Text);

            evt.save();
            Response.Redirect("event.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            EventClass evt = new EventClass();

            evt.EventId = Convert.ToInt32(txtEid.Text);

            ClientClass client = new ClientClass();
            client.ClientId = Convert.ToInt32(DDLClient.SelectedValue);
            client.get();
            evt.Client = client;

            evt.Name = txtName.Text;
            evt.Number = txtNumber.Text;
            evt.Date = Calendar1.SelectedDate;
            evt.Location = DDLLocation.SelectedValue;
            evt.ProjectCost = Convert.ToDecimal(txtProjectCost.Text);

            evt.update();
            Response.Redirect("event.aspx");
        }

        protected void GVEvent_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEid.Text = GVEvent.SelectedRow.Cells[0].Text;
            DDLClient.SelectedValue = GVEvent.SelectedRow.Cells[1].Text;
            txtName.Text = GVEvent.SelectedRow.Cells[3].Text;
            txtNumber.Text = GVEvent.SelectedRow.Cells[4].Text;
            Calendar1.VisibleDate  = Convert.ToDateTime(GVEvent.SelectedRow.Cells[5].Text);
            DDLLocation.SelectedValue = GVEvent.SelectedRow.Cells[6].Text;
            txtProjectCost.Text = GVEvent.SelectedRow.Cells[7].Text;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtEid.Text.Length > 0)
            {
                EventClass evt = new EventClass();
                evt.EventId = Convert.ToInt32(txtEid.Text);
                evt.delete();
                Response.Redirect("client.aspx");
            }
        }
    }
}