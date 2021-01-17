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
    public partial class adminBlockchain : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)Master.FindControl("btnhome");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnusers");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnshares");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btntransactions");
            btn.CssClass = "nav-link";
            btn = (LinkButton)Master.FindControl("btnblockchain");
            btn.CssClass = "nav-link active";
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            con.ConnectionString = constr;
            blockchain b1 = (blockchain)Application["obj_blockchain"];
            lblpanelcurname.Text = lblname.Text = b1.name;
            lblpanelcurproofofd.Text = lblproofofd.Text = b1.proofOfDifficulty.ToString();
            lblpanelcurminereward.Text = lblminereward.Text = b1.reward.ToString();
            lblblockmined.Text = b1.chain.Count.ToString();
            lbltime.Text = b1.chain[0].timeStamp;
        }

        protected void btnpanelchangenameconfirm_Click(object sender, EventArgs e)
        {
            if (tbpanelchangename.Text != "")
            {
                lblpanelchangenameconfirm.Visible = false;
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                b1.name = tbpanelchangename.Text;
                Response.Redirect("adminBlockchain.aspx");
            }
            else
            {
                lblpanelchangenameconfirm.Visible = true;
                popupchangename.Show();
            }
        }

        protected void btnpanelchangenamecancel_Click(object sender, EventArgs e)
        {
            lblpanelchangenameconfirm.Visible = false;
        }

        protected void btnpanelchangeproofofdcancel_Click(object sender, EventArgs e)
        {
            lblpanelchangeproofofdconfirm.Visible = false;
        }

        protected void btnpanelchangeproofofdconfirm_Click(object sender, EventArgs e)
        {
            if (tbpanelchangeproofofd.Text != "")
            {
                lblpanelchangeproofofdconfirm.Visible = false;
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                b1.proofOfDifficulty = Convert.ToInt32(tbpanelchangeproofofd.Text);
                Response.Redirect("adminBlockchain.aspx");
            }
            else
            {
                lblpanelchangeproofofdconfirm.Visible = true;
                popupchangeproofofd.Show();
            }
        }

        protected void btnpanelchangeminerewardcancel_Click(object sender, EventArgs e)
        {
            lblpanelchangeminerewardconfirm.Visible = false;
        }

        protected void btnpanelchangeminerewardconfrim_Click(object sender, EventArgs e)
        {
            if (tbpanelchangeminereward.Text != "")
            {
                lblpanelchangeminerewardconfirm.Visible = false;
                blockchain b1 = (blockchain)Application["obj_blockchain"];
                b1.reward = Convert.ToDouble(tbpanelchangeminereward.Text);
                Response.Redirect("adminBlockchain.aspx");
            }
            else
            {
                lblpanelchangeminerewardconfirm.Visible = true;
                popupchangeminereward.Show();
            }
        }
    }
}