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
    public partial class home : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            blockchain b1 = new blockchain(2, 10);
            Session["obj_blockchain"] = b1;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            try
            {
                if (Session["type"].ToString() == "miner")
                {
                    Response.Redirect("minersPage.aspx");
                }
                if (Session["type"].ToString() == "admin")
                {
                    Response.Redirect("adminDefault.aspx");
                }
                if (Session["type"].ToString() == "sub")
                {
                    Response.Redirect("clientDefault.aspx");
                }
            }
            catch(Exception ex){}
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from share_master", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            share_info.DataSource = dt;
            share_info.DataBind();
            con.Close();
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}