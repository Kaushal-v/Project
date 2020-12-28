using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmain
{
    public partial class minersPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
    }
}