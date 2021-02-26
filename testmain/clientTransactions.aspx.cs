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
    public partial class clientTransactions : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvtransactiondetails.DataSource = dt;            
            gvtransactiondetails.DataBind();
            con.Close();
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
    }
}