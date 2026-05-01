using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EWTA2
{
    public partial class ReportsPage : System.Web.UI.Page
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

        protected void btnEmployeeWageGraphByYear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeeWageGraphByYear.aspx");
        }

        protected void btnWageGraphByEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/WageGraphByEmployee.aspx");
        }

        protected void btnWagesByEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/WagesByEmployeeReport.aspx");
        }

        protected void btnEmployeeCommunication_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeeCommunicationReport.aspx");
        }

        protected void btnEmployeeResign_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportPages/EmployeeResignReport.aspx");
        }
    }
}