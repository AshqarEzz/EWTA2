using System;

namespace EWTA2.FormPages
{
    public partial class DepartmentDataEntryUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnSaveData_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDeptName.Text))
            {
                lblMessage.Text = "Department name is required.";
                return;
            }

            dsDepartments.InsertParameters["Dept_Name"].DefaultValue = txtDeptName.Text.Trim();
            dsDepartments.InsertParameters["Dept_Phone"].DefaultValue =
                string.IsNullOrWhiteSpace(txtDeptPhone.Text) ? null : txtDeptPhone.Text.Trim();
            dsDepartments.InsertParameters["Manager_ID"].DefaultValue = ddlManager.SelectedValue;

            try
            {
                int result = dsDepartments.Insert();

                if (result > 0)
                {
                    lblMessage.Text = "Department added successfully.";

                    txtDeptName.Text = "";
                    txtDeptPhone.Text = "";

                    gvDepartments.DataBind();
                }
                else
                {
                    lblMessage.Text = "Insert failed.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnCloseForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms.aspx");
        }
    }
}