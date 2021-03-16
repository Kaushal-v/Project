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
    public partial class admin : System.Web.UI.MasterPage
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string type ="";
            string u_name = "";
            try
            {
                type = Session["type"].ToString();
                u_name = Session["u_name"].ToString();
                
            }
            catch(Exception)
            {
                Response.Redirect("signin.aspx");
            }
            if (type != "admin")
            {
                Response.Redirect("clientDefault.aspx");
            }
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select user_first_name from user_master where user_name='" + u_name + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            btnfirstname.Text = dt.Rows[0].Field<string>("user_first_name").ToUpperInvariant();
            lblcuryear.Text = DateTime.Now.Year.ToString();
            con.Close();
        }

        protected void btnlogoutc_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");
        }
    }
}