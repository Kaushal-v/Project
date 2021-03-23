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
    public partial class WebForm1 : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        Boolean boolu_name = true,boolpass = true,boolmail=true,boolphone=true;        
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
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select count(*) as cout from user_master where user_type='sub'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblsubs.Text = dt.Rows[0].Field<int>("cout").ToString();
            int user_count = dt.Rows[0].Field<int>("cout");
            da = new SqlDataAdapter("select count(*) as cout from user_master where user_type='miner'", con);
            dt = new DataTable();
            da.Fill(dt);            
            lblminers.Text = dt.Rows[0].Field<int>("cout").ToString();
            user_count += dt.Rows[0].Field<int>("cout");
            da = new SqlDataAdapter("select count(*) as cout from user_master where user_type='admin'", con);
            dt = new DataTable();
            da.Fill(dt);
            lbladmins.Text = dt.Rows[0].Field<int>("cout").ToString();
            user_count += dt.Rows[0].Field<int>("cout");
            con.Close();
            List<string> ip_list = (List<string>)Application["ip_list"];
            lblguests.Text = (ip_list.Count).ToString();
            if (IsPostBack)
            {
                tbuname_changed();
                tbpass_changed();
                mail_validate();
                phone_validation();
            }
        }
      
        protected void tbuname_changed()
        {
            string u_name = tbuname.Text;
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
        protected void tbpass_changed()
        {
            String pass = tbpass.Text;
            if (pass.Length < 8)
            {
                boolpass = true;
            }
            else
            {
                boolpass = false;
            }
        }   
        protected void mail_validate()
        {
            Regex regex = new Regex(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", RegexOptions.CultureInvariant | RegexOptions.Singleline);
            bool isValidEmail = regex.IsMatch(tbmail.Text);
            if (!isValidEmail)
            {
                boolmail = true;
            }
            else
            {
                boolmail = false;
            }
        }
        protected void phone_validation()
        {            
            if (!(tbconno.Text.Length==10))
            {
                boolphone = true;
            }
            else
            {
                boolphone = false;
            }
        }
        protected void btnpanelconfirm_Click(object sender, EventArgs e)
        {            
            if (!boolu_name && !boolpass && ddlusertype.SelectedValue != "Select" && !boolmail && !boolphone)
            {
                string u_name = tbuname.Text.ToLower();
                string l_name = tblname.Text;
                string f_name = tbfname.Text;
                string mail = tbmail.Text;
                string con_no = tbconno.Text;
                string pass = tbpass.Text;
                string type = ddlusertype.SelectedValue;
                string d_name = f_name + " " + l_name;
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into user_master(user_name, user_first_name, user_last_name, user_display_name, user_date_created, user_mail_address ,user_contact_no, user_password, user_type, user_active, user_last_login) values('" + u_name + "','" + f_name + "','" + l_name + "','" + d_name + "','" + timenow + "','" + mail + "','" + con_no + "','" + pass + "','" + type + "','true','" + timenow + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                if (ddlusertype.SelectedValue != "admin")
                {
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    string u_hash = b1.getAddress(u_name);
                    b1.CreateTransaction(new Transaction("null", u_hash, 10));
                }
                Response.Redirect("users.aspx");
            }
            if (boolu_name) { lblunamenot.Visible = true; }
            else { lblunamenot.Visible = false; }
            if (boolmail) { lblmail.Visible = true; }
            else { lblmail.Visible = false; }
            if (boolphone) { lblphone.Visible = true; }
            else { lblphone.Visible = false; }
            if (ddlusertype.SelectedValue == "Select") { lblselectvalid.Visible = true; }
            else { lblselectvalid.Visible = false; }
            if (boolpass) { lblpassnotcorrect.Visible = true; }
            else { lblpassnotcorrect.Visible = false; }             
            popupadduser.Show();
        }

        protected void tbpass_TextChanged(object sender, EventArgs e)
        {            
            tbpass_changed();            
        }

        protected void tbuname_TextChanged(object sender, EventArgs e)
        {
            tbuname_changed();
        }

        protected void btnpanelcancel_Click(object sender, EventArgs e)
        {
            tbpass.Text = "";
            tbmail.Text = "";
            tblname.Text = "";
            tbfname.Text = "";
            tbuname.Text = "";
            tbconno.Text = "";
            lblselectvalid.Visible = false;
            lblpassnotcorrect.Visible = false;
            lblunamenot.Visible = false;
            ddlusertype.SelectedIndex = 0;
        }

        protected void ddlusertype_SelectedIndexChanged(object sender, EventArgs e)
        {
            popupadduser.Show();     
        }

        protected void tbconno_TextChanged(object sender, EventArgs e)
        {
            phone_validation();
        }

        protected void tbmail_TextChanged(object sender, EventArgs e)
        {
            mail_validate();
        }

        protected void tbusersearch_TextChanged(object sender, EventArgs e)
        {
            lblnouserfound.Visible = false;
        }

        protected void btnsearchuser_Click(object sender, EventArgs e)
        {
            string u_name = tbusersearch.Text;
            SqlDataAdapter da = new SqlDataAdapter("select user_id from user_master where user_name='" + u_name + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int u_id;
            if (dt.Rows.Count != 0)
            {
                u_id = dt.Rows[0].Field<int>("user_id");
                Response.Redirect("adminUserProfile.aspx?u_id=" + u_id);
            }
            else
            {
                lblnouserfound.Visible = true;
            }
        }
    }
}