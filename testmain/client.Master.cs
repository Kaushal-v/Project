using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmain
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "sub")
            {
                btnmine.Visible = false;
            }
            btnusername.Text += Session["u_name"].ToString();
        }
        protected void butclogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("signin.aspx");   
        }
    }
}