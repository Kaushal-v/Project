﻿using System;
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
    public partial class clientTransactions : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            if (!IsPostBack)
            {
                con.Open();
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                SqlDataAdapter da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
                DataTable dt = new DataTable(), dtverified = new DataTable();
                da.Fill(dtverified);
                dt.Columns.Add("block_hash");
                dt.Columns.Add("transaction_sender_hash");
                dt.Columns.Add("transaction_receiver_hash");
                dt.Columns.Add("block_previous_hash");
                dt.Columns.Add("block_timestamp");
                dt.Columns.Add("transaction_chips");
                foreach (Transaction t1 in b1.pendingTransactions)
                {
                    DataRow row = dt.NewRow();
                    row["block_hash"] = "-";
                    row["transaction_sender_hash"] = t1.from;
                    row["transaction_receiver_hash"] = t1.to;
                    row["block_previous_hash"] = "-";
                    row["block_timestamp"] = "-";
                    row["transaction_chips"] = t1.amount;
                    dt.Rows.Add(row);
                }
                foreach (DataRow row in dtverified.Rows)
                {
                    dt.ImportRow(row);
                }
                gvtransactiondetails.DataSource = dt;
                gvtransactiondetails.DataBind();
                con.Close();
            }
        }       
        protected void gvtransactiondetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvtransactiondetails.PageIndex = e.NewPageIndex;
            DataBind();
        }

        protected void btndownload_pdf_Click(object sender, EventArgs e)
        {
            try
            {
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                String path = $"C:\\Users\\kaush\\source\\repos\\testmain\\testmain\\ShareLog.pdf";
                Response.ContentType = "Application/pdf";
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                Response.AddHeader("Content-Disposition", "attachment;filename=" + b1.name + timenow + ".pdf");
                Response.WriteFile(path);
                //Response.Redirect("http://docs.google.com/viewer?url=" + path);
                Response.TransmitFile(Server.MapPath(path));
                Response.End();
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
        }

        protected void orders_all_tab_Click(object sender, EventArgs e)
        {
            orders_verified_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            orders_pending_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            orders_all_tab.CssClass = "flex-sm-fill text-sm-center nav-link active";
            con.Open();
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            SqlDataAdapter da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
            DataTable dt = new DataTable(), dtverified = new DataTable();
            da.Fill(dtverified);
            dt.Columns.Add("block_hash");
            dt.Columns.Add("transaction_sender_hash");
            dt.Columns.Add("transaction_receiver_hash");
            dt.Columns.Add("block_previous_hash");
            dt.Columns.Add("block_timestamp");
            dt.Columns.Add("transaction_chips");
            foreach (Transaction t1 in b1.pendingTransactions)
            {
                DataRow row = dt.NewRow();
                row["block_hash"] = "-";
                row["transaction_sender_hash"] = t1.from;
                row["transaction_receiver_hash"] = t1.to;
                row["block_previous_hash"] = "-";
                row["block_timestamp"] = "-";
                row["transaction_chips"] = t1.amount;
                dt.Rows.Add(row);
            }
            foreach (DataRow row in dtverified.Rows)
            {
                dt.ImportRow(row);
            }
            gvtransactiondetails.DataSource = dt;
            gvtransactiondetails.DataBind();
            con.Close();
        }

        protected void orders_verified_tab_Click(object sender, EventArgs e)
        {
            orders_verified_tab.CssClass = "flex-sm-fill text-sm-center nav-link active";
            orders_pending_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            orders_all_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvtransactiondetails.DataSource = dt;
            gvtransactiondetails.DataBind();
            con.Close();
        }

        protected void orders_pending_tab_Click(object sender, EventArgs e)
        {
            orders_verified_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            orders_pending_tab.CssClass = "flex-sm-fill text-sm-center nav-link active";
            orders_all_tab.CssClass = "flex-sm-fill text-sm-center nav-link";
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            gvtransactiondetails.DataSource = b1.pendingTransactions;
            gvtransactiondetails.DataBind();
        }       
    }
}