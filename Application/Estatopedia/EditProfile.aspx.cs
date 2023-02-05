using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Estatopedia.DAL;

namespace Estatopedia
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UpdatePageLoad(object sender, EventArgs e)
        {
            //function call from dal file of update orfile
            myDAL objMyDal = new myDAL();
            String name = "";
            String contact = "";
            int age = 0;
            String Desc = "";
            name = NameBox.Text;
            contact = NumBox.Text;
            age = Convert.ToInt16(AgeBox.Text);
            Desc = DescriptionBox.Text;

            objMyDal.UpdateProfile(name, contact, age, Desc);

            if (objMyDal.GetUserType(myDAL.current_user) == 'S')
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Redirect("Buyer_Home.aspx");
            }
        }
    }
}