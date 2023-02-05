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
    public partial class AddLisitings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddListingsButton_Click(object sender, EventArgs e)
        {
            String name = "";
            name = TextBox1.Text;

            String city = "";
            city = TextBox2.Text;

            String location = "";
            location = TextBox3.Text;

            float size = 0.0f;
            size = (float) Convert.ToDouble(TextBox5.Text);

            int beds = 0;
            int baths = 0;
            int storeys = 0;
            beds = Convert.ToInt32(TextBox8.Text);
            baths = Convert.ToInt32(TextBox9.Text);
            storeys = Convert.ToInt32(TextBox7.Text);

            float price = 0.0f;
            price = (float)Convert.ToDouble(TextBox10.Text);

            char purpose = '\0';
            if(RentButton.Checked == true)
            {
                purpose = 'R';
            }
            else if (SaleButton.Checked == true)
            {
                purpose = 'R';
            }

            char type = '\0';
            if(CommButton.Checked == true)
            {
                type = 'C';
            }
            else if(ResButton.Checked == true)
            {
                type = 'R';
            }

            String desc = "";
            desc = DescriptionBox.Text;

            myDAL obj = new myDAL();
            obj.AddListings(name, desc, city, location, purpose, type, price, size, beds, baths, storeys);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Listing Added!');", true);
            Response.Redirect("Home.aspx");
        }
    }
}