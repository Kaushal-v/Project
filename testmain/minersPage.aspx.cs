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

            if (b1.pendingTransactions.Count!=0)
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
            }
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
            try
            {
                String path = $"C:\\Users\\kaush\\source\\repos\\testmain\\testmain\\ShareLog.pdf";
                Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, new FileStream(path, FileMode.OpenOrCreate));
                pdfDoc.Open();
                SqlDataAdapter da = new SqlDataAdapter("select blockchain_master.block_hash,block_previous_hash,block_timestamp,transaction_sender_hash,transaction_receiver_hash,transaction_chips from blockchain_master,transaction_master where blockchain_master.block_hash=transaction_master.block_hash order by blockchain_master.block_timestamp desc", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //Image logo = Image.GetInstance(@"C:\Users\kaush\source\repos\testmain\testmain\blockchain.png");
                //logo.Alignment = Element.ALIGN_CENTER;
                //pdfDoc.Add(logo);                
                Chunk glue = new Chunk(new VerticalPositionMark());
                Paragraph p = new Paragraph("Block chain: " + b1.name);
                p.Font.Size = 20;
                p.Add(new Chunk(glue));
                DateTime now = DateTime.Now;
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                p.Add("Time : " + timenow);
                pdfDoc.Add(p);
                pdfDoc.Add(new Paragraph(" "));
                Paragraph p1 = new Paragraph("Blocks : " + b1.chain.Count());
                pdfDoc.Add(p1);
                Paragraph p2 = new Paragraph("Transactions : " + b1.getTotalTransactions());
                pdfDoc.Add(p2);
                pdfDoc.Add(new Paragraph(" "));
                PdfPTable table = new PdfPTable(dt.Columns.Count);
                Font fontH1 = new Font(Font.NORMAL, 12, Font.BOLD);
                Font fontB1 = new Font(Font.NORMAL, 10, Font.NORMAL);
                foreach (DataColumn c in dt.Columns)
                {
                    table.AddCell(new Phrase(c.ColumnName, fontH1));
                }

                foreach (DataRow r in dt.Rows)
                {
                    if (dt.Rows.Count > 0)
                    {
                        table.AddCell(new Phrase(r["block_hash"].ToString(), fontB1));
                        table.AddCell(new Phrase(r["block_previous_hash"].ToString(), fontB1));
                        table.AddCell(new Phrase(r["block_timestamp"].ToString(), fontB1));
                        table.AddCell(new Phrase(r["transaction_sender_hash"].ToString(), fontB1));
                        table.AddCell(new Phrase(r["transaction_receiver_hash"].ToString(), fontB1));
                        table.AddCell(new Phrase(r["transaction_chips"].ToString(), fontB1));
                    }
                }
                table.WidthPercentage = 99;
                table.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfDoc.Add(table);

                pdfDoc.Close();
                pdfWriter.Close();
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
            con.Close();
                Response.Redirect("minersPage.aspx");
        }
    }
}
