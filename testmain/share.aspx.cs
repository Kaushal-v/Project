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
            SqlDataAdapter da = new SqlDataAdapter("select * from share_master", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvsharedetails.DataSource = dt;
            gvsharedetails.DataBind();
            con.Close();
        }

        protected void btnaddshare_Click(object sender, EventArgs e)
        {
            lblsharedetails.Visible = true;
            gvsharedetails.Visible = false;
            btncancel.Visible = true;
            btnaddshare.Visible = false;
            btnsaveshare.Visible = true;
            tbsname.Visible = true;
            tbsprice.Visible = true;
            tbsavailc.Visible = true;
        }

        protected void btnsaveshare_Click(object sender, EventArgs e)
        {
            try
            {
                if (tbsavailc.Text != "" && tbsname.Text != "" && tbsprice.Text != "")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into share_master(share_name, share_price, share_available_count, share_sold_count) values('" + tbsname.Text + "','" + tbsprice.Text + "','" + tbsavailc.Text + "','0')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("share.aspx");
                }
                else
                {
                    lblincorrect.Visible = true;
                }
            }
            catch (Exception x)
            {
                lblincorrect.Visible = true;
            }
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
    }
}