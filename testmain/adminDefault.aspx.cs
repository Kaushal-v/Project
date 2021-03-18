using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using DocumentFormat.OpenXml.Spreadsheet;
using javax.swing.text.html;
using iTextSharp.tool.xml.html;
using HTML = iTextSharp.tool.xml.html.HTML;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;

namespace testmain
{
    public partial class adminDefault : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {           
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;            
            try
            {
                if (Session["type"].ToString() != "admin")
                {
                    Response.Redirect("signin.aspx");
                }           
            }
            catch (Exception) {
                Response.Redirect("signin.aspx");            
            }

            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select count(*) as cout from user_master", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                lbltotal_users.Text = dt.Rows[0].Field<int>("cout").ToString();
                da = new SqlDataAdapter("select count(*) as cout from share_master", con);
                dt = new DataTable();
                da.Fill(dt);
                lbltotal_shares.Text = dt.Rows[0].Field<int>("cout").ToString();
                da = new SqlDataAdapter("select sum(share_sold_count) as cout from share_master", con);
                dt = new DataTable();
                da.Fill(dt);
                lblsoldshares.Text = dt.Rows[0].Field<int>("cout").ToString();
                da = new SqlDataAdapter("select sum((share_sold_count-share_received_count) * share_price) as total_sales from share_master", con);
                dt = new DataTable();
                da.Fill(dt);
                double sales = Math.Round(dt.Rows[0].Field<double>("total_sales"),7);
                lbltotalsales.Text = sales.ToString();
                da = new SqlDataAdapter("select share_id,share_name,share_price, (share_sold_count-share_received_count) as cout from share_master group by (share_sold_count-share_received_count),share_id,share_name,share_price order by (share_sold_count-share_received_count) desc",con);
                dt = new DataTable();
                da.Fill(dt);
                DateTime now = DateTime.Now;
                DateTime yday = DateTime.Today.AddDays(-6);
                string yesterday = string.Format("{0:yyyy-MM-dd H:mm:ss}", yday);
                string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                List<Label> lblshare = new List<Label>() { lblshare1, lblshare2, lblshare3, lblshare4, lblshare5, lblshare6, lblshare7, lblshare8,lblshare9 };
                List<Label> lblprice = new List<Label>() { lblshareprice1, lblshareprice2, lblshareprice3, lblshareprice4, lblshareprice5, lblshareprice6, lblshareprice7, lblshareprice8, lblshareprice9 };
                List<Label> lblchange = new List<Label>() { lblchange1, lblchange2, lblchange3, lblchange4, lblchange5, lblchange6, lblchange7, lblchange8, lblchange9 };
                int count = (dt.Rows.Count<=9? dt.Rows.Count : 9);
                if(count == 0)
                {
                    lblnodatafound.Visible = true;
                }
                for(int i = 0; i < count; i++)
                {
                    try
                    {
                        int share_id= dt.Rows[i].Field<int>("share_id");
                        da = new SqlDataAdapter("select user_share_meta.share_id, user_share_meta.share_price,user_share_meta_time from user_share_meta ,share_master where share_master.share_id=user_share_meta.share_id and share_master.share_id='"+share_id+"' and user_share_meta_time between'" + yesterday + "' and '" + timenow + "' group by user_share_meta_time,user_share_meta.share_id, user_share_meta.share_price order by user_share_meta_time desc", con);
                        DataTable dtchange = new DataTable();
                        da.Fill(dtchange);
                        lblshare[i].Text = dt.Rows[i].Field<string>("share_name");
                        lblprice[i].Text = Math.Round(dt.Rows[i].Field<double>("share_price"),3).ToString();
                        double change = (Math.Round(100 - (dtchange.Rows[0].Field<double>("share_price") * 100) / dt.Rows[i].Field<double>("share_price"), 2));                        
                        if (change < 0)
                        {
                            lblchange[i].Text = change.ToString();
                            lblchange[i].CssClass = "label-down";
                        }
                        else if(change > 0)
                        {
                            lblchange[i].Text = "+" + change.ToString();
                            lblchange[i].CssClass = "label-up";
                        }
                    }
                    catch (Exception)
                    {
                        lblchange[i].Text = "0";
                    }
                }
                con.Close();
            }
            catch(Exception) {
                lbltotal_shares.Text = "0";
                lblsoldshares.Text = "0";
            }
            Bindchart();
        }
        private void Bindchart()
        {                       
            List<double> thisweekprice = new List<double>();
            List<double> lastweekprice = new List<double>();
            for (int i = -6; i <= 0; i++) {
                DateTime lday = DateTime.Today.AddDays(i);
                DateTime tday = DateTime.Today.AddDays(i+1);
                string ldays = string.Format("{0:yyyy-MM-dd H:mm:ss}", lday);
                string tdays = string.Format("{0:yyyy-MM-dd H:mm:ss}", tday);
                SqlDataAdapter da = new SqlDataAdapter("select sum(user_share_meta_count * share_price)as price from user_share_meta where user_share_meta_ope='buy' and user_share_meta_time between '" + ldays + "' and '" + tdays + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                try
                {
                    thisweekprice.Add(dt.Rows[0].Field<double>("price"));
                }
                catch (Exception)
                {
                    thisweekprice.Add(0);
                }
            }
            for (int i = -13; i <= -7; i++)
            {
                DateTime lday = DateTime.Today.AddDays(i);
                DateTime tday = DateTime.Today.AddDays(i + 1);
                string ldays = string.Format("{0:yyyy-MM-dd H:mm:ss}", lday);
                string tdays = string.Format("{0:yyyy-MM-dd H:mm:ss}", tday);
                SqlDataAdapter da = new SqlDataAdapter("select sum(user_share_meta_count * share_price)as price from user_share_meta where user_share_meta_ope='buy' and user_share_meta_time between '" + ldays + "' and '" + tdays + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                try
                {
                    lastweekprice.Add(dt.Rows[0].Field<double>("price"));
                }
                catch (Exception)
                {
                    lastweekprice.Add(0);
                }
            }            
            con.Close();
            //var thisweek = JsonConvert.SerializeObject(thisweekprice);
            lit1.Text= JsonConvert.SerializeObject(thisweekprice).ToString();
            lit2.Text = JsonConvert.SerializeObject(lastweekprice).ToString();
        }
    }
}