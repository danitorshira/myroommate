using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    DataTable dtUploadImage = new DataTable();

    public EditProfile()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }

    //loading user's details by his email
    void LoadProfileDetail()
    {
        String Query = "select * from tbl_UserProfile where Email = '"+ Session["Email"].ToString() +"'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txt_Phone.Value = dt.Rows[0]["PhoneNumber"].ToString();
            txt_Pass.Value = dt.Rows[0]["Password"].ToString();
            txt_Occupation.Value = dt.Rows[0]["Occupation"].ToString();
            DDL_Edu.SelectedValue = dt.Rows[0]["Education"].ToString();
            DDL_Residence.SelectedValue = dt.Rows[0]["Residence"].ToString();
            DDL_Food.SelectedValue = dt.Rows[0]["Food"].ToString();
            DDL_Political.SelectedValue = dt.Rows[0]["Political"].ToString();
            DDL_Religion.SelectedValue = dt.Rows[0]["Religious"].ToString();
            txt_hobbies.Value = dt.Rows[0]["Hobbies"].ToString();
            txt_Allerigies.Value = dt.Rows[0]["Allerigies"].ToString();
            txt_Pets.Value = dt.Rows[0]["Pets"].ToString();
            lbl_Image.ImageUrl = "Images/"+Session["Email"]+"/"+ dt.Rows[0]["Picture"].ToString();
            ViewState["ProfilePicture"] = dt.Rows[0]["Picture"].ToString();
            lbl_Group_Id.InnerText = Session["Group_Id"].ToString();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Group_Id"].ToString() != "0")
            {
                div_group.Visible = false;
                div_LeaveGroup.Visible = true;
            }
            else
            {
                div_group.Visible = true;
                div_LeaveGroup.Visible = false;
            }

            LoadProfileDetail();

            dtUploadImage = new DataTable();
            dtUploadImage.Columns.Add("ImageName", typeof(System.String));
            dtUploadImage.Columns.Add("ImageSrc", typeof(System.String));
            ViewState["vs_dtUploadImage"] = dtUploadImage;
            ViewState["vs_Index"] = 1;
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        String PicturePath = ViewState["ProfilePicture"].ToString();

        //if the user wants to submit the changes he has to fill all the mandatory fields and to enter his password for confirmation.
        if (DDL_Edu.SelectedValue == "Choose" || DDL_Food.SelectedValue == "Choose" || DDL_Political.SelectedValue == "Choose" || DDL_Religion.SelectedValue == "Choose" || DDL_Residence.SelectedValue == "Choose" || txt_Phone.Value == "")
        {
            lbl_msg.Text = "Error: Fill All Manadatory Field";
            return;
        }
        else if (String.IsNullOrEmpty(txt_Phone.Value) || String.IsNullOrEmpty(txt_Pass.Value))
        {
            lbl_msg.Text = "Error: Please enter password for confirmation";
            return;
        }

        //update user details
        String Query = "sp_UpdateUserProfile '" + DDL_Residence.SelectedValue + "','" + txt_Phone.Value + "','" + Session["Email"] + "','" + txt_Pass.Value + "','" + txt_Occupation.Value + "','" + DDL_Edu.SelectedValue + "','" + DDL_Food.SelectedValue + "','" + txt_hobbies.Value + "','" + DDL_Religion.SelectedValue + "','" + txt_Allerigies.Value + "','" + txt_Pets.Value + "','" + DDL_Political.SelectedValue + "','" + PicturePath + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Result"].ToString() == "1")
            {
                lbl_msg.Text = "Account Created Sucessfully";
                frmConfirmation.Visible = false;
                LoadProfileDetail();
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
        txt_Phone.Value = txt_hobbies.Value = txt_Occupation.Value = txt_Pets.Value = txt_Allerigies.Value = "";
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {

        string strFileName;
        string strFilePath;
        string strFolder;

        strFolder = Server.MapPath("~/Images/" + Session["Email"] + "/");
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

                strFilePath = strFolder + Session["Email"] + "_profilePic.jpg";
                oFile.PostedFile.SaveAs(strFilePath);
                ViewState["ProfilePicture"] = Session["Email"] + "_profilePic.jpg";
              
               lbl_Image.ImageUrl = "Images/" + Session["Email"] + "/" + ViewState["ProfilePicture"].ToString();
               ClearCache();
        }
        else
        {
            lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
        }

        frmConfirmation.Visible = true;
    }
    void ClearCache()
    {
        IDictionaryEnumerator allCaches = HttpRuntime.Cache.GetEnumerator();

        while (allCaches.MoveNext())
        {
            Cache.Remove(allCaches.Key.ToString());
        }
    }

    protected void dgv_Image_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dt = (DataTable)ViewState["vs_dtUploadImage"];
            dt.Rows[e.RowIndex].Delete();
            dgv_Image.DataSource = dt;
            dgv_Image.DataBind();
            ViewState["vs_dtUploadImage"] = dt;
        }
        catch (Exception ex)
        {

        }
    }

    protected void btn_UploadFile_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["vs_dtUploadImage"];
        string strFileName;
        string strFilePath;
        string strFolder;

        strFolder = Server.MapPath("~/Images/" + Session["Email"] + "/Room/");
        // Retrieve the name of the file that is posted.
        strFileName = oFile.PostedFile.FileName;
        strFileName = Path.GetFileName(strFileName);
        if (File1.Value != "")
        {
            // Create the folder if it does not exist.
            if (!Directory.Exists(strFolder))
            {
                Directory.CreateDirectory(strFolder);
            }

            strFilePath = strFolder + "Image"+ ViewState["vs_Index"].ToString() + ".jpg";
            File1.PostedFile.SaveAs(strFilePath);

            DataRow row = dt.NewRow();
            row["ImageName"] = "Image" + ViewState["vs_Index"].ToString() + ".jpg";
            row["ImageSrc"] = "Images/" + Session["Email"] + "/Room/"+ "Image" + ViewState["vs_Index"].ToString() + ".jpg";
            dt.Rows.Add(row);

            dgv_Image.DataSource = dt;
            dgv_Image.DataBind();
            ViewState["vs_dtUploadImage"] = dt;
            ViewState["vs_Index"] = int.Parse(ViewState["vs_Index"].ToString()) + 1;
        }
        else
        {
            Label2.Text = "Click 'Browse' to select the file to upload.";
        }

        Panel1.Visible = true;
    }

    //creating a new group with the apartment details and pictures
    protected void btn_CreateGroup_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txt_City.Value) || String.IsNullOrEmpty(txt_Street.Value) || String.IsNullOrEmpty(txt_No.Value) || String.IsNullOrEmpty(DropDownList1.SelectedItem.Value) || String.IsNullOrEmpty(txt_Desc.Value))
        {
            lbl_Group_error.Text = "Error: Fill All Manadatory Field";
            return;
        }

        DataTable dt = (DataTable)ViewState["vs_dtUploadImage"];
        if (dt.Rows.Count < 2)
        {
            lbl_Group_error.Text = "At Least Upload 2 Images of Room";
            return;
        }

        String Query = "sp_InsertRoom '" +txt_City.Value + "','" + txt_Street.Value + "','" + txt_No.Value + "','" + DropDownList1.SelectedItem.Value + "','" + Session["Email"] + "','" + txt_Desc.Value + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            if (dt1.Rows[0]["Result"].ToString() == "-1")
            {
                lbl_Group_error.Text = "Already Member of a Group";
            }
            else if (dt1.Rows[0]["Result"].ToString() != "0")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Query = "insert into tbl_RoomPictures values('"+ dt1.Rows[0]["Result"].ToString() + "','"+ dt.Rows[i]["ImageName"].ToString()  +"',1,GETDATE())";
                    cmd.Connection = con;
                    cmd.CommandText = Query;
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }

                lbl_Group_error.Text = "Group Created Sucessfully";
                ClearAllGroupFields();
                Panel1.Visible = false;
                Session["Group_Id"] = dt1.Rows[0]["Result"].ToString();
            }
            else if (dt1.Rows[0]["Result"].ToString() == "0")
            {
                lbl_Group_error.Text = "Some Issue Contact Administrator";
            }
        }
    }

    void ClearAllGroupFields()
    {
        txt_City.Value = txt_No.Value = txt_Street.Value = DropDownList1.SelectedItem.Value = txt_Desc.Value = null;
        dgv_Image.DataSource = null;
        dgv_Image.DataBind();
    }

    //allows the user to leave an existing group
    protected void btn_LeaveGroup_Click(object sender, EventArgs e)
    {
        if (txt_Group_No.Text == Session["Group_Id"].ToString())
        {
            String Query = " update tbl_GroupRelation set isActive = 0 where Room_Id = '" + Session["Group_Id"] + "' and User_Id = '" + Session["User_Id"] + "'";
            cmd.CommandText = Query;
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Session["Group_Id"] = 0;
            Response.Redirect("EditProfile.aspx");
        }
        else
            lbl_GroupLeave.Text = "Invalid Group Number";
    }
}