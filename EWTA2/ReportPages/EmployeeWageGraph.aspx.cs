using System;

namespace EWTA2.ReportPages
{
    public partial class EmployeeWageGraph : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnCloseReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports.aspx");
        }
    }
}