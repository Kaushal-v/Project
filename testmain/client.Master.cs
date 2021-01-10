using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace testmain
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        readonly SqlConnection con = new SqlConnection();
        string share_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                con.ConnectionString = constr;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from share_master"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlpanelshare.DataSource = cmd.ExecuteReader();
                        ddlpanelshare.DataTextField = "share_name";
                        ddlpanelshare.DataValueField = "share_id";
                        ddlpanelshare.DataBind();
                        con.Close();
                    }
                }
                ddlpanelshare.Items.Insert(0, new ListItem("Select", "Select"));
            }
            try
            {
                btnchips.Text = "Chips ";
                string u_name = Session["u_name"].ToString();
                try
                {

                    if (Session["type"].ToString() == "sub")
                    {
                        btnmine.Visible = false;
                    }
                }
                catch(Exception) 
                {
                    Response.Redirect("signin.aspx");
                }
                string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                con.ConnectionString = constr;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select user_first_name from user_master where user_name='"+u_name+"' ",con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                btnfirstname.Text = dt.Rows[0].Field<string>("user_first_name").ToUpperInvariant();                
                double bal = 0;
                if (Application["obj_blockchain"] != null)
                {
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    try
                    {
                        bal = b1.getBalance(b1.getAddress(u_name));
                    }
                    catch(Exception){ }
                }
                btnchips.Text += bal.ToString();
                lblpanelchips.Text = btnchips.Text;
                con.Close();
            }
            catch (Exception) {  }
        }
        protected void btnlogoutc_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");   
        }

        protected void btnpanelconfirm_Click(object sender, EventArgs e)
        {
            if (ddlpanelshare.SelectedItem.Value != "Select" && tbpanelcount.Text != "")
            {
                string u_name="";
                int u_id=0;
                lblconfirm.Visible = false;
                try
                {
                    u_name = Session["u_name"].ToString();
                    u_id = Convert.ToInt32(Session["u_id"]);
                }
                catch(Exception)
                {
                    Response.Redirect("signin.aspx");
                }
                string companyName = "ShareLog";
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                string companyHash = b1.getAddress(companyName);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select share_price from share_master where share_id='" + share_id + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                string halfChips = lblpanelchips.Text.Substring(5);
                halfChips.Trim();
                double chips = Convert.ToDouble(halfChips);
                int count = Convert.ToInt32(tbpanelcount.Text);
                double total_price = count * dt.Rows[0].Field<double>("share_price");
                if (chips > total_price)
                {
                    string u_nameHash = b1.getAddress(u_name);
                    b1.CreateTransaction(new Transaction(u_nameHash, companyHash, total_price));
                    da = new SqlDataAdapter("Select * from share_holder_master where share_id='" + share_id + "' and user_id='" + u_id + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        DateTime now = DateTime.Now;
                        string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        SqlCommand cmd = new SqlCommand("insert into share_holder_master(user_id,share_id,holder_share_count,share_holder_last_updated_time) values('" + u_id + "','" + share_id + "','" + count + "','" + timenow + "')", con);
                        cmd.ExecuteNonQuery();
                        da = new SqlDataAdapter("Select share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        int avail_count = dt.Rows[0].Field<int>("share_available_count") - count;
                        int sold_count = dt.Rows[0].Field<int>("share_sold_count") + count;
                        cmd = new SqlCommand("update share_master set share_available_count = '" + avail_count + "',share_sold_count = '" + sold_count + "' where share_id='" + share_id + "'", con);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("clientDefault.aspx");
                    }
                    else
                    {
                        DateTime now = DateTime.Now;
                        da = new SqlDataAdapter("Select holder_share_count from share_holder_master where share_id='" + share_id + "' and user_id='"+u_id+"'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        int avail_count = dt.Rows[0].Field<int>("holder_share_count") + count;
                        string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        SqlCommand cmd = new SqlCommand("update share_holder_master set holder_share_count='"+avail_count+"' ,share_holder_last_updated_time='"+timenow+"'", con);
                        cmd.ExecuteNonQuery();
                        da = new SqlDataAdapter("Select share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        int total_avail_count = dt.Rows[0].Field<int>("share_available_count") - count;
                        int sold_count = dt.Rows[0].Field<int>("share_sold_count") + count;
                        cmd = new SqlCommand("update share_master set share_available_count = '" + total_avail_count + "',share_sold_count = '" + sold_count + "' where share_id='" + share_id + "'", con);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("clientDefault.aspx");
                    }
                }
                con.Close();
            }
            else
            {
                lblconfirm.Visible = true;
            }
            popupbuysell.Show();
        }

        protected void ddlpanelshare_SelectedIndexChanged(object sender, EventArgs e)
        {
            share_id = ddlpanelshare.SelectedItem.Value;
            ddlpanelshare.ClearSelection();
            ddlpanelshare.Items.FindByValue(share_id).Selected = true;
            popupbuysell.Show();
        }
    }
}