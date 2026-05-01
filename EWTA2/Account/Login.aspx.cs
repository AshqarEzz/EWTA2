using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EWTA2.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "Please enter username and password.";
                return;
            }
            string connStr = ConfigurationManager.ConnectionStrings["EWTAConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM dbo.tbl_Users WHERE User_Name=@username AND User_Psw=@password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                    conn.Open();

                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        Session["user"] = txtUsername.Text.Trim();
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password!";
                    }
                }
            }
        }
    }
}