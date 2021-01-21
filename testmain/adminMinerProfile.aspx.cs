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
    public partial class adminMinerProfile : System.Web.UI.Page
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
                    string u_name = "";
                    con.Open();
                    da = new SqlDataAdapter("select * from user_master where user_id='" + u_id + "' ", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    u_name = dt.Rows[0].Field<string>("user_name");
                    if (!IsPostBack)
                    {
                        con.Open();
                        da = new SqlDataAdapter("select * from user_master where user_id='" + u_id + "' ", con);
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
                        else if ("sub" == dt.Rows[0].Field<string>("user_type"))
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
                    lblmain.Text = dt.Rows[0].Field<string>("user_name");
                    da = new SqlDataAdapter("select * from share_master, share_holder_master where share_master.share_id=share_holder_master.share_id and share_holder_master.user_id='" + u_id + "'", con);
                    da.Fill(dt);
                    DataRow row = dt.Rows[0];
                    if (string.IsNullOrEmpty(dt.Rows[0].Field<string>("share_name")))
                    {
                        dt.Rows.Remove(row);
                    }
                    if (dt.Rows.Count == 0)
                    {
                        da = new SqlDataAdapter("select * from share_master", con);
                        da.Fill(dt);
                    }
                    gvhoder_share_info.DataSource = dt;
                    gvhoder_share_info.DataBind();
                    con.Close();                    
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    List<Transaction> pendingtra = new List<Transaction>();
                    string userHash = b1.getAddress(u_name);
                    foreach(Transaction tra in b1.pendingTransactions)
                    {
                        if(tra.from==userHash || tra.to == userHash)
                        {
                            pendingtra.Add(tra);
                        }
                    }
                    gvminerpendingtransactions.DataSource = pendingtra;
                    gvminerpendingtransactions.DataBind();
                    List<Transaction> userminedblocks = new List<Transaction>();
                    foreach(block b in b1.chain){
                        foreach (Transaction tra in b.transactions)
                        {
                            if (tra.from == null || tra.to == userHash)
                            {
                                userminedblocks.Add(new Transaction (b.hash,b.previousHash,tra.amount));
                                break;
                            }
                        }
                    }
                    gvblocksmined.DataSource = userminedblocks;
                    gvblocksmined.DataBind();
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
            Response.Redirect("adminMinerProfile.aspx?u_id=" + u_id);
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
            Response.Redirect("adminMinerProfile.aspx?u_id=" + u_id);
        }
    }
}   