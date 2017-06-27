using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SupplierClass supplier = new SupplierClass();
            supplier.Name = txtName.Text;
            supplier.AddNo = txtAddNo.Text;
            supplier.AddLine = txtAddLine.Text;
            supplier.City = txtCity.Text;

            supplier.save();
            Response.Redirect("supplier.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SupplierClass supplier = new SupplierClass();
            supplier.Name = txtName.Text;
            supplier.AddNo = txtAddNo.Text;
            supplier.AddLine = txtAddLine.Text;
            supplier.City = txtCity.Text;

            supplier.save();
            Response.Redirect("supplier.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("supplier.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtSupId.Text.Length > 0)
            {
                SupplierClass supplier = new SupplierClass();
                supplier.SupplierId = Convert.ToInt32(txtSupId.Text);
                supplier.delete();
                Response.Redirect("supplier.aspx");
            }
        }

        protected void GVSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSupId.Text = GVSupplier.SelectedRow.Cells[0].Text;
            txtName.Text = GVSupplier.SelectedRow.Cells[1].Text;
            txtAddNo.Text = GVSupplier.SelectedRow.Cells[2].Text;
            txtAddLine.Text = GVSupplier.SelectedRow.Cells[3].Text;
            txtCity.Text = GVSupplier.SelectedRow.Cells[4].Text;
        }
    }
}