using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmain
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblcuryear.Text = DateTime.Now.Year.ToString();
            string type = "";
            try
            {
                type = Session["type"].ToString();
                if (type == "admin")
                {
                    Response.Redirect("adminDefault.aspx");
                }
                else if (type == "sub" || type == "miner")
                {
                    Response.Redirect("clientDefault.aspx");
                }
            }
            catch(Exception) { }
        }    
    }
}