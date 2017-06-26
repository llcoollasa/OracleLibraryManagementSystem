using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GVClient_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCid.Text = GVClient.SelectedRow.Cells[0].Text;
            txtName.Text = GVClient.SelectedRow.Cells[1].Text;
            txtAddNo.Text = GVClient.SelectedRow.Cells[2].Text;
            txtAddLine.Text = GVClient.SelectedRow.Cells[3].Text;
            txtCity.Text = GVClient.SelectedRow.Cells[4].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ClientClass client = new ClientClass();
            client.Cid = Convert.ToInt32(txtCid.Text);
            client.Name = txtName.Text;
            client.AddNo = txtAddNo.Text;
            client.AddLine = txtAddLine.Text;
            client.City = txtCity.Text;

            client.update();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
         
    }
}