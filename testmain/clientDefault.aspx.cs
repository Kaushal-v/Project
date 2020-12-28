﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmain
{
    public partial class clientDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["type"].ToString() == "miner")
                {
                    Response.Redirect("minersPage.aspx");
                }
                if (Session["type"].ToString() == "admin")
                {
                    Response.Redirect("adminDefault.aspx");
                }
            }
            catch (Exception ex) { }
        }
    }
}