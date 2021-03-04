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
    public partial class clientDefault : System.Web.UI.Page
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
            }
            catch (Exception) 
            {
                Response.Redirect("signin.aspx");
            }
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
            con.Open();
            SqlDataAdapter da;
            DataTable dt = new DataTable();
            int user_id = Convert.ToInt32(Session["u_id"]);
            try
            {
                //da = new SqlDataAdapter("select * from share_master, share_holder_master where share_master.share_id=share_holder_master.share_id and share_holder_master.user_id='" + user_id + "'", con);
                //if (dt.Rows[0].Field<string>("share_name") != "")
                //{
                //    if (gvshare_info.Columns[3].Visible != false)
                //    {
                //        gvshare_info.Columns[3].Visible = false;
                //        BoundField bfield = new BoundField();
                //        bfield.HeaderText = "Purchesed Count";
                //        bfield.DataField = "holder_share_count";
                //        gvshare_info.Columns.Add(bfield);
                //    }
                //}
                //else
                //{
                    da = new SqlDataAdapter("select * from share_master", con);
                //}
            }
            catch(Exception)
            {
                da = new SqlDataAdapter("select * from share_master", con);
            }
            da.Fill(dt);
            gvshare_info.DataSource = dt;
            gvshare_info.DataBind();
            con.Close();
            con.Open();
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            string user_hash = b1.getAddress(u_name);
            da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
            dt = new DataTable();
            DataTable dtverified = new DataTable();
            da.Fill(dtverified);
            dt.Columns.Add("block_hash");
            dt.Columns.Add("transaction_sender_hash");
            dt.Columns.Add("transaction_receiver_hash");
            dt.Columns.Add("block_previous_hash");
            dt.Columns.Add("block_timestamp");
            dt.Columns.Add("status");
            dtverified.Columns.Add("status");
            dt.Columns.Add("transaction_chips");
            foreach (Transaction t1 in b1.pendingTransactions)
            {
                if (t1.from == user_hash || t1.to == user_hash)
                {
                    DataRow row = dt.NewRow();
                    row["block_hash"] = "-";
                    row["transaction_sender_hash"] = t1.from;
                    row["transaction_receiver_hash"] = t1.to;
                    row["block_previous_hash"] = "-";
                    row["block_timestamp"] = "-";
                    row["status"] = "Pending";
                    row["transaction_chips"] = t1.amount;
                    dt.Rows.Add(row);
                }
            }
            foreach (DataRow row in dtverified.Rows)
            {
                if (row["transaction_sender_hash"].ToString() == user_hash || row["transaction_receiver_hash"].ToString() == user_hash)
                {
                    row["status"] = "Verified";
                    dt.ImportRow(row);
                }
            }
            gvtransactiondetails.DataSource = dt;
            gvtransactiondetails.DataBind();
            con.Close();
        }

        protected void gvtransactiondetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView v = (DataRowView)e.Row.DataItem;

                if (e.Row.Cells.Count > 0 && e.Row.Cells[0] != null && e.Row.Cells[0].Controls.Count > 0)
                {
                    Label lbl = e.Row.Cells[5].Controls[1] as Label;
                    if (lbl != null)
                    {
                        if (lbl.Text == "Verified") { lbl.CssClass = "badge bg-success"; }
                        else if (lbl.Text == "Pending") { lbl.CssClass = "badge bg-warning"; }
                    }
                }
            }
        }

        protected void gvtransactiondetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvtransactiondetails.PageIndex = e.NewPageIndex;
            DataBind();
        }
    }
}