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
    public partial class Home2 : System.Web.UI.Page
    {
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


            myDAL myObj = new myDAL();
            DataSet ds = new DataSet();
            ds = myObj.FavList();

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void UpdatePageLoad(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
        protected void DeleteLButton_Click(object sender, EventArgs e)
        {
            int var;
            myDAL obj = new myDAL();
            var = Convert.ToInt16(DeleteID.Text);
            obj.DeleteFromFav(var);
            DeleteID.Text = "";

            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Deleted From Favourites');", true);
            Page_Load(sender, e);
        }
        //public void LoadGrid()
        //{

        //    myDAL objMyDal = new myDAL();
        //    string email = emailbox.Text;
        //    ItemGrid.DataSource = objMyDal.SelectItem2(email);//seting data source for this Grid


        //    //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Incorrect Email!');", true);
        //    //emailbox.Text = "";

        //    ItemGrid.DataBind(); //bind the data source to this grid
        //}
        //public void searchitem2(object sender, EventArgs e)
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