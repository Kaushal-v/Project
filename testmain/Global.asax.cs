using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace testmain
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            List<string> ip_list= new List<string> { };
            Application["ip_list"] = ip_list;
            blockchain b1 = new blockchain(2, 5,"ShareLog");
            string dhaval = b1.getAddress("smit_09");
            b1.CreateTransaction(new Transaction("user1Address", dhaval, 5));
            b1.mineBlock(dhaval);
            Application["obj_blockchain"] = b1;
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}