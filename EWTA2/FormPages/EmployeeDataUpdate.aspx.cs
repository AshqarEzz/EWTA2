using System;
using System.Web.UI.WebControls;

namespace EWTA2.FormPages
{
    public partial class EmployeeDataUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void dvEmployee_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload fuCVFileEdit = (FileUpload)dvEmployee.FindControl("fuCVFileEdit");
            HiddenField hfOldCVFile = (HiddenField)dvEmployee.FindControl("hfOldCVFile");
            CheckBox chkDeleteCV = (CheckBox)dvEmployee.FindControl("chkDeleteCV");

            string cvFileName = hfOldCVFile != null ? hfOldCVFile.Value : null;

            if (chkDeleteCV != null && chkDeleteCV.Checked)
            {
                if (!string.IsNullOrWhiteSpace(cvFileName))
                {
                    string oldFilePath = Server.MapPath("~/CVFiles/" + cvFileName);

                    if (System.IO.File.Exists(oldFilePath))
                    {
                        System.IO.File.Delete(oldFilePath);
                    }
                }

                cvFileName = null;
            }
            else if (fuCVFileEdit != null && fuCVFileEdit.HasFile)
            {
                string folderPath = Server.MapPath("~/CVFiles/");

                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                cvFileName = DateTime.Now.Ticks + "_" + System.IO.Path.GetFileName(fuCVFileEdit.FileName);

                fuCVFileEdit.SaveAs(System.IO.Path.Combine(folderPath, cvFileName));
            }

            e.NewValues["Empl_CV_File"] = cvFileName;
        }

        protected void btnCloseForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms.aspx");
        }
    }
}