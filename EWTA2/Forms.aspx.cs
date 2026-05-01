using System;

namespace EWTA2
{
    public partial class Forms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void btnEmployeeEntry_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormPages/EmployeeDataEntry.aspx");
        }

        protected void btnEmployeeUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormPages/EmployeeDataUpdate.aspx");
        }

        protected void btnEmployeeWizard_Click(object sender, EventArgs e)
        {
            Response.Write("Employee Wizard Form page not created yet.");
        }

        protected void btnWageEntry_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormPages/WageDataEntry.aspx");
        }

        protected void btnWageUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormPages/WageDataUpdate.aspx");
        }

        protected void btnDepartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormPages/DepartmentDataEntryUpdate.aspx");
        }
    }
}