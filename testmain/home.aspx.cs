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
    }
}