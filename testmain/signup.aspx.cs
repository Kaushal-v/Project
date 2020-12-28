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
    public partial class signup : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        Boolean alert = true;

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
        }

        protected void Signup_Click(object sender, EventArgs e)
        {
            if (!alert)
            {
                string u_name = u_namet.Text;
                string l_name = l_namet.Text;
                string f_name = f_namet.Text;
                string mail = mailt.Text;
                string con_no = con_not.Text;
                string pass = passt.Text;
                string type="sub";
                if (cbminer.Checked)
                {
                    type = "miner";
                }
                string d_name = f_name + " " + l_name;
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into users(user_name, first_name, last_name, display_name, date_created, mail_address ,contact_no, password, type, active) values('" + u_name + "','" + f_name + "','" + l_name + "','" + d_name + "','" + timenow + "','" + mail + "','" + con_no + "','" + pass + "','"+type+"','true')", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter("select id from users where user_name='" + u_name + "'", con);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                int id = dt.Rows[0].Field<int>("id");
                cmd = new SqlCommand("insert into active_users(id,lower_user_name,password,last_login,type) values('" + id + "','" + u_name + "','" + pass + "','" + timenow + "','"+type+"')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                if (type == "miner")
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = type;
                    Response.Redirect("minersPage.aspx");
                }
                else
                {
                    Session["u_name"] = u_name;
                    Session["pass"] = pass;
                    Session["type"] = type;
                    Response.Redirect("profile.aspx");
                }
            }
            else
            {
                string msg = "User name is not available!!";
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('" + msg + "');", true);
            }
        }

        protected void u_namet_TextChanged(object sender, EventArgs e)
        {
            string u_name = u_namet.Text;
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("select * from users where user_name='" + u_name + "'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                alert = true;
            }
            else
            {
                alert = false;
            }
            con.Close();
        }

        protected void google_Click(object sender, EventArgs e)
        {

        }
    }
}