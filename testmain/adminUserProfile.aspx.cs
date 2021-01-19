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
    public partial class adminUserProfile : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

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
            SqlDataAdapter da;
            DataTable dt;
            cbminer.Attributes["onclick"] = "return false";
            try
            {                
                if (Request.QueryString["u_id"] != null)
                {
                    int u_id = Convert.ToInt32(Request.QueryString["u_id"]);
                    if (!IsPostBack)
                    {
                        con.Open();
                        da = new SqlDataAdapter("select * from user_master where user_id='" + u_id+ "' ", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        tbfname.Text = lblfname.Text = dt.Rows[0].Field<string>("user_first_name");
                        tblname.Text = lbllname.Text = dt.Rows[0].Field<string>("user_last_name");
                        lbluname.Text = dt.Rows[0].Field<string>("user_name");
                        tbmail.Text = lblmail.Text = dt.Rows[0].Field<string>("user_mail_address");
                        if ("miner" == dt.Rows[0].Field<string>("user_type"))
                        {
                            cbminer.Checked = true;
                            cbminer.Visible = true;
                            lblasminer.Visible = true;
                        }
                        else if("sub" == dt.Rows[0].Field<string>("user_type"))
                        {
                            cbminer.Visible = true;
                            lblasminer.Visible = true;
                        }
                        else if ("admin" == dt.Rows[0].Field<string>("user_type"))
                        {
                            cbminer.Visible = false;
                            lblasminer.Visible = false;
                        }
                        con.Close();
                    }
                    con.Open();
                    da = new SqlDataAdapter("select * from user_master where user_id='" + u_id + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    lblmain.Text = dt.Rows[0].Field<string>("user_name");
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            int u_id = Convert.ToInt32(Request.QueryString["u_id"]);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_id='" + u_id + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string l_name = dt.Rows[0].Field<string>("user_last_name");
            string f_name = dt.Rows[0].Field<string>("user_first_name");
            string mail = dt.Rows[0].Field<string>("user_mail_address");
            string type = dt.Rows[0].Field<string>("user_type");
            if (tbmail.Text == "") { tbmail.Text = mail; }
            if (tbfname.Text == "") { tbfname.Text = f_name; }
            if (tblname.Text == "") { tblname.Text = l_name; }
            string new_type = "";           
            if (cbminer.Checked == true) { new_type = "miner"; } else { new_type = "sub"; }
            if (mail != tbmail.Text || f_name != tbfname.Text || type != new_type || l_name != tblname.Text)
            {
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                SqlCommand cmd = new SqlCommand("update user_master set user_type='" + new_type + "',user_date_updated='" + timenow + "',user_first_name='" + tbfname.Text + "',user_last_name='" + tblname.Text + "',user_mail_address='" + tbmail.Text + "' where user_id='" + u_id + "'", con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            Response.Redirect("adminUserProfile.aspx?u_id="+u_id);
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            cbminer.Attributes["onclick"] = "return true";
            lblfname.Visible = false;
            lbllname.Visible = false;
            lblmail.Visible = false;
            tbfname.Visible = true;
            tblname.Visible = true;
            tbmail.Visible = true;
            btnsave.Visible = true;
            btncancel.Visible = true;
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            int u_id = Convert.ToInt32(Request.QueryString["u_id"]);
            Response.Redirect("adminUserProfile.aspx?u_id="+u_id);
        }
    }
}