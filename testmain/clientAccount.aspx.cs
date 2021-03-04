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
    public partial class clientAccount1 : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            cbminer.Attributes["onclick"] = "return false";
            string u_name = "";
            try
            {
                u_name = Session["u_name"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("signin.aspx");
            }
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            if (!IsPostBack)
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                tbfname.Text = lblfname.Text = dt.Rows[0].Field<string>("user_first_name");
                tblname.Text = lbllname.Text = dt.Rows[0].Field<string>("user_last_name");
                lbluname.Text = dt.Rows[0].Field<string>("user_name");
                tbconno.Text = lblconno.Text = dt.Rows[0].Field<string>("user_contact_no");
                tbmail.Text = lblmail.Text = dt.Rows[0].Field<string>("user_mail_address");
                if ("miner" == dt.Rows[0].Field<string>("user_type"))
                {
                    cbminer.Checked = true;
                }
                con.Close();
            }
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
            btn_save.Visible = false;
            btn_cancel.Visible = false;
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string u_name = "";
            try
            {
                u_name = Session["u_name"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("signin.aspx");
            }
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int id = dt.Rows[0].Field<int>("user_id");
            string l_name = dt.Rows[0].Field<string>("user_last_name");
            string f_name = dt.Rows[0].Field<string>("user_first_name");
            string mail = dt.Rows[0].Field<string>("user_mail_address");
            string type = dt.Rows[0].Field<string>("user_type");
            string new_type = "";
            if (tbmail.Text == "") { tbmail.Text = mail; }
            if (tbfname.Text == "") { tbfname.Text = f_name; }
            if (tblname.Text == "") { tblname.Text = l_name; }
            if (cbminer.Checked == true) { new_type = "miner"; } else { new_type = "sub"; }
            if (mail != tbmail.Text || f_name != tbfname.Text || type != new_type || l_name != tblname.Text)
            {
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                SqlCommand cmd = new SqlCommand("update user_master set user_type='" + new_type + "',user_date_updated='" + timenow + "',user_first_name='" + tbfname.Text + "',user_last_name='" + tblname.Text + "',user_mail_address='" + tbmail.Text + "' where user_id='" + id + "'", con);
                cmd.ExecuteNonQuery();
                Session["type"] = new_type;
            }
            con.Close();
            Response.Redirect("clientAccount.aspx");
        }

        protected void btn_cochange_Click(object sender, EventArgs e)
        {
            btn_save.Visible = true;
            btn_cancel.Visible = true;
            lblconno.Visible = false;
            tbconno.Visible = true;
            tbconno.ReadOnly = false;
            tbconno.TextMode = TextBoxMode.Number;
            tbconno.MaxLength = 10;
            btnsave.Visible = false;
            btncancel.Visible = false;
            tb_pass.Visible=false;
            tb_pass.Text = "";
            lbl_pass.Visible = true;
        }

        protected void btn_passchange_Click(object sender, EventArgs e)
        {
            btn_save.Visible = true;
            btn_cancel.Visible = true;
            lbl_pass.Visible = false;
            tb_pass.Visible = true;
            btnsave.Visible = false;
            btncancel.Visible = false;
            tbconno.Visible = false;
            tb_pass.Text = "";
            lblconno.Visible = true;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (tbconno.Text != "" || tb_pass.Text != "")
            {
                string u_name = "";
                try
                {
                    u_name = Session["u_name"].ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("signin.aspx");
                }
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from user_master where user_name='" + u_name + "' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int id = dt.Rows[0].Field<int>("user_id");
                if (tb_pass.Visible == true)
                {
                    string pass = dt.Rows[0].Field<string>("user_password");
                    if (pass != tb_pass.Text)
                    {                    
                        DateTime now = DateTime.Now;
                        string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        SqlCommand cmd = new SqlCommand("update user_master set user_date_updated='" + timenow + "',user_password='" + tb_pass.Text + "'  where user_id='" + id + "'", con);
                        cmd.ExecuteNonQuery();
                    }
                }
                else if (tbconno.Visible == true)
                {
                    string conno = dt.Rows[0].Field<string>("user_contact_no");
                    if (conno != tbconno.Text)
                    {
                        DateTime now = DateTime.Now;
                        string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        SqlCommand cmd = new SqlCommand("update user_master set user_date_updated='" + timenow + "',user_contact_no='" + tbconno.Text + "'  where user_id='" + id + "'", con);
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("clientAccount.aspx");
            }
        }
    }
}