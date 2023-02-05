using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Estatopedia.DAL;

namespace Estatopedia
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void signupbutton_Click(object sender, EventArgs e)
        {
            myDAL objMyDal = new myDAL();
            String Mail = MailBox.Text;

            if (objMyDal.CheckUser(Mail) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('User Already Exists!');", true);
                NameBox.Text = "";
                NumBox.Text = "";
                AgeBox.Text = "";
                DescriptionBox.Text = "";
                CNICBox.Text = "";
                SellerButton.Checked = false;
                BuyerButton.Checked = false;
                MaleButton.Checked = false;
                FemaleButton.Checked = false;
                MailBox.Text = "";
            }
            else
            {
                char UserType, Gender;
                String Name = NameBox.Text;
                String Pass = PassBox.Text;
                String Contact = NumBox.Text;
                int Age = int.Parse(AgeBox.Text);
                String CNIC = CNICBox.Text;
                String Desc = DescriptionBox.Text;
                if (MaleButton.Checked == false)
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Female!');", true);
                    Gender = 'F';
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Male!');", true);
                    Gender = 'M';
                }
                if (SellerButton.Checked == true)
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Seller!');", true);
                    UserType = 'S';
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Buyer!');", true);
                    UserType = 'B';
                }
                objMyDal.SignUp(Name, Mail, Pass, Contact, Age, CNIC, UserType, Gender, Desc);
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('User Added!');", true);
                Response.Redirect("Login.aspx");
            }

        }
    }
}