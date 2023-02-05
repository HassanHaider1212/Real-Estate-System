using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estatopedia.DAL;

namespace Estatopedia
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbutton_Click(object sender, EventArgs e)
        {
            myDAL objMyDal = new myDAL();
            String ID = mailbox.Text;
            String Pass = passwordbox.Text;

            if (objMyDal.CheckLogin(ID, Pass) == 1)
            {
                myDAL.current_user = ID;
               // Response.Redirect("Home.aspx");
                
                    if (objMyDal.GetUserType(ID) == 'S'){
                        Response.Redirect("Home.aspx");
                    }
                    else{
                        Response.Redirect("Buyer_Home.aspx");
                    }
                
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Incorrect Login Details!');", true);
                mailbox.Text = "";
                passwordbox.Text = "";
            }
        }
    }
}