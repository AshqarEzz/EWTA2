using System;

namespace EWTA2.ReportPages
{
    public partial class EmployeeCommunicationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void btnCloseReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports.aspx");
        }
    }
}