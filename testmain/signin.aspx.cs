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
    public partial class signin : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
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
            catch (Exception ex) { }
            Master.FindControl("btnsignin").Visible = false;
            Master.FindControl("btnsignup").Visible = false;
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            string u_name = u_namet.Text;
            string pass = passt.Text;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM user_master Where user_name='" + u_name + "' and user_password='" + pass + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (1 == dt.Rows.Count)
            {
                if (dt.Rows[0].Field<string>("user_type").Equals("miner") && dt.Rows[0].Field<string>("user_password").Equals(pass))
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("user_type");
                    Response.Redirect("minersPage.aspx");
                }
                else if(dt.Rows[0].Field<string>("user_type").Equals("admin") && dt.Rows[0].Field<string>("user_password").Equals(pass))
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("user_type");
                    Response.Redirect("adminDefault.aspx");
                }
                else if (dt.Rows[0].Field<string>("user_password")==pass)
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("user_type");
                    Response.Redirect("clientDefault.aspx");
                }
                else
                {
                    string msg = "Username or Password is incorrect!!";
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('" + msg + "');", true);
                }
            }
            else
            {
                string msg = "Username or Password is incorrect!!";
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('" + msg + "');", true);
            }
            con.Close();
        }
    }
}