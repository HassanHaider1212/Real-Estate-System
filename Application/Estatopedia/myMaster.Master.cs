using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estatopedia.DAL;

namespace Estatopedia
{
    public partial class myMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            username.Text = myDAL.current_user;
        }

        protected void LoadHome(object sender, EventArgs e)
        {
            myDAL obj = new myDAL();

            char var = '\0';
            var = obj.GetUserType(myDAL.current_user);
            if (var == 'S')
            {
                Response.Redirect("Home.aspx");
            }
            else if (var == 'B')
            {
                Response.Redirect("Buyer_Home.aspx");
            }
        }
    }
}