using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Task : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    DataTable dtUploadImage = new DataTable();

    public Task()
    {
        con = new SqlConnection(ConnectionString);
        cmd = new SqlCommand();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Group_Id"] != null)
        {
            if (Session["Group_Id"].ToString() == "0")
            {
                sectionMain.Visible = false;
                h1.Visible = true;
            }
        }
        else
            Response.Redirect("Index.aspx");

        if (!IsPostBack)
        {
            LoadGroupMember();
            DDL_GroupMember.Items.Insert(0, "---Select---");
            LoadOpenedTasked();
        }
    }

    void LoadOpenedTasked()
    {
        String Query = "sp_GetOpenedTask '" + Session["User_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            dgv_AssignTask.DataSource = dt1;
            dgv_AssignTask.DataBind();
        }
    }

    void LoadmyTasked()
    {
        String Query = "sp_GetmyTask '" + Session["User_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            lbl_myTaskMessage.InnerText = "";
            dgv_myTask.DataSource = dt1;
            dgv_myTask.DataBind();
        }
        else
            lbl_myTaskMessage.InnerText = "No Task Assign to You";
    }
    void LoadGroupMember()
    {
        String Query = "sp_GetGroupMember '"+ Session["Group_Id"] +"','"+ Session["User_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            DDL_GroupMember.DataSource = dt1;
            DDL_GroupMember.DataTextField = "Name";
            DDL_GroupMember.DataValueField = "User_Id";
            DDL_GroupMember.DataBind();
        }
    }

    protected void btn_AssignTask_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = true;
        div_MyTask.Visible = false;
        grouptask.Visible = false;
    }

    protected void btn_MyTask_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = false;
        div_MyTask.Visible = true;
        grouptask.Visible = false;
        LoadmyTasked();
    }

    protected void btn_Assign_Click(object sender, EventArgs e)
    {
        String Priority = String.Empty;
        if (radio_High.Checked)
            Priority = "High";
        else if (radio_Medium.Checked)
            Priority = "Medium";
        else if (radio_Low.Checked)
            Priority = "Low";

        if (String.IsNullOrEmpty(txt_TaskName.Value) || String.IsNullOrEmpty(txt_DueDate.Value))
        {
            lbl_msg.Text = "Error: Fill All Manadatory Field";
            return;
        }

        String Query = "sp_InsertTask '" + txt_TaskName.Value + "','" + Priority + "','" + Session["User_Id"] + "','" + DDL_GroupMember.SelectedValue + "','" + Session["Group_Id"] + "','" + txt_DueDate.Value + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {

            if (dt1.Rows[0]["Result"].ToString() == "1")
            {
                lbl_msg.Text = "Task Assigned Sucessfully";
                LoadOpenedTasked();
                ClearAllFields();
            }
            else if (dt1.Rows[0]["Result"].ToString() == "0")
            {
                lbl_msg.Text = "Some Issue Contact Administrator";
            }
        }
    }

    void ClearAllFields()
    {
        txt_TaskName.Value = null;
        txt_DueDate.Value = null;
        radio_Medium.Checked = true;
        DDL_GroupMember.SelectedIndex = 0;
    }

    protected void dgv_myTask_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            String Task_Id = Convert.ToString(e.CommandArgument.ToString());
            String Query = "  update tbl_Todolist set Status = 'C' where Task_Id = '"+ Task_Id +"'";
            cmd.CommandText = Query;
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            LoadmyTasked();
        }
    }

    protected void btn_GroupTask_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = false;
        div_MyTask.Visible = false;
        grouptask.Visible = true;
        LoadWholeGroupTasked();
    }

    void LoadWholeGroupTasked()
    {
        String Query = "sp_GetFullGroupTask '" + Session["Group_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            lbl_myTaskMessage.InnerText = "";
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        else
            lbl_myTaskMessage.InnerText = "No Task Assign to You";
    }
}