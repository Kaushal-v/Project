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
    public partial class adminDefault : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            try
            {
                if (Session["type"].ToString() != "admin")
                {
                    Response.Redirect("clientDefault.aspx");
                }           
            }
            catch (Exception ex) { }
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select count(*) as cout from user_master", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            lbltotal_users.Text = dt.Rows[0].Field<int>("cout").ToString();
            da = new SqlDataAdapter("select count(*) as cout from share_master", con);
            dt = new DataTable();
            da.Fill(dt);
            lbltotal_shares.Text = dt.Rows[0].Field<int>("cout").ToString();
            da = new SqlDataAdapter("select sum(share_sold_count) as cout from share_master", con);
            dt = new DataTable();
            da.Fill(dt);
            lblsoldshares.Text = dt.Rows[0].Field<int>("cout").ToString();
        }

        
    }
}