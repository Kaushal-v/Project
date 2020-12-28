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
            LinkButton signinbutton = (LinkButton)Master.FindControl("signinbutton");
            signinbutton.Visible = false;
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            string u_name = u_namet.Text;
            string pass = passt.Text;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM active_users Where lower_user_name='" + u_name + "' and password='" + pass + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (1 == dt.Rows.Count)
            {
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                SqlCommand cmd1 = new SqlCommand("update active_users set last_login='" + timenow + "' where id='" + dt.Rows[0].Field<int>("id") + "'", con);
                cmd1.ExecuteNonQuery();
                if (dt.Rows[0].Field<string>("type").Equals("miner") && dt.Rows[0].Field<string>("password").Equals(pass))
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("type");
                    Response.Redirect("minersPage.aspx");
                }
                else if(dt.Rows[0].Field<string>("type").Equals("admin") && dt.Rows[0].Field<string>("password").Equals(pass))
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("type");
                    Response.Redirect("adminDefault.aspx");
                }
                else if (dt.Rows[0].Field<string>("password")==pass)
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = dt.Rows[0].Field<string>("type");
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