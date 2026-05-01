using System;

namespace EWTA2.FormPages
{
    public partial class WageDataEntry : System.Web.UI.Page
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
            if (string.IsNullOrWhiteSpace(ddlEmployee.SelectedValue))
            {
                lblMessage.Text = "Please select an employee.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPaidDate.Text))
            {
                lblMessage.Text = "Paid Date is required.";
                return;
            }

            if (string.IsNullOrWhiteSpace(ddlWageMonth.SelectedValue))
            {
                lblMessage.Text = "Please select a wage month.";
                return;
            }

            dsWages.InsertParameters["Empl_ID"].DefaultValue = ddlEmployee.SelectedValue;
            dsWages.InsertParameters["Wage_Date"].DefaultValue = txtPaidDate.Text;
            dsWages.InsertParameters["Wage_Amount"].DefaultValue = string.IsNullOrWhiteSpace(txtPaidAmount.Text) ? "0" : txtPaidAmount.Text.Trim();
            dsWages.InsertParameters["Wage_Commission"].DefaultValue = string.IsNullOrWhiteSpace(txtPaidCommission.Text) ? "0" : txtPaidCommission.Text.Trim();
            dsWages.InsertParameters["Month_ID"].DefaultValue = ddlWageMonth.SelectedValue;

            try
            {
                int result = dsWages.Insert();//ASP.NET sends these values to SQL Server and runs the insert query.

                if (result > 0)
                {
                    lblMessage.Text = "Wage record added successfully.";
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