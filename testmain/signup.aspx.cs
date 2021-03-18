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
using System.Text.RegularExpressions;

namespace testmain
{
    public partial class signup : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        Boolean boolu_name = true;
        Boolean boolpass = true;
        Boolean boolphone = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;            
            Master.FindControl("btnsignin").Visible = false;
            Master.FindControl("btnsignup").Visible = false;
            if (IsPostBack && u_namet.Text!="" && passt.Text!="")
            {
                u_namet_changed();
                passt_changed();
                phone_validation();
            }
        }

        protected void Signup_Click(object sender, EventArgs e)
        {
            if (!boolu_name && !boolpass && !boolphone)
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
                SqlDataAdapter da = new SqlDataAdapter("SELECT user_id FROM user_master Where user_name='" + u_name + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Session["u_id"] = dt.Rows[0].Field<int>("user_id");
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                string u_hash = b1.getAddress(u_name);
                b1.CreateTransaction(new Transaction("null", u_hash, 10));
                Response.Redirect("clientDefault.aspx");
            }
            if (boolu_name) { lblunamenot.Visible = true; }
            else { lblunamenot.Visible = false; }
            if (boolphone) { lblphone.Visible = true; }
            else { lblphone.Visible = false; }
            if (boolpass) { lblpassnotcorrect.Visible = true; }
            else { lblpassnotcorrect.Visible = false; }

        }
        protected void u_namet_changed()
        {
            string u_name = u_namet.Text;
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                boolu_name = true;
            }
            else
            {
                boolu_name = false;
            }
            con.Close();
        }
        protected void u_namet_TextChanged(object sender, EventArgs e)
        {
            u_namet_changed();
        }
        protected void passt_changed()
        {
            string pass = passt.Text;
            if (pass.Length < 8)
            {
                boolpass = true;
            }
            else
            {
                boolpass = false;
            }
        }
        protected void passt_TextChanged(object sender, EventArgs e)
        {
            passt_changed();
        }

        protected void phone_validation()
        {
            if (!(con_not.Text.Length == 10))
            {
                boolphone = true;
            }
            else
            {
                boolphone = false;
            }
        }

        protected void con_not_TextChanged(object sender, EventArgs e)
        {
            phone_validation();
        }
        //protected void google_Click(object sender, EventArgs e)
        //{

        //}
    }
}