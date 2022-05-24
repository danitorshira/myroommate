using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoinGroup : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    public JoinGroup()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GroupRequest();
        }
    }

    void GroupRequest()
    {

        String Query = " select * from vw_GetRequest where Group_Id = '"+ Session["Group_Id"] +"'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            dgv.DataSource = dt;
            dgv.DataBind();
        }
        else
        {
            dgv.DataSource = null;
            dgv.DataBind();
        }
    }

    protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select") // Approve
        {
            String Id = Convert.ToString(e.CommandArgument.ToString());
            String Query = "sp_ApproveRequest '" + Id + "'";
            cmd.CommandText = Query;
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            GroupRequest();
        }
        else if (e.CommandName == "select1") // Reject
        {
            String Id = Convert.ToString(e.CommandArgument.ToString());
            String Query = "  update tbl_Request set Status = 'R' where Request_Id = '" + Id + "'";
            cmd.CommandText = Query;
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            GroupRequest();
        }
    }
}