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
                    Response.Redirect("ClientDefault.aspx");
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

        protected void Signup_Click(object sender, EventArgs e)
        {
            if (!alert)
            {
                string u_name = u_namet.Text.ToLower();
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
                SqlCommand cmd = new SqlCommand("insert into user_master(user_name, user_first_name, user_last_name, user_display_name, user_date_created, user_mail_address ,user_contact_no, user_password, user_type, user_active, user_last_login) values('" + u_name + "','" + f_name + "','" + l_name + "','" + d_name + "','" + timenow + "','" + mail + "','" + con_no + "','" + pass + "','"+type+"','true','"+timenow+"')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Session["u_name"] = u_name;
                Session["pass"] = pass;
                Session["type"] = type;
                Response.Redirect("clientDefault.aspx");
            }
            else
            {
                lblunamenot.Visible = true;
            }
        }

        protected void u_namet_TextChanged(object sender, EventArgs e)
        {
            string u_name = u_namet.Text;
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "'", con);
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