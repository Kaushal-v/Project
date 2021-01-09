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
            catch (Exception ex) { }
            string u_name = Session["u_name"].ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            con.Open();
            SqlDataAdapter da;
            da = new SqlDataAdapter("select user_id from user_master where user_name='"+u_name+"'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int user_id = dt.Rows[0].Field<int>("user_id");
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
            catch(Exception ex)
            {
                da = new SqlDataAdapter("select * from share_master", con);
            }
            da.Fill(dt);
            gvshare_info.DataSource = dt;
            gvshare_info.DataBind();
            con.Close();
        }
    }
}