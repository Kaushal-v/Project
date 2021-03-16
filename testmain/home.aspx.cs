using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Configuration;


namespace testmain
{
    public partial class home : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;         
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from share_master", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            share_info.DataSource = dt;
            share_info.DataBind();
            con.Close();
            string ipAdd = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ipAdd))
            {
                ipAdd = Request.ServerVariables["REMOTE_ADDR"];
            }
            List<string> ip_list =(List<string>)Application["ip_list"];
            if(ip_list.Find(x=> x.ToString() == ipAdd)==null)
            {
                ip_list.Add(ipAdd);
            }                        
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void share_info_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView v = (DataRowView)e.Row.DataItem;

                if (e.Row.Cells.Count > 0 && e.Row.Cells[0] != null && e.Row.Cells[2].Controls.Count > 0)
                {
                    Label lbl_change = e.Row.Cells[3].Controls[1] as Label;
                    Label lbl_id = e.Row.Cells[0].Controls[1] as Label;
                    Label lbl_price = e.Row.Cells[2].Controls[1] as Label;
                    if (lbl_id != null)
                    {
                        try
                        {
                            DateTime now = DateTime.Now;
                            DateTime yday = DateTime.Today.AddDays(-6);
                            string yesterday = string.Format("{0:yyyy-MM-dd H:mm:ss}", yday);
                            string timenow = string.Format("{0:yyyy-MM-dd H:mm:ss}", now);
                            int share_id = Convert.ToInt32(lbl_id.Text);
                            SqlDataAdapter da = new SqlDataAdapter("select user_share_meta.share_id, user_share_meta.share_price,user_share_meta_time from user_share_meta ,share_master where share_master.share_id=user_share_meta.share_id and share_master.share_id='" + share_id + "' and user_share_meta_time between'" + yesterday + "' and '" + timenow + "' group by user_share_meta_time,user_share_meta.share_id, user_share_meta.share_price order by user_share_meta_time desc", con);
                            DataTable dt = new DataTable();
                            da.Fill(dt);                            
                            double change = (Math.Round(100 - (dt.Rows[0].Field<double>("share_price") * 100) / Convert.ToDouble(lbl_price.Text),2));
                            if (change < 0)
                            {
                                lbl_change.Text = change.ToString();
                                lbl_change.CssClass = "label-down";
                            }
                            else if (change > 0)
                            {
                                lbl_change.Text = "+" + change.ToString();
                                lbl_change.CssClass = "label-up";
                            }
                        }
                        catch (Exception)
                        {
                            lbl_change.Text = "0";
                        }
                    }

                }
            }
        }
    }
}