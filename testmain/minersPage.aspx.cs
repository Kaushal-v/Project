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
    public partial class minersPage : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["type"].ToString() == "admin")
                {
                    Response.Redirect("adminDefault.aspx");
                }
                if (Session["type"].ToString() == "sub")
                {
                    Response.Redirect("clientDefault.aspx");
                }
            }
            catch(Exception)
            {
                Response.Redirect("signin.aspx");
            }
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            if (b1.pendingTransactions != null)
            {

                gvpendingtransactions.DataSource = b1.pendingTransactions;
                gvpendingtransactions.DataBind();
            }
        }

        protected void gvpendingtransactions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvpendingtransactions.PageIndex = e.NewPageIndex;
            gvpendingtransactions.DataBind();
        }

        protected void btnmine_Click(object sender, EventArgs e)
        {
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            if (b1.pendingTransactions.Count >0 )
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
                b1.mineBlock(b1.getAddress(u_name));
                string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                con.ConnectionString = constr;
                string hash = b1.chain.Last().hash;
                string pre_hash = b1.chain.Last().previousHash;
                string timestamp = b1.chain.Last().timeStamp;
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into blockchain_master(block_hash,block_previous_hash,block_timestamp) values('" + hash + "','" + pre_hash + "','" + timestamp + "')", con);
                cmd.ExecuteNonQuery();
                block block = b1.chain.Last();
                foreach (Transaction t in block.transactions)
                {
                    string sender_hash = t.from;
                    string receiver_hash = t.to;
                    double amount = t.amount;
                    cmd = new SqlCommand("insert into transaction_master(block_hash,transaction_sender_hash,transaction_receiver_hash,transaction_chips) values('" + hash + "','" + sender_hash + "','" + receiver_hash + "','" + amount + "')", con);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                Response.Redirect("minersPage.aspx");
            }
        }
    }
}