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
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;

namespace testmain
{
    public partial class transacrions : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)Master.FindControl("btnhome");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnusers");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnshares");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btntransactions");
            btn.CssClass = "nav-link active";
            btn = (LinkButton)Master.FindControl("btnblockchain");
            btn.CssClass = "nav-link";
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvtransactiondetails.DataSource = dt;
            gvtransactiondetails.DataBind();
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            if (b1.pendingTransactions != null)
            {

                gvpendingtransactions.DataSource = b1.pendingTransactions;
                gvpendingtransactions.DataBind();
            }
            con.Close();
        }

        protected void gvtransactiondetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvtransactiondetails.PageIndex = e.NewPageIndex;
            gvtransactiondetails.DataBind();
        }

        protected void gvpendingtransactions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvpendingtransactions.PageIndex = e.NewPageIndex;
            gvpendingtransactions.DataBind();
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
                Response.TransmitFile(Server.MapPath(path));
                Response.End();
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
        }
    }
}