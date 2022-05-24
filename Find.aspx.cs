using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Find : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    public Find()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAds();
        }

    }
    void LoadAds()
    {
        String Query = "sp_GetAllRoomsAds";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DL1.DataSource = dt;
            DL1.DataBind();
        }
    }
    protected void lbl_Filter_Click(object sender, EventArgs e)
    {
        lbl_Msg.Visible = false;
        bool selected = false;

        String ReligiousFilter = GetReligiousFilterString();
        String EducationFilter = GetEducationFilterString();
        String PoliticalFilter = GetPoliticalFilterString();
        String FoodFilter = GetFoodFilterString();
        String ResidenceFilter = GetResidenceFilterString();

        if (ReligiousFilter != null)
        {
            ReligiousFilter = ReligiousFilter.Replace(",)", ")");
            selected = true;
        }

        if (EducationFilter != null) { 
            EducationFilter = EducationFilter.Replace(",)", ")");
            selected = true;
        }

        if (PoliticalFilter != null) { 
            PoliticalFilter = PoliticalFilter.Replace(",)", ")");
            selected = true;
        }

        if (FoodFilter != null) { 
            FoodFilter = FoodFilter.Replace(",)", ")");
            selected = true;
        }

        if (ResidenceFilter != null) { 
            ResidenceFilter = ResidenceFilter.Replace(",)", ")");
            selected = true;
        }

        if (selected == true)
        {
            String Query = "sp_GetFilterRoomsAds '" + ReligiousFilter + "','" + EducationFilter + "','" + PoliticalFilter + "','" + FoodFilter + "','" + ResidenceFilter + "'";
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DL1.DataSource = dt;
                DL1.DataBind();
            }
            else
            {
                lbl_Msg.Visible = true;
                lbl_Msg.InnerText = "No Match Found";
                DL1.DataSource = null;
                DL1.DataBind();
            }
        }
        else
            LoadAds();
    }

    String GetReligiousFilterString()
    {
        bool ReligionSelected = false;

        String FilterReligion = " AND Religious in (";
        if (chk_Reg_Secular.Checked)
        {
            FilterReligion += "''Secular'',";
            ReligionSelected = true;
        }

        if (chk_Reg_Religious.Checked)
        {
            FilterReligion += "''Religious'',";
            ReligionSelected = true;
        }
        if (chk_Reg_Traditional.Checked)
        {
            FilterReligion += "''Traditional'',";
            ReligionSelected = true;
        }

        if (ReligionSelected == true)
            FilterReligion += ")";
        else
            FilterReligion = null;

        return FilterReligion;
    }
    String GetEducationFilterString()
    {
        bool EducationSelected = false;

        String FilterEducation = " AND Education in (";
        if (chk_12year.Checked)
        {
            FilterEducation += "''12 school years'',";
            EducationSelected = true;
        }

        if (chk_high.Checked)
        {
            FilterEducation += "''high school education'',";
            EducationSelected = true;
        }
        if (chk_Academic.Checked)
        {
            FilterEducation += "''Academic education'',";
            EducationSelected = true;
        }

        if (EducationSelected == true)
            FilterEducation += ")";
        else
            FilterEducation = null;

        return FilterEducation;
    }

    String GetPoliticalFilterString()
    {
        bool PoliticalSelected = false;

        String FilterPolitical = " AND Political in (";
        if (chk_Rightist.Checked)
        {
            FilterPolitical += "''Rightist'',";
            PoliticalSelected = true;
        }

        if (chk_Leftist.Checked)
        {
            FilterPolitical += "''Leftist'',";
            PoliticalSelected = true;
        }
        if (chk_Neutral.Checked)
        {
            FilterPolitical += "''Neutral'',";
            PoliticalSelected = true;
        }

        if (PoliticalSelected == true)
            FilterPolitical += ")";
        else
            FilterPolitical = null;

        return FilterPolitical;
    }
    String GetFoodFilterString()
    {
        bool FoodSelected = false;

        String FilterFood = " AND Food in (";
        if (chk_Vegetarian.Checked)
        {
            FilterFood += "''Vegetarian'',";
            FoodSelected = true;
        }

        if (chk_Vegan.Checked)
        {
            FilterFood += "''Vegan'',";
            FoodSelected = true;
        }
        if (chk_kosher.Checked)
        {
            FilterFood += "''kosher'',";
            FoodSelected = true;
        }

        if (FoodSelected == true)
            FilterFood += ")";
        else
            FilterFood = null;

        return FilterFood;
    }

    String GetResidenceFilterString()
    {
        bool ResidenceSelected = false;

        String FilterResidence = " AND Residence in (";
        if (chk_Central.Checked)
        {
            FilterResidence += "''Central Israel'',";
            ResidenceSelected = true;
        }

        if (chk_North.Checked)
        {
            FilterResidence += "''North Israel'',";
            ResidenceSelected = true;
        }
        if (chk_South.Checked)
        {
            FilterResidence += "''South Israel'',";
            ResidenceSelected = true;
        }

        if (ResidenceSelected == true)
            FilterResidence += ")";
        else
            FilterResidence = null;

        return FilterResidence;
    }

    protected void btn_Contact_Click(object sender, EventArgs e)
    {
        var argument = ((Button)sender).CommandArgument;
        String URL = "https://wa.me/+92" + argument + "/?text=" + HttpUtility.UrlEncode("Hi, How are you?");
        string s = "window.open('" + URL + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }
    protected void btn_JoinGroup_Click(object sender, EventArgs e)
    {
        var argument = ((Button)sender).CommandArgument;
        String Query = "sp_InsertRequest '" + Session["User_Id"] + "' , '" + argument + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Result"].ToString() == "-2")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Join Member Full');", true);
            }
            else if (dt.Rows[0]["Result"].ToString() == "1")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Join Group Request has been Sended');", true);
            }
            else if (dt.Rows[0]["Result"].ToString() == "-1")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Already Send a Request');", true);
            }
            else if (dt.Rows[0]["Result"].ToString() == "0")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Contact to Admin Some Issue');", true);
            }
        }
    }
}