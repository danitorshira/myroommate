using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRoom : System.Web.UI.Page
{
    DataTable dtUploadImage;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] == null)
        {
            //Response.Redirect("SignIn.aspx");
        }

        if (!IsPostBack)
        {
            dtUploadImage = new DataTable();
            dtUploadImage.Columns.Add("Name", typeof(System.String));
            dtUploadImage.Columns.Add("Main", typeof(System.Int32));
            dtUploadImage.Columns.Add("ImageSrc", typeof(System.String));
            ViewState["vs_dtUploadImage"] = dtUploadImage;
        }
    }
    //Adds the image to the table and assigns it to the appropriate room in a way that will make it easy to pull out the image in the fastest way.
    protected void btn_UploadFile_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = (DataTable)ViewState["vs_dtUploadImage"];

            if (FU.HasFile)
            {
                if (FU.PostedFile.ContentType == "image/jpeg" || FU.PostedFile.ContentType == "image/jpg" || FU.PostedFile.ContentType == "image/png")
                {
                    string filename = Path.GetFileName(FU.FileName);
                    FU.SaveAs(Server.MapPath("~/") + "Images/" + Session["UserName"] + "_Picture_" + dt.Rows.Count + 1 + ".jpg");

                    DataRow row = dt.NewRow();
                    row["ImageSrc"] = "../Images/" + Session["Username"] + "_Picture_" + dt.Rows.Count + 1 + ".jpg";
                    row["Name"] = Session["Username"] + "_Picture_" + dt.Rows.Count + 1 + ".jpg";

                    int m = 0;
                    if (chk_Main.Checked)
                        m = 1;
                    row["Main"] = m;

                    dt.Rows.Add(row);
                    ViewState["vs_dtUploadImage"] = dt;

                    dgv_Pic.DataSource = dt;
                    dgv_Pic.DataBind();
                }
                else
                    FileStatus.Text = "Only JPEG , JPG , PNG files allow!";
            }
            else
            {
                FileStatus.Text = "No File Uploaded.";
            }
        }
        catch (Exception ex)
        {
            FileStatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
        }
    }

    protected void dgv_Pic_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dt = (DataTable)ViewState["vs_dtUploadImage"];
            dt.Rows[e.RowIndex].Delete();
            dgv_Pic.DataSource = dt;
            dgv_Pic.DataBind();
            ViewState["vs_dtUploadImage"] = dt;
        }
        catch (Exception ex)
        {

        }
    }
}