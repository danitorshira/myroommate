using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    public Register()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (frmConfirmation.Visible == false)
        {
            lbl_msg.Text = "Error: Please Upload Profile Picture";
            return;
        }

        String PicturePath = ViewState["ProfilePicture"].ToString();

        if (String.IsNullOrEmpty(txt_FirstName.Value) || String.IsNullOrEmpty(txt_Phone.Value) || String.IsNullOrEmpty(txt_Email.Value) || String.IsNullOrEmpty(txt_Pass.Value))
        {
            lbl_msg.Text = "Error: Fill All Manadatory Field";
            return;
        }
        else if (DDL_Edu.SelectedValue == "Choose" || DDL_Food.SelectedValue == "Choose" || DDL_Political.SelectedValue == "Choose" || DDL_Religion.SelectedValue == "Choose" || DDL_Residence.SelectedValue == "Choose")
        {
            lbl_msg.Text = "Error: Fill All Manadatory Field";
            return;
        }

        String Query = "sp_InsertUserProfile '"+ txt_FirstName.Value +"','" + txt_LastName.Value +"','" + DDL_Gender.SelectedValue + "','" + txt_DOB.Value + "','" + DDL_Residence.SelectedValue + "','" + txt_Phone.Value + "','" + txt_Email.Value + "','" + txt_Pass.Value + "','" + txt_Occupation.Value + "','" + DDL_Edu.SelectedValue + "','" + DDL_Food.SelectedValue + "','" + txt_hobbies.Value + "','" + DDL_Religion.SelectedValue + "','" + txt_Allerigies.Value + "','" + txt_Pets.Value + "','" + DDL_Political.SelectedValue + "','" + PicturePath +"'";
        SqlDataAdapter adp = new SqlDataAdapter(Query,con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Result"].ToString() == "1")
            {
                lbl_msg.Text = "Account Created Sucessfully";
                ClearFields();
                frmConfirmation.Visible = false;
            }
            else if(dt.Rows[0]["Result"].ToString() == "-1")
            {
                lbl_msg.Text = "Account with this Email ("+ txt_Email.Value +") Already Exist";
            }
            else if (dt.Rows[0]["Result"].ToString() == "0")
            {
                lbl_msg.Text = "Some Issue Contact Administrator";
            }
        }
    }

    void ClearFields()
    {
        DDL_Edu.SelectedIndex = DDL_Food.SelectedIndex = DDL_Political.SelectedIndex = DDL_Religion.SelectedIndex = DDL_Residence.SelectedIndex = 0;
        txt_FirstName.Value = txt_LastName.Value = txt_Email.Value = txt_Phone.Value = txt_hobbies.Value = txt_Occupation.Value = txt_Pets.Value = txt_Allerigies.Value = "";
        txt_DOB.Value = null;
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txt_Email.Value))
        {
            lbl_msg.Text = "First Enter Email Than You can Upload Image";
            return;
        }

        string strFileName;
        string strFileExtension;
        string strFilePath;
        string strFolder;

        strFolder = Server.MapPath("~/Images/"+txt_Email.Value+"/");
        // Retrieve the name of the file that is posted.
        strFileName = oFile.PostedFile.FileName;
        strFileName = Path.GetFileName(strFileName);
        if (oFile.Value != "")
        {
            // Create the folder if it does not exist.
            if (!Directory.Exists(strFolder))
            {
                Directory.CreateDirectory(strFolder);
            }
            // Save the uploaded file to the server.
            strFilePath = strFolder + txt_Email.Value+ "_profilePic.jpg";
            if (File.Exists(strFilePath))
            {
                lblUploadResult.Text = strFileName + " already exists on the server!";
            }
            else
            {
                oFile.PostedFile.SaveAs(strFilePath);
                lblUploadResult.Text = strFileName + " has been successfully uploaded.";
                ViewState["ProfilePicture"] = txt_Email.Value + "_profilePic.jpg";
            }
        }
        else
        {
            lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
        }

        frmConfirmation.Visible = true;
    }
}