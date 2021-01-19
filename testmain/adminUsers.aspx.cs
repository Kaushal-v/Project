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
    public partial class adminUsers : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)Master.FindControl("btnhome");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnusers");
            btn.CssClass = "nav-link active";
            btn = (LinkButton)Master.FindControl("btnshares");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btntransactions");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnblockchain");
            btn.CssClass = "nav-link";
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            try
            {
                if (Request.QueryString["type"] != null)
                {
                    string u_type =Request.QueryString["type"];
                    if (u_type == "miner")
                    {
                        lblmain.Text = "Miners";
                    }
                    else if (u_type == "admin")
                    {
                        lblmain.Text = "Admins";
                    }
                    else
                    {
                        lblmain.Text = "Subscribers";
                    }
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_type='"+u_type+"'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvuser_info.DataSource = dt;
                    gvuser_info.DataBind();
                    con.Close();
                }
                else if(Request.QueryString["u_id"] != null)
                {
                    int u_id = Convert.ToInt32(Request.QueryString["u_id"]);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_id='" + u_id + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);                    
                    con.Close();
                    lblmain.Text = dt.Rows[0].Field<string>("user_name");
                    gvuser_info.Visible = false;
                }
            }
            catch (Exception)
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from user_master", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvuser_info.DataSource = dt;
                gvuser_info.DataBind();
                con.Close();
            }
        }
    }
}