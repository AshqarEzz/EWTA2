using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EWTA2.FormPages
{
    public partial class EmployeeDataEntryWizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void wizEmployee_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            lblWizardError.Text = "";

            if (wizEmployee.ActiveStepIndex == 0)
            {
                if (string.IsNullOrWhiteSpace(txtName.Text) ||
                    string.IsNullOrWhiteSpace(txtSurname.Text) ||
                    string.IsNullOrWhiteSpace(txtBirthDate.Text) ||
                    string.IsNullOrWhiteSpace(txtEntryDate.Text) ||
                    string.IsNullOrWhiteSpace(ddlTitle.SelectedValue) ||
                    string.IsNullOrWhiteSpace(rblGender.SelectedValue))
                {
                    lblWizardError.Text = "Please fill all personal data fields.";
                    e.Cancel = true;
                }
            }
            else if (wizEmployee.ActiveStepIndex == 1)
            {
                if (string.IsNullOrWhiteSpace(txtTel.Text) ||
                    string.IsNullOrWhiteSpace(txtCell.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(ddlDepartment.SelectedValue))
                {
                    lblWizardError.Text = "Please fill all communication data fields.";
                    e.Cancel = true;
                }
            }
            else if (wizEmployee.ActiveStepIndex == 2)
            {
                if (string.IsNullOrWhiteSpace(txtAddress.Text) ||
                    string.IsNullOrWhiteSpace(ddlCity.SelectedValue) ||
                    string.IsNullOrWhiteSpace(ddlProvince.SelectedValue))
                {
                    lblWizardError.Text = "Please fill all address data fields.";
                    e.Cancel = true;
                }
            }
        }

        protected void wizEmployee_ActiveStepChanged(object sender, EventArgs e)
        {
            if (wizEmployee.ActiveStepIndex == 3)
            {
                lblName.Text = txtName.Text;
                lblSurname.Text = txtSurname.Text;
                lblBDate.Text = txtBirthDate.Text;
                lblEntryDate.Text = txtEntryDate.Text;
                lblTitle.Text = ddlTitle.SelectedItem.Text;
                lblPhone.Text = txtTel.Text;
                lblCell.Text = txtCell.Text;
                lblEmail.Text = txtEmail.Text;
                lblDepartment.Text = ddlDepartment.SelectedItem.Text;
            }
        }

        protected void wizEmployee_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            lblWizardError.Text = "";

            dsEmployees.InsertParameters["Empl_FName"].DefaultValue = txtName.Text.Trim();
            dsEmployees.InsertParameters["Empl_LName"].DefaultValue = txtSurname.Text.Trim();
            dsEmployees.InsertParameters["Empl_BDate"].DefaultValue = txtBirthDate.Text;
            dsEmployees.InsertParameters["Empl_Start_Date"].DefaultValue = txtEntryDate.Text;
            dsEmployees.InsertParameters["Empl_Phone"].DefaultValue = txtTel.Text.Trim();
            dsEmployees.InsertParameters["Empl_Cell"].DefaultValue = txtCell.Text.Trim();
            dsEmployees.InsertParameters["Empl_Email"].DefaultValue = txtEmail.Text.Trim();
            dsEmployees.InsertParameters["Dept_ID"].DefaultValue = ddlDepartment.SelectedValue;
            dsEmployees.InsertParameters["Gender_ID"].DefaultValue = rblGender.SelectedValue;
            dsEmployees.InsertParameters["Title_ID"].DefaultValue = ddlTitle.SelectedValue;
            dsEmployees.InsertParameters["Empl_Address"].DefaultValue = txtAddress.Text.Trim();
            dsEmployees.InsertParameters["Empl_City"].DefaultValue = ddlCity.SelectedValue;
            dsEmployees.InsertParameters["Empl_Province"].DefaultValue = ddlProvince.SelectedValue;
            dsEmployees.InsertParameters["Is_Empl_Active"].DefaultValue = "true";

            try
            {
                int result = dsEmployees.Insert();

                if (result > 0)
                {
                    lblMessage.Text = "New Employee Successfully:<br/>Added";
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