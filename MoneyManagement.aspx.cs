using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MoneyManagement : System.Web.UI.Page
{
    String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    public MoneyManagement()
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
            LoadAssignPayment();
        }
    }

    void LoadGroupMember()
    {
        String Query = "sp_GetGroupMemberAll '" + Session["Group_Id"] + "'";
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
    protected void btn_AssignMoney_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = true;
        div_MyTask.Visible = false;
        div2.Visible = false;
        LoadAssignPayment();
    }

    protected void btn_Myledger_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = false;
        div_MyTask.Visible = true;
        div2.Visible = false;
        LoadMyLedger();
    }

    void LoadMyLedger()
    {
        String Query = "SELECT AssignBy , FullPayment , Description , AssignDate , AssignTo , AssignPayment FROM vw_GetLedgerDetail where AssignToId = '" + Session["User_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            dgv_myLedger.DataSource = dt1;
            dgv_myLedger.DataBind();
        }
    }

    void LoadGroupLedger()
    {
        String Query = "SELECT AssignBy , FullPayment , Description , AssignDate , AssignTo , AssignPayment FROM vw_GetLedgerDetail where Group_Id = '" + Session["Group_Id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            dgv_Group.DataSource = dt1;
            dgv_Group.DataBind();
        }
    }
    protected void btn_AssignPayment_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txt_Payment.Value) || String.IsNullOrEmpty(txt_Date.Value))
        {
            lbl_msg.Text = "Error: Fill All Manadatory Field";
            return;
        }

        List<String> list = new List<String>();
        foreach (ListItem item in DDL_GroupMember.Items)
        {
            if (item.Selected)
            {
               list.Add(item.Value);
            }
        }

        if(list.Count == 0)
        {
            lbl_msg.Text = "Error: Please Select atleast one Group Member";
            return;
        }

        string query = "sp_InsertLedger '" + txt_Payment.Value + "','" + txt_Desc.Value + "','" + txt_Date.Value + "','" + Session["user_id"] + "','" + Session["Group_id"] + "'";
        SqlDataAdapter adp = new SqlDataAdapter(query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {

            if (dt1.Rows[0]["Result"].ToString() == "0")
            { 
             lbl_msg.Text = "some issue contact administrator";

            }
            else
            {
                String payment = (float.Parse(txt_Payment.Value) / list.Count).ToString();
                for (int i = 0; i < list.Count; i++)
                {
                    query = "insert into tbl_Ledger_Detail values('" + dt1.Rows[0]["Result"].ToString() + "','" + list[i] + "' ,'" + payment + "',GETDATE(),1)";
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }

                lbl_msg.Text = "Payment assigned sucessfully";
                LoadAssignPayment();
                txt_Payment.Value = txt_Desc.Value = txt_Date.Value = null;
            }
        }
    }

    void LoadAssignPayment()
    {
        String Query = "SELECT AssignBy , FullPayment , Description , AssignDate , AssignTo , AssignPayment FROM vw_GetLedgerDetail where AssignById = '" + Session["User_Id"] +"'";
        SqlDataAdapter adp = new SqlDataAdapter(Query, con);
        DataTable dt1 = new DataTable();
        adp.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            dgv_AssignPayment.DataSource = dt1;
            dgv_AssignPayment.DataBind();
        }
    }

    protected void btn_GroupLedger_Click(object sender, EventArgs e)
    {
        div_AssignTask.Visible = false;
        div_MyTask.Visible = false;
        div2.Visible = true;
        LoadGroupLedger();
    }
}