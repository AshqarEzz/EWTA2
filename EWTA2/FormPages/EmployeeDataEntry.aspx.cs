using System;

namespace EWTA2.FormPages
{
    public partial class EmployeeDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnSaveRecord_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text))
            {
                lblMessage.Text = "First Name and Last Name are required.";
                return;
            }
            //we are passing values to SQl datasource
            //dsEmployee is our SQlDataSource defined in .aspx
            dsEmployees.InsertParameters["Empl_FName"].DefaultValue = txtFirstName.Text.Trim();
            dsEmployees.InsertParameters["Empl_LName"].DefaultValue = txtLastName.Text.Trim();
            dsEmployees.InsertParameters["Empl_BDate"].DefaultValue = string.IsNullOrWhiteSpace(txtBirthDate.Text) ? null : txtBirthDate.Text;
            dsEmployees.InsertParameters["Empl_Start_Date"].DefaultValue = string.IsNullOrWhiteSpace(txtStartDate.Text) ? null : txtStartDate.Text;
            dsEmployees.InsertParameters["Gender_ID"].DefaultValue = string.IsNullOrWhiteSpace(rblGender.SelectedValue) ? null : rblGender.SelectedValue;
            dsEmployees.InsertParameters["Title_ID"].DefaultValue = string.IsNullOrWhiteSpace(ddlTitle.SelectedValue) ? null : ddlTitle.SelectedValue;
            dsEmployees.InsertParameters["Dept_ID"].DefaultValue = string.IsNullOrWhiteSpace(ddlDepartment.SelectedValue) ? null : ddlDepartment.SelectedValue;
            dsEmployees.InsertParameters["Empl_Email"].DefaultValue = string.IsNullOrWhiteSpace(txtEmail.Text) ? null : txtEmail.Text.Trim();
            dsEmployees.InsertParameters["Empl_Cell"].DefaultValue = string.IsNullOrWhiteSpace(txtCellPhone.Text) ? null : txtCellPhone.Text.Trim();
            dsEmployees.InsertParameters["Empl_Address"].DefaultValue = string.IsNullOrWhiteSpace(txtAddress.Text) ? null : txtAddress.Text.Trim();
            dsEmployees.InsertParameters["Empl_City"].DefaultValue = string.IsNullOrWhiteSpace(ddlCity.SelectedValue) ? null : ddlCity.SelectedValue;
            dsEmployees.InsertParameters["Empl_Province"].DefaultValue = string.IsNullOrWhiteSpace(ddlProvince.SelectedValue) ? null : ddlProvince.SelectedValue;
            dsEmployees.InsertParameters["Empl_CV"].DefaultValue = string.IsNullOrWhiteSpace(txtCVInfo.Text) ? null : txtCVInfo.Text.Trim();
            dsEmployees.InsertParameters["Is_Empl_Active"].DefaultValue = chkIsActive.Checked ? "true" : "false";
            dsEmployees.InsertParameters["Empl_Left_Date"].DefaultValue = string.IsNullOrWhiteSpace(txtLeftDate.Text) ? null : txtLeftDate.Text;
            dsEmployees.InsertParameters["Empl_Left_Reason"].DefaultValue = string.IsNullOrWhiteSpace(txtLeftReason.Text) ? null : txtLeftReason.Text.Trim();
            dsEmployees.InsertParameters["Empl_Phone"].DefaultValue = string.IsNullOrWhiteSpace(txtWorkPhone.Text) ? null : txtWorkPhone.Text.Trim();
            dsEmployees.InsertParameters["Empl_Wage"].DefaultValue = string.IsNullOrWhiteSpace(txtWage.Text) ? null : txtWage.Text.Trim();
            dsEmployees.InsertParameters["Empl_Commission_Rate"].DefaultValue = string.IsNullOrWhiteSpace(txtCommissionRate.Text) ? null : txtCommissionRate.Text.Trim();
            dsEmployees.InsertParameters["Is_Empl_Manager"].DefaultValue = chkIsManager.Checked ? "true" : "false";

            try
            {
                int result = dsEmployees.Insert(); //this line actuall execute the database

                if (result > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "New employee record added successfully.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Insert failed.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnCloseForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms.aspx");
        }
    }
}