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
    public partial class _Properties : System.Web.UI.Page
    {
        protected TextBox FavId;
        protected void Page_Load(object sender, EventArgs e)
        {
            myDAL myObj = new myDAL();
            DataSet ds = new DataSet();
            ds = myObj.AllListings();

            ItemGrid.DataSource = ds;
            ItemGrid.DataBind();
        }
        public void LoadGrid1()
        {
            myDAL objMyDal = new myDAL();

            float Price_min = string.IsNullOrEmpty(Pricebox_min.Text) ? 0 : float.Parse(Pricebox_min.Text);

            float Price_max = string.IsNullOrEmpty(Pricebox_max.Text) ? 0 : float.Parse(Pricebox_max.Text);

            float Area_min = string.IsNullOrEmpty(Areabox_min.Text) ? 0 : float.Parse(Areabox_min.Text);

            float Area_max = string.IsNullOrEmpty(Areabox_max.Text) ? 0 : float.Parse(Areabox_max.Text);

            int bedrooms = string.IsNullOrEmpty(_bedrooms.Text) ? 0 : int.Parse(_bedrooms.Text);

            int bathrooms = string.IsNullOrEmpty(_bathrooms.Text) ? 0 : int.Parse(_bathrooms.Text);
            int storeys = string.IsNullOrEmpty(_storeys.Text) ? 0 : int.Parse(_storeys.Text);


            //float Price_min = float.Parse(Pricebox_min.Text);

            // double Price_min = Convert.ToDouble(Pricebox_min.Text);
            //double Price_max = Convert.ToDouble(Pricebox_max.Text);           
            //double Area_min = Convert.ToDouble(Areabox_min.Text);            
            //double Area_max = Convert.ToDouble(Areabox_max.Text);

            //int bedrooms = Convert.ToInt16(_bedrooms.Text);
            //int bathrooms = Convert.ToInt16(_bathrooms.Text);
            //int storeys = Convert.ToInt16(_storeys.Text);

            DataSet ds = new DataSet();
            ds = objMyDal.ApplyFilter(Price_min, Price_max, Area_min, Area_max, bedrooms, bathrooms, storeys);//seting data source for this Grid

          
            ItemGrid.DataSource = ds;
            ItemGrid.DataBind();//bind the data source to this grid            
        }

        public void LoadGrid2()
        {
            myDAL objMyDal = new myDAL();

            DataSet ds = new DataSet();
            ds = objMyDal.ResetFilter();//seting data source for this Grid


            ItemGrid.DataSource = ds;
            ItemGrid.DataBind();//bind the data source to this grid     
        }

        public void Search_Button_Click(object sender, EventArgs e)
        {
            LoadGrid1();
        }

        public void Reset_Button_Click(object sender, EventArgs e)
        {
            LoadGrid2();
            SearchBar.Text = "";
            Pricebox_min.Text = "";
            Pricebox_max.Text = "";
            Areabox_min.Text = "";
            Areabox_max.Text = "";
            _bedrooms.Text = "";
            _bathrooms.Text = "";
            _storeys.Text = "";
        }

        protected void SortButton_Click(object sender, EventArgs e)
        {
            string var = "";
            DataSet ds = new DataSet();
            myDAL obj = new myDAL();
            var = sortingList.Text;
            if (var == "1")// High to Low
            {
                ds = obj.PriceHtL();
                ItemGrid.DataSource = ds;
                ItemGrid.DataBind();//bind the data source to this grid       

            }
           else  if (var == "2")//Low to High
            {
                ds = obj.PriceLtH();
                ItemGrid.DataSource = ds;
                ItemGrid.DataBind();//bind the data source to this grid   
            }
            else if (var == "3")// No of Clicks
            {
                ds = obj.Popularity();
                ItemGrid.DataSource = ds;
                ItemGrid.DataBind();//bind the data source to this grid   
            }
        }

        protected void Search1_Click(object sender, EventArgs e)
        {
            string var = "";
            DataSet ds = new DataSet();
            myDAL obj = new myDAL();
            var = SearchBar.Text;

            ds = obj.Search(var);
            ItemGrid.DataSource = ds;
            ItemGrid.DataBind();//bind the data source to this grid   

        }

       
        protected void ItemGrid_RowCommand(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow) ItemGrid.Rows[e.RowIndex];

            Label lbldeleteid = (Label)row.FindControl("ID");
            


            Response.Redirect("_Properties.aspx");
        }

        protected void FavButton_Click(object sender, EventArgs e)
        {
            int var;
            myDAL obj = new myDAL();
            if (FavId.Text == "")
            {
                return;
            }
            var = Convert.ToInt16 (FavId.Text);
            
             obj.AddToFav(var);
            FavId.Text = "";

            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Added To Favourites');", true);
        }
    }
}