using ASPSnippets.GoogleAPI;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;


    public index()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //GoogleConnect.ClientId = "227246102989-o1fng6s9jhu8bg1sv27elrh9hh0v1edr.apps.googleusercontent.com";
        //GoogleConnect.ClientSecret = "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";
        //GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

        //if (!this.IsPostBack)
        //{
        //    if (!string.IsNullOrEmpty(Request.QueryString["code"]))
        //    {
        //        string code = Request.QueryString["code"];
        //        string json = GoogleConnect.Fetch("me", code);
        //        GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
        //        if (profile.Id != "0")
        //        {
        //            String Query = "insert into tbl_UserProfile(FirstName,Email,isActive,Created_DateTime) values('" + profile.Name + "','" + profile.Email + "',1,GETDATE())";
        //        }
        //        //lblId.Text = profile.Id;
        //        //lblName.Text = profile.Name;
        //        //lblEmail.Text = profile.Email;
        //        //lblVerified.Text = profile.Verified_Email;
        //        //ProfileImage.ImageUrl = profile.Picture;
        //        //pnlProfile.Visible = true;
        //        //btnLogin.Enabled = false;
        //    }
        //    if (Request.QueryString["error"] == "access_denied")
        //    {
        //        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
        //    }
        //}
    }

    //Checking if email & password are matched in user vw_UserProfile table.
    //If a match is found, the details about that user will be retrieved.
    //Else, an appropriate message will come out that one of the details entered is incorrect.
    protected void btn_Login_Click(object sender, EventArgs e)
    {

        String Query = "  select * from vw_UserProfile where Email = '" + txt_Email.Value + "' and Password = '"+ txt_Password.Value +"' ";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["Name"] = dt.Rows[0]["FirstName"].ToString();
            Session["Email"] = dt.Rows[0]["Email"].ToString();
            Session["Group_Id"] = dt.Rows[0]["Group_Id"].ToString();
            Session["User_Id"] = dt.Rows[0]["User_Id"].ToString();
            Response.Redirect("About.aspx");
        }
        else
            lbl_msg.Text = "Invalid Username & Password";
           
    }

    protected void btn_GoogleLogin_Click(object sender, EventArgs e)
    {
        //GoogleConnect.Authorize("profile", "email");
    }
}

public class GoogleProfile
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string Picture { get; set; }
    public string Email { get; set; }
    public string Verified_Email { get; set; }
}