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
    public partial class clientDefault : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {            
                if (Session["type"].ToString() == "admin")
                {
                    Response.Redirect("adminDefault.aspx");
                }
            }
            catch (Exception ex) { }
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from share_master", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            share_info.DataSource = dt;
            share_info.DataBind();
            con.Close();
        }
    }
}