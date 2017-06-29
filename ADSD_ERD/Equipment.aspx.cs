using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADSD_ERD.classes;

namespace ADSD_ERD
{
    public partial class Equipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            EquipmentClass equipment = new EquipmentClass();

            
            if (DDLSupplier.SelectedValue != "0")
            {
                SupplierClass suppler = new SupplierClass();
                suppler.SupplierId = Convert.ToInt32( DDLSupplier.SelectedValue);
                suppler.get();
                equipment.Supplier = suppler;
            }
            
            equipment.Name = txtName.Text;
            equipment.Quantity= Convert.ToInt32( txtQty.Text);
            equipment.Type = DDLType.SelectedValue;
            equipment.Available = ChkAvailability.Checked;

            equipment.save();
            Response.Redirect("equipment.aspx");
        }

        protected void GVEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            txteqid.Text = GVEquipment.SelectedRow.Cells[0].Text;

            if (GVEquipment.SelectedRow.Cells[1].Text == "&nbsp;")
            {
                DDLSupplier.SelectedValue = "0";
            }
            else 
            {
                DDLSupplier.SelectedValue = GVEquipment.SelectedRow.Cells[1].Text;
            }

            
            txtName.Text = GVEquipment.SelectedRow.Cells[3].Text;
            txtQty.Text = GVEquipment.SelectedRow.Cells[4].Text;
            DDLType.SelectedValue = GVEquipment.SelectedRow.Cells[5].Text;
            ChkAvailability.Checked = Convert.ToBoolean(Convert.ToInt16(GVEquipment.SelectedRow.Cells[6].Text));
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            EquipmentClass equipment = new EquipmentClass();


            equipment.EquipmentId = Convert.ToInt32(txteqid.Text);

            if (DDLSupplier.SelectedValue != "0")
            {
                SupplierClass suppler = new SupplierClass();
                suppler.SupplierId = Convert.ToInt32(DDLSupplier.SelectedValue);
                suppler.get();
                equipment.Supplier = suppler;
            }

            equipment.Name = txtName.Text;
            equipment.Quantity = Convert.ToInt32(txtQty.Text);
            equipment.Type = DDLType.SelectedValue;
            equipment.Available = ChkAvailability.Checked;

            equipment.update();

            Response.Redirect("equipment.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("equipment.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txteqid.Text.Length > 0)
            {
                EquipmentClass equipment = new EquipmentClass();
                equipment.EquipmentId = Convert.ToInt32(txteqid.Text);
                equipment.delete();
                Response.Redirect("equipment.aspx");
            }
        }

        protected void GVEquipment_Load(object sender, EventArgs e)
        {

        }
    }
}