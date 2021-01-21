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
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            List<Transaction> pendingtra = new List<Transaction>();
            string userHash = b1.getAddress(u_name);
            foreach (Transaction tra in b1.pendingTransactions)
            {
                if (tra.from == userHash || tra.to == userHash)
                {
                    pendingtra.Add(tra);
                }
            }
            gvminerpendingtransactions.DataSource = pendingtra;
            gvminerpendingtransactions.DataBind();
        }
    }
}