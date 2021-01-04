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
    public partial class acount : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        //Boolean alert = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            string u_name="";
            try
            {
                u_name = Session["u_name"].ToString();
            }
            catch(Exception ex)
            {
                Server.Transfer("signin.aspx");
            }
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblfname.Text = dt.Rows[0].Field<string>("user_first_name");
            lbllname.Text = dt.Rows[0].Field<string>("user_last_name");
            lbluname.Text = dt.Rows[0].Field<string>("user_name");
            lblmail.Text = dt.Rows[0].Field<string>("user_mail_address");
            lblconno.Text = dt.Rows[0].Field<string>("user_contact_no");
            con.Close();
            LinkButton btn = (LinkButton)Master.FindControl("btnhome");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnusers");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnshares");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btntransactions");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnblockchain");
            btn.CssClass = "nav-link";
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //if (!alert)
            //{
                string u_name = Session["u_name"].ToString();
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int id = dt.Rows[0].Field<int>("user_id");
                string l_name = dt.Rows[0].Field<string>("user_last_name");
                string f_name = dt.Rows[0].Field<string>("user_first_name");
                string mail = dt.Rows[0].Field<string>("user_mail_address");
                if (tbmail.Text == "") { tbmail.Text = mail; }
                if (tbfname.Text == "") { tbfname.Text = f_name; }
                if (tblname.Text == "") { tblname.Text = l_name; }
                if (mail!=tbmail.Text || f_name != tbfname.Text || l_name != tblname.Text)
                {
                    DateTime now = DateTime.Now;
                    string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                    SqlCommand cmd = new SqlCommand("update user_master set user_date_updated='"+timenow+"',user_first_name='"+tbfname.Text+ "',user_last_name='" + tblname.Text + "',user_mail_address='" + tbmail.Text + "' where user_id='"+id+"'", con);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                Response.Redirect("adminAccount.aspx");
            //}
           // else
           // {
           //     lblunamenotavail.Visible=true;
           // }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            lblfname.Visible = false;
            lbllname.Visible = false;
            lblmail.Visible = false;
            tbfname.Visible = true;
            tblname.Visible = true;
            tbmail.Visible = true;
            btnsave.Visible = true;
        }

        //protected void tbuname_TextChanged(object sender, EventArgs e)
        //{
        //    string u_name = tbuname.Text;
        //    con.Open();
        //    SqlDataAdapter adapter = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "'", con);
        //    DataTable dt = new DataTable();
        //    adapter.Fill(dt);
        //    if (dt.Rows.Count == 1)
        //    {
        //        alert = true;
        //    }
        //    else
        //    {
        //        alert = false;
        //    }
        //    con.Close();
        //}
    }
}