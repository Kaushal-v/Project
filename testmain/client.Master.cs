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
        string share_id="3";
        protected void Page_Load(object sender, EventArgs e)
        {
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
                catch(Exception ex) { }
                string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                con.ConnectionString = constr;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select user_first_name from user_master where user_name='"+u_name+"' ",con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                btnfirstname.Text = dt.Rows[0].Field<string>("user_first_name").ToUpperInvariant();
                da = new SqlDataAdapter("select * from share_master", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ddlpanelshare.DataTextField = ds.Tables[0].Columns["share_name"].ToString();
                ddlpanelshare.DataValueField = ds.Tables[0].Columns["share_id"].ToString();
                ddlpanelshare.DataSource = ds.Tables[0];
                ddlpanelshare.DataBind();
                //ddlpanelshare.Items.Insert(0, new ListItem("Select", "Select"));
                double bal = 0;
                if (Application["obj_blockchain"] != null)
                {
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    try
                    {
                        bal = b1.getBalance(u_name);
                    }
                    catch(Exception ex){ }
                }
                btnchips.Text += bal.ToString();
                lblpanelchips.Text = btnchips.Text;
                con.Close();
            }
            catch (Exception ex) {  }
        }
        protected void btnlogoutc_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");   
        }

        protected void btnpanelconfirm_Click(object sender, EventArgs e)
        {
            string u_name = Session["u_name"].ToString();
            int u_id = Convert.ToInt32(Session["u_id"]);
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
                string u_nameHash=b1.getAddress(u_name);
                b1.CreateTransaction(new Transaction(u_nameHash, companyHash, total_price));
                da = new SqlDataAdapter("Select * from share_holder_master where share_id='" + share_id + "' and user_id='"+u_id+"'", con);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    DateTime now = DateTime.Now;
                    string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                    SqlCommand cmd = new SqlCommand("insert into share_holder_master(user_id,share_id,holder_share_count,share_holder_last_updated_time) values('"+u_id+"','"+share_id+"','"+count+"','"+timenow+"')", con);
                    cmd.ExecuteNonQuery();
                    da = new SqlDataAdapter("Select share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    int avail_count = dt.Rows[0].Field<int>("share_available_count") - count;
                    int sold_count = dt.Rows[0].Field<int>("share_sold_count") + count;
                    cmd = new SqlCommand("update share_master set share_available_count = '"+avail_count+ "',share_sold_count = '"+sold_count+"' where share_id='"+share_id+"'", con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("clientDefault.aspx");
                }
            }
            con.Close();
        }

        protected void ddlpanelshare_SelectedIndexChanged(object sender, EventArgs e)
        {
            share_id = ddlpanelshare.SelectedValue.ToString();
        }
    }
}