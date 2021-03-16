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

namespace testmain
{
    public partial class share : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter da;
            DataTable dt;
            try
            {
                if (Session["share_id"] != null)
                {
                    int share_id = Convert.ToInt32(Session["share_id"].ToString());
                    con.Open();
                    da = new SqlDataAdapter("select share_name from share_master where share_id='" + share_id + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    lblpanelsharename.Text = dt.Rows[0].Field<string>("share_name");
                    con.Close();
                    popupaddshare.Show();
                }
            }
            catch(Exception) 
            {
            }
            LinkButton btn = (LinkButton)Master.FindControl("btnhome");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnusers");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnshares");
            btn.CssClass = "nav-link active";
            btn = (LinkButton)Master.FindControl("btntransactions");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnblockchain");
            btn.CssClass = "nav-link";
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            da = new SqlDataAdapter("select * from share_master", con);
            dt = new DataTable();
            da.Fill(dt);
            gvsharedetails.DataSource = dt;
            gvsharedetails.DataBind();
            con.Close();
        }
        
        protected void btnsaveshare_Click(object sender, EventArgs e)
        {
           
        }
        protected void gvsharedetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            int share_id = Convert.ToInt32(gvsharedetails.DataKeys[e.RowIndex].Values["share_id"].ToString());
            SqlCommand cmd = new SqlCommand("DELETE FROM share_master WHERE share_id = '" + share_id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("share.aspx");
        }        
        protected void gvsharedetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "addshare")
            {
                Session["share_id"] = e.CommandArgument.ToString();
                Page_Load(sender, e);
            }
            else if(e.CommandName == "deleteshare")
            {                
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from share_master where share_id='" + e.CommandArgument + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows[0].Field<int>("share_sold_count") - dt.Rows[0].Field<int>("share_received_count") == 0)
                {
                    SqlCommand cmd = new SqlCommand("delete share_master where share_id='" + e.CommandArgument + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("share.aspx");
                }
            }
        }

        protected void btnpanelcancel_Click(object sender, EventArgs e)
        {
            Session.Remove("share_id");
            Response.Redirect("share.aspx");
        }

        protected void btnpanelconfirm_Click(object sender, EventArgs e)
        {
            if (tbpanelcount.Text != "") {
                lblconfirm.Visible = false;
                int share_id = 0;
                try
                {
                    share_id = Convert.ToInt32(Session["share_id"].ToString());
                }
                catch (Exception)
                {
                    Response.Redirect("signin.aspx");
                }
                int count = Convert.ToInt32(tbpanelcount.Text);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select share_available_count from share_master where share_id='"+share_id+"'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int avail_count = dt.Rows[0].Field<int>("share_available_count") + count;
                SqlCommand cmd = new SqlCommand("update share_master set share_available_count='"+avail_count+"' where share_id='"+share_id+"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Session.Remove("share_id");
                Response.Redirect("share.aspx");
            }
            else
            {
                lblconfirm.Visible = true;                
            }
            popupaddshare.Show();
        }

        protected void btnpanel2cancel_Click(object sender, EventArgs e)
        {
            lblpanel2confirm.Visible = false;
            Response.Redirect("share.aspx");
        }

        protected void btnpanel2confirm_Click(object sender, EventArgs e)
        {
            try
            {
                if (tbshare_availc.Text != "" && tbshare_name.Text != "" && tbshare_price.Text != "")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into share_master(share_name, share_price, share_available_count, share_sold_count,share_received_count) values('" + tbshare_name.Text + "','" + tbshare_price.Text + "','" + tbshare_availc.Text + "','0','0')", con);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter("select * from share_master where share_name='" + tbshare_name.Text + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    int share_id = dt.Rows[0].Field<int>("share_id");
                    DateTime now = DateTime.Now;
                    string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                    cmd = new SqlCommand("insert into share_price_master(share_id,share_price_changing,share_date) values('" + share_id + "','" + tbshare_price.Text + "','" + timenow + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("share.aspx");
                }
                else
                {
                    lblpanel2confirm.Visible = true;
                }
            }
            catch (Exception)
            {
                lblpanel2confirm.Visible = true;
            }
            popupaddwholeshare.Show();
        }

        protected void gvsharedetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    DataRowView v = (DataRowView)e.Row.DataItem;

            //    if (e.Row.Cells.Count > 0 && e.Row.Cells[0] != null && e.Row.Cells[0].Controls.Count > 0)
            //    {                    
            //        Label lbl_id = e.Row.Cells[0].Controls[1] as Label;
            //        Label lbl_price = e.Row.Cells[0].Controls[2] as Label;
            //        Label lbl_change = e.Row.Cells[2].Controls[1] as Label;
            //        if (lbl_id != null)
            //        {
            //            try
            //            {
            //                DateTime now = DateTime.Now;
            //                DateTime yday = DateTime.Today.AddDays(-6);
            //                string yesterday = string.Format("{0:yyyy-MM-dd H:mm:ss}", yday);
            //                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
            //                int share_id = Convert.ToInt32(lbl_id.Text);
            //                SqlDataAdapter da = new SqlDataAdapter("select user_share_meta.share_id, user_share_meta.share_price,user_share_meta_time from user_share_meta ,share_master where share_master.share_id=user_share_meta.share_id and share_master.share_id='" + share_id + "' and user_share_meta_time between'" + yesterday + "' and '" + timenow + "' group by user_share_meta_time,user_share_meta.share_id, user_share_meta.share_price order by user_share_meta_time desc", con);
            //                DataTable dt = new DataTable();
            //                da.Fill(dt);
            //                double change = (Math.Round(100 - (dt.Rows[0].Field<double>("share_price") * 100) / Convert.ToDouble(lbl_price.Text), 2));
            //                if (change < 0)
            //                {
            //                    lbl_change.Text = change.ToString();
            //                    lbl_change.CssClass = "label-down";
            //                }
            //                else if (change > 0)
            //                {
            //                    lbl_change.Text = "+" + change.ToString();
            //                    lbl_change.CssClass = "label-up";
            //                }
            //            }
            //            catch (Exception)
            //            {
            //                lbl_change.Text = "0";
            //            }
            //        }

            //    }
            //}
        }
    }
}