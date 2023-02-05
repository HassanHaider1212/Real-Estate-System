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
    public partial class Home : System.Web.UI.Page
    {
        protected GridView ListingView;
        protected GridView TenantView;
        protected TextBox DeleteID;
        protected void Page_Load(object sender, EventArgs e)
        {

           
            String name = "";
            String CNIC = "";
            String number = "";
            int age = 0;
            char gender = '\0';
            String Desc = "";
            myDAL objMyDal = new myDAL();
            objMyDal.UserInformation(ref name, ref CNIC, ref number, ref age, ref gender, ref Desc);
            NameBox.Text = name;
            CNICBox.Text = CNIC;
            NumBox.Text = number;
            MailBox.Text = myDAL.current_user;
            AgeBox.Text = Convert.ToString(age);
            if (gender == 'M')
            {
                Gender.Text = "Male";
            }
            else
            {
                Gender.Text = "Female";
            }
            DescriptionBox.Text = Desc;

            DataSet ds1 = new DataSet();
            ds1 = objMyDal.SellerListings();

            ListingView.DataSource = ds1;
            ListingView.DataBind();

            DataSet ds2 = new DataSet();
            ds2 = objMyDal.TenantList();

            TenantView.DataSource = ds2;
            TenantView.DataBind();
        }

        protected void UpdatePageLoad(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void DeleteLButton_Click(object sender, EventArgs e)
        {
            int var;
            myDAL obj = new myDAL();
            if (DeleteID.Text == "")
            {
                Page_Load(sender, e);
                return;
            }
                
            var = Convert.ToInt16(DeleteID.Text);
          
            obj.DeleteFromListings(var);
            DeleteID.Text = "";

            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Deleted From Listings');", true);
            Page_Load(sender,e);
        }

        protected void SoldButton_Click(object sender, EventArgs e)
        {
            int var;
            myDAL obj = new myDAL();
            if (SoldID.Text == "")
            {
                Page_Load(sender, e);
                return;
            }

            var = Convert.ToInt16(SoldID.Text);

            obj.MarkAsSold(var);
            SoldID.Text = "";

            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Listing Marked As Sold!');", true);
            Page_Load(sender, e);
        }

        protected void TenantButton_Click(object sender, EventArgs e)
        {
            int var;
            myDAL obj = new myDAL();
            if (ListIDBox.Text == "")
            {
                Page_Load(sender, e);
                return;
            }
            if (TMailBox.Text == "")
            {
                Page_Load(sender, e);
                return;
            }
            string mail = TMailBox.Text;
            var = Convert.ToInt16(ListIDBox.Text);

            ListIDBox.Text = "";
            TMailBox.Text = "";

            obj.AddTenant(var, mail);

            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Tenant Added!');", true);
            Page_Load(sender, e);
        }
        protected void AddListings_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddLisitings.aspx");
        }



        //public void LoadGrid()
        //{

        //    myDAL objMyDal = new myDAL();
        //    string email = emailbox.Text;
        //    ItemGrid.DataSource = objMyDal.SelectItem(email);//seting data source for this Grid
        //    if (objMyDal.SelectItem(email) == null)
        //    {

        //        ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Incorrect Email!');", true);
        //        emailbox.Text = "";
        //    }
        //    ItemGrid.DataBind(); //bind the data source to this grid
        //}
        //public void searchitem(object sender, EventArgs e)
        //{

        //    LoadGrid();

        //}
        //protected void ItemGrid_PreRender(object sender, EventArgs e)
        //{

        //}
        //protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    ItemGrid.PageIndex = e.NewPageIndex;
        //    LoadGrid();
        //}

    }
}