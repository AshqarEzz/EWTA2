using System;
using System.Web.UI;

namespace EWTA2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool isLoggedIn = Session["user"] != null;

                phProtectedLinks.Visible = isLoggedIn; // Forms + Reports
                phUserLinks.Visible = isLoggedIn;      // Logout
                phGuestLinks.Visible = !isLoggedIn;    // Register + Login
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
    }
}