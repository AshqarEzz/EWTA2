using System;
using System.Web.UI;

namespace EWTA2
{
    public partial class ReportsPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void btnEmployeesByDepartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeesByDepartmentReport.aspx");
        }

        protected void btnEmployeeWageGraph_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeeWageGraph.aspx");
        }

        protected void btnEmployeeWageGraphByYear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeeWageGraphByYear.aspx");
        }
    }
}