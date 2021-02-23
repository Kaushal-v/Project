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
using System.Drawing;

namespace testmain
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        readonly SqlConnection con = new SqlConnection();
        string share_id;
        protected void bind_data_default()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from share_master"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlpanelshare.DataSource = cmd.ExecuteReader();
                    ddlpanelshare.DataTextField = "share_name";
                    ddlpanelshare.DataValueField = "share_id";
                    ddlpanelshare.DataBind();
                    con.Close();
                }
            }
            ddlpanelshare.Items.Insert(0, new ListItem("Select", "Select"));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                bind_data_default();
            }
            try
            {
                btnchips.Text = "Chips ";
                string u_name = Session["u_name"].ToString();
                try
                {

                    if (Session["type"].ToString() == "sub")
                    {
                        btnmine.Visible = false;
                    }                    
                }
                catch(Exception) 
                {
                    Response.Redirect("signin.aspx");
                }
                string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                con.ConnectionString = constr;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select user_first_name from user_master where user_name='"+u_name+"' ",con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                btnfirstname.Text = dt.Rows[0].Field<string>("user_first_name").ToUpperInvariant();                
                double bal = 0;                
                blockchain b1 = (blockchain)Application["obj_blockchain"];                                        
                bal = b1.getBalance(b1.getAddress(u_name));                                                   
                btnchips.Text += bal.ToString();
                lblpanelchips.Text = btnchips.Text;
                con.Close();
            }
            catch (Exception) {  }
            lblcuryear.Text = DateTime.Now.Year.ToString();
        }
        protected void btnlogoutc_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");   
        }

        protected void btnpanelconfirm_Click(object sender, EventArgs e)
        {
            if (btnpanelconfirm.Text.Equals("Buy"))
            {
                if (ddlpanelshare.SelectedItem.Value != "Select" && tbpanelcount.Text != "")
                {
                    share_id = ddlpanelshare.SelectedItem.Value;
                    string u_name = "";
                    int u_id = 0;
                    lblconfirm.Visible = false;
                    try
                    {
                        u_name = Session["u_name"].ToString();
                        u_id = Convert.ToInt32(Session["u_id"]);
                    }
                    catch (Exception)
                    {
                        Response.Redirect("signin.aspx");
                    }
                    string companyName = "ShareLog";
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    string companyHash = b1.getAddress(companyName);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select share_price from share_master where share_id='" + share_id + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    string halfChips = lblpanelchips.Text.Substring(5);
                    halfChips.Trim();
                    double chips = Convert.ToDouble(halfChips);
                    int count = Convert.ToInt32(tbpanelcount.Text);
                    double total_price = count * dt.Rows[0].Field<double>("share_price");
                    DateTime now;
                    string timenow;
                    SqlCommand cmd;
                    foreach (Transaction t in b1.pendingTransactions)
                    {
                        if (t.from.Equals(b1.getAddress(u_name)))
                        {
                            chips -= t.amount;
                        }
                    }
                    if (chips > total_price)
                    {
                        lblnotamount.Visible = false;
                        string u_nameHash = b1.getAddress(u_name);
                        b1.CreateTransaction(new Transaction(u_nameHash, companyHash, total_price));
                        da = new SqlDataAdapter("Select * from share_holder_master where share_id='" + share_id + "' and user_id='" + u_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count == 0)
                        {
                            now = DateTime.Now;
                            timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                            cmd = new SqlCommand("insert into share_holder_master(user_id,share_id,holder_share_count,share_holder_last_updated_time) values('" + u_id + "','" + share_id + "','" + count + "','" + timenow + "')", con);
                            cmd.ExecuteNonQuery();                           
                            da = new SqlDataAdapter("Select share_price,share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                            dt = new DataTable();
                            da.Fill(dt);
                            int avail_count = dt.Rows[0].Field<int>("share_available_count") - count;
                            int sold_count = dt.Rows[0].Field<int>("share_sold_count") + count;
                            double last_price = dt.Rows[0].Field<double>("share_price");
                            cmd = new SqlCommand("insert into user_share_meta(user_id,share_id,user_share_meta_count,user_share_meta_ope,user_share_meta_time,share_price) values('" + u_id + "','" + share_id + "','" + count + "','buy','" + timenow + "','"+ last_price +"')", con);
                            cmd.ExecuteNonQuery();
                            cmd = new SqlCommand("update share_master set share_available_count = '" + avail_count + "',share_sold_count = '" + sold_count + "' where share_id='" + share_id + "'", con);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            now = DateTime.Now;
                            da = new SqlDataAdapter("Select holder_share_count from share_holder_master where share_id='" + share_id + "' and user_id='" + u_id + "'", con);
                            dt = new DataTable();
                            da.Fill(dt);
                            int avail_count = dt.Rows[0].Field<int>("holder_share_count") + count;
                            timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                            cmd = new SqlCommand("update share_holder_master set holder_share_count='" + avail_count + "' ,share_holder_last_updated_time='" + timenow + "' where user_id='"+u_id+"' and share_id='"+share_id+"'", con);
                            cmd.ExecuteNonQuery();
                            da = new SqlDataAdapter("Select share_price,share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                            dt = new DataTable();
                            da.Fill(dt);
                            int total_avail_count = dt.Rows[0].Field<int>("share_available_count") - count;
                            int sold_count = dt.Rows[0].Field<int>("share_sold_count") + count;
                            double last_price = dt.Rows[0].Field<double>("share_price");
                            cmd = new SqlCommand("update share_master set share_available_count = '" + total_avail_count + "',share_sold_count = '" + sold_count + "' where share_id='" + share_id + "'", con);
                            cmd.ExecuteNonQuery();
                            cmd = new SqlCommand("insert into user_share_meta(user_id,share_id,user_share_meta_count,user_share_meta_ope,user_share_meta_time,share_price) values('" + u_id + "','" + share_id + "','" + count + "','buy','" + timenow + "','"+ last_price +"')", con);
                            cmd.ExecuteNonQuery();
                        }
                        da = new SqlDataAdapter("select * from share_master where share_id='" + share_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        double original_share_price = dt.Rows[0].Field<double>("share_price");
                        double share_price=(original_share_price * count * 0.02)+original_share_price;
                        cmd = new SqlCommand("update share_master set share_price='" + share_price + "' where share_id='" + share_id + "'", con);
                        cmd.ExecuteNonQuery();
                        now = DateTime.Now;
                        timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        cmd = new SqlCommand("insert into share_price_master(share_id,share_price_changing,share_date) values('" + share_id + "','" + share_price + "','"+timenow+"')", con);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("clientDefault.aspx");
                    }
                    else
                    {
                        lblconfirm.Visible = false;
                        lblnotamount.Visible = true;
                    }
                    con.Close();
                }
                else
                {
                    lblnotamount.Visible = false;
                    lblconfirm.Visible = true;
                }
            }
            else if (btnpanelconfirm.Text.Equals("Sell"))
            {
                if (ddlpanelshare.SelectedItem.Value != "Select" && tbpanelcount.Text != "")
                {
                    share_id = ddlpanelshare.SelectedItem.Value;
                    string u_name = "";
                    int u_id = 0;
                    lblconfirm.Visible = false;
                    try
                    {
                        u_name = Session["u_name"].ToString();
                        u_id = Convert.ToInt32(Session["u_id"]);
                    }
                    catch (Exception)
                    {
                        Response.Redirect("signin.aspx");
                    }
                    string companyName = "ShareLog";
                    blockchain b1 = (blockchain)Application["obj_blockchain"];
                    string companyHash = b1.getAddress(companyName);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select share_price from share_master where share_id='" + share_id + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    double share_price = dt.Rows[0].Field<double>("share_price");
                    string halfShare = lblpanelsharec.Text.Substring(18);
                    halfShare.Trim();
                    double share_count = Convert.ToDouble(halfShare);
                    int count = Convert.ToInt32(tbpanelcount.Text);
                    if (count <= share_count)
                    {
                        double total_price = count * share_price;
                        lblnotamount.Visible = false;
                        string u_nameHash = b1.getAddress(u_name);
                        b1.CreateTransaction(new Transaction(companyHash, u_nameHash, total_price));
                        DateTime now = DateTime.Now;
                        da = new SqlDataAdapter("Select holder_share_count from share_holder_master where share_id='" + share_id + "' and user_id='" + u_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        int avail_count = dt.Rows[0].Field<int>("holder_share_count") - count;
                        string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        SqlCommand cmd;
                        if (avail_count == 0)
                        {
                            cmd = new SqlCommand("delete share_holder_master where user_id='" + u_id + "' and share_id='" + share_id + "'", con);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            cmd = new SqlCommand("update share_holder_master set holder_share_count='" + avail_count + "' ,share_holder_last_updated_time='" + timenow + "' where user_id='" + u_id + "' and share_id='" + share_id + "'", con);
                            cmd.ExecuteNonQuery();
                        }
                        da = new SqlDataAdapter("Select share_price,share_available_count,share_sold_count from share_master where share_id='" + share_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        int total_avail_count = dt.Rows[0].Field<int>("share_available_count") + count;
                        int sold_count = dt.Rows[0].Field<int>("share_sold_count") - count;
                        double last_price = dt.Rows[0].Field<double>("share_price");
                        cmd = new SqlCommand("update share_master set share_available_count = '" + total_avail_count + "',share_sold_count = '" + sold_count + "' where share_id='" + share_id + "'", con);
                        cmd.ExecuteNonQuery();
                        da = new SqlDataAdapter("select * from share_master where share_id='" + share_id + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);
                        double original_share_price = dt.Rows[0].Field<double>("share_price");
                        double share_price_now = original_share_price - (original_share_price * count * 0.03);
                        cmd = new SqlCommand("update share_master set share_price='" + share_price_now + "' where share_id='" + share_id + "'", con);
                        cmd.ExecuteNonQuery();
                        now = DateTime.Now;
                        timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                        cmd = new SqlCommand("insert into share_price_master(share_id,share_price_changing,share_date) values('" + share_id + "','" + share_price + "','" + timenow + "')", con);
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("insert into user_share_meta(user_id,share_id,user_share_meta_count,user_share_meta_ope,user_share_meta_time,share_price) values('" + u_id + "','" + share_id + "','" + count + "','sell','" + timenow + "','"+ last_price +"')", con);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("clientDefault.aspx");
                    }
                    else
                    {
                        lblconfirm.Visible = false;
                        lblnotamount.Visible = true;
                    }
                    con.Close();
                }
                else
                {
                    lblnotamount.Visible = false;
                    lblconfirm.Visible = true;
                }
            }
            popupbuysell.Show();
        }

        protected void ddlpanelshare_SelectedIndexChanged(object sender, EventArgs e)
        {
            int u_id = Convert.ToInt32(Session["u_id"].ToString());
            share_id = ddlpanelshare.SelectedItem.Value;
            ddlpanelshare.ClearSelection();
            ddlpanelshare.Items.FindByValue(share_id).Selected = true;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            SqlDataAdapter da;
            DataTable dt;
            if (share_id != "Select")
            {
                if (btnpanelconfirm.Text.Equals("Sell"))
                {
                    lblpanelsharec.Text = "Available Shares: ";
                    con.Open();
                    da = new SqlDataAdapter("Select holder_share_count from share_holder_master where share_id='" + share_id + "' and user_id='" + u_id + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);
                    lblpanelsharec.Text += dt.Rows[0].Field<int>("holder_share_count").ToString();
                    lblpanelsharec.Visible = true;
                    con.Close();
                }                
                lblprice.Text = "Share Price: ";
                con.Open();
                da = new SqlDataAdapter("Select share_price from share_master where share_id='" + share_id + "'", con);
                dt = new DataTable();
                da.Fill(dt);
                lblprice.Text += dt.Rows[0].Field<Double>("share_price").ToString();
                lblprice.Visible = true;
                con.Close();
            }
            else
            {
                lblpanelsharec.Text = "Available Shares: ";
                lblprice.Text = "Share Price: ";
                lblprice.Visible = false;
                lblpanelsharec.Visible = false;
            }
            popupbuysell.Show();
        }

        protected void btnpanelbuy_Click(object sender, EventArgs e)
        {
            lblnotamount.Visible = false;
            lblconfirm.Visible = false;
            tbpanelcount.Text = "";
            lblprice.Visible = false;
            lblpanelsharec.Visible = false;
            bind_data_default();
            lblpanelsharec.Text = "avalable Shares ";
            lblpanelsharec.Visible = false;
            btnpanelconfirm.Text = "Buy";
            popupbuysell.Show();
        }

        protected void btnpanelsell_Click(object sender, EventArgs e)
        {
            lblnotamount.Visible = false;
            lblconfirm.Visible = false;
            tbpanelcount.Text = "";
            lblprice.Visible = false;           
            int u_id = Convert.ToInt32(Session["u_id"].ToString());
            share_id = ddlpanelshare.SelectedItem.Value;
            btnpanelconfirm.Text = "Sell";
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from share_master,share_holder_master where share_master.share_id=share_holder_master.share_id and share_holder_master.user_id='"+u_id+"'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlpanelshare.DataSource = cmd.ExecuteReader();
                    ddlpanelshare.DataTextField = "share_name";
                    ddlpanelshare.DataValueField = "share_id";
                    ddlpanelshare.DataBind();
                    con.Close();
                }
            }
            ddlpanelshare.Items.Insert(0, new ListItem("Select", "Select"));           
            popupbuysell.Show();
        }

        protected void btnpanel2cancel_Click(object sender, EventArgs e)
        {
            ddlpanelshare.ClearSelection();
            tbpanelcount.Text = "";            
            lblprice.Visible = false;
            lblpanelsharec.Visible = false;
            lblnotamount.Visible = false;
            lblconfirm.Visible = false;
        }        
    }
}