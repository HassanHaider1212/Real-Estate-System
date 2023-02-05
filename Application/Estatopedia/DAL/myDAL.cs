using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace Estatopedia.DAL
{
    public class myDAL
    {
        public static String current_user = "";
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        //-----------------------------------------
        public int CheckLogin(String ID, String Pass)
        {
            int var = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("CheckLoginDetails ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@LoginID", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@LoginPassword", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@Status", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters["@LoginID"].Value = ID;
                cmd.Parameters["@LoginPassword"].Value = Pass;
                cmd.ExecuteNonQuery();
                var = Convert.ToInt32(cmd.Parameters["@Status"].Value);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return var;
        }

        public void AddTenant(int ID, String Mail)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("AddTenant ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@list_ID", SqlDbType.Int, 1);
                cmd.Parameters.Add("@t_mail", SqlDbType.VarChar, 30);
                cmd.Parameters["@list_ID"].Value = ID;
                cmd.Parameters["@t_mail"].Value = Mail;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }
        public char GetUserType(String ID)
        {
            char var = '\0';
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("GetUserType ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@OUT", SqlDbType.Char,1).Direction = ParameterDirection.Output;
                cmd.Parameters["@ID"].Value = ID;
                cmd.ExecuteNonQuery();
                var = Convert.ToChar(cmd.Parameters["@OUT"].Value);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return var;
        }
        public int CheckUser(String ID)
        {
            int var = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd1;
            try
            {
                cmd1 = new SqlCommand("USEREXISTS ", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@ID", SqlDbType.VarChar, 30);
                cmd1.Parameters.Add("@OUT", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd1.Parameters["@ID"].Value = ID;
                cmd1.ExecuteNonQuery();
                var = Convert.ToInt32(cmd1.Parameters["@OUT"].Value);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
            return var;
        }

        public void AddToFav(int ID)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd1;
            try
            {
                cmd1 = new SqlCommand("AddToFav ", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@user_id", SqlDbType.NVarChar, 30);
                cmd1.Parameters.Add("@list_id", SqlDbType.Int, 1);
                cmd1.Parameters["@user_id"].Value = current_user;
                cmd1.Parameters["@list_id"].Value = ID;
                cmd1.ExecuteNonQuery();
               
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void DeleteFromListings(int ID)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd1;
            try
            {
                cmd1 = new SqlCommand("DeleteFromListings ", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@list_id", SqlDbType.Int, 1);
                cmd1.Parameters["@list_id"].Value = ID;
                cmd1.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void MarkAsSold(int ID)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd1;
            try
            {
                cmd1 = new SqlCommand("MarkSold ", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@list_id", SqlDbType.Int, 1);
                cmd1.Parameters["@list_id"].Value = ID;
                cmd1.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void DeleteFromFav(int ID)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd1;
            try
            {
                cmd1 = new SqlCommand("DeleteFromFav ", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@list_id", SqlDbType.Int, 1);
                cmd1.Parameters.Add("@user_id", SqlDbType.NVarChar, 30);
                cmd1.Parameters["@list_id"].Value = ID;
                cmd1.Parameters["@user_id"].Value = current_user;
                cmd1.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }
        public void SignUp(String Name, String Email, String Password, String ContactNumber, int Age, String CNIC, char UserType, char Gender, String Description)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SIGNUP ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@NAME", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@ID", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@PASS", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@UT", SqlDbType.Char);
                cmd.Parameters.Add("@NUMBER", SqlDbType.VarChar, 15);
                cmd.Parameters.Add("@AGE", SqlDbType.Int);
                cmd.Parameters.Add("@GENDER", SqlDbType.Char);
                cmd.Parameters.Add("@DESC", SqlDbType.Text);
                cmd.Parameters.Add("@CNIC", SqlDbType.VarChar, 15);
                // set parameter values
                cmd.Parameters["@NAME"].Value = Name;
                cmd.Parameters["@ID"].Value = Email;
                cmd.Parameters["@PASS"].Value = Password;
                cmd.Parameters["@UT"].Value = UserType;
                cmd.Parameters["@NUMBER"].Value = ContactNumber;
                cmd.Parameters["@AGE"].Value = Age;
                cmd.Parameters["@GENDER"].Value = Gender;
                cmd.Parameters["@DESC"].Value = Description;
                cmd.Parameters["@CNIC"].Value = CNIC;


                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        //-----------------------------------------
        public DataSet ApplyFilter(float Pricebox_min, float Pricebox_max, float Areabox_min, float Areabox_max,int _bedrooms,int _bathrooms,int _storeys)
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("FILTERLISTINGS", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@MIN_PRICE", SqlDbType.Float);
                cmd.Parameters.Add("@MAX_PRICE", SqlDbType.Float);
                cmd.Parameters.Add("@MIN_AREA", SqlDbType.Float);
                cmd.Parameters.Add("@MAX_AREA", SqlDbType.Float);
                cmd.Parameters.Add("@MIN_BEDROOMS", SqlDbType.Int);
                cmd.Parameters.Add("@MIN_BATHROOMS", SqlDbType.Int);
                cmd.Parameters.Add("@MIN_STOREYS", SqlDbType.Int);

                cmd.Parameters["@MIN_PRICE"].Value = Pricebox_min;
                cmd.Parameters["@MAX_PRICE"].Value = Pricebox_max;
                cmd.Parameters["@MIN_AREA"].Value = Areabox_min;
                cmd.Parameters["@MAX_AREA"].Value = Areabox_max;
                cmd.Parameters["@MIN_BEDROOMS"].Value = _bedrooms;
                cmd.Parameters["@MIN_BATHROOMS"].Value = _bathrooms;
                cmd.Parameters["@MIN_STOREYS"].Value = _storeys;

                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {   
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public DataSet AddListings(string name, string desc,string city, string location,char purpose,char type,float Price, float Area, int _bedrooms, int _bathrooms, int _storeys)
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("AddListing", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100);
                cmd.Parameters.Add("@seller_id", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@desc", SqlDbType.NVarChar, 100);
                cmd.Parameters.Add("@city", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@loc", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@price", SqlDbType.Float,1);
                cmd.Parameters.Add("@area", SqlDbType.Float,1);
                cmd.Parameters.Add("@beds", SqlDbType.Int,1);
                cmd.Parameters.Add("@baths", SqlDbType.Int,1);
                cmd.Parameters.Add("@storeys", SqlDbType.Int,1);
                cmd.Parameters.Add("@purp", SqlDbType.Char,1);
                cmd.Parameters.Add("@type", SqlDbType.Char,1);


                cmd.Parameters["@seller_id"].Value = current_user;
                cmd.Parameters["@name"].Value = name;
                cmd.Parameters["@desc"].Value = desc;
                cmd.Parameters["@city"].Value = city;
                cmd.Parameters["@loc"].Value = location;
                cmd.Parameters["@price"].Value = Price;
                cmd.Parameters["@area"].Value = Area;
                cmd.Parameters["@beds"].Value = _bedrooms;
                cmd.Parameters["@baths"].Value = _bathrooms;
                cmd.Parameters["@storeys"].Value = _storeys;
                cmd.Parameters["@purp"].Value = purpose;
                cmd.Parameters["@type"].Value = type;
                
         
               

                cmd.ExecuteNonQuery();

               
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public DataSet AllListings()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            DataSet ds = new DataSet();
            try
            {
                cmd = new SqlCommand("allListings", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }
        public DataSet FavList()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("userFavList", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@input_id", SqlDbType.NVarChar, 30);
                cmd.Parameters["@input_id"].Value = current_user;
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }
        public DataSet ResetFilter()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("RESETFILTERS", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }
        public DataSet TenantList()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("TenantDetail", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@seller_ID", SqlDbType.NVarChar, 30);
                cmd.Parameters["@seller_ID"].Value = current_user;
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }
        public DataSet SellerListings()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Get_Seller_Listing", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@sellerid", SqlDbType.NVarChar, 30);
                cmd.Parameters["@sellerid"].Value = current_user;
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }

        public DataSet Search(String subString)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SearchListings", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@string", SqlDbType.NVarChar, 50);
                cmd.Parameters["@string"].Value = subString;
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }
        public DataSet PriceLtH()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("LowToHighPrice", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
              
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }

        public DataSet PriceHtL()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("HighToLowPrice", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }

        public DataSet Popularity()
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Get_Sorted", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.ExecuteNonQuery();

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }

       
        public void UserInformation(ref String name, ref String CNIC, ref String number, ref int age, ref char gender, ref String Desc)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("UserDetail ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mail_id", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 30).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@age", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@cnic", SqlDbType.NVarChar, 15).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@desc", SqlDbType.NVarChar, 100).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@gender", SqlDbType.Char, 1).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@contact", SqlDbType.NVarChar, 15).Direction = ParameterDirection.Output;
                cmd.Parameters["@mail_id"].Value = myDAL.current_user;
                cmd.ExecuteNonQuery();
                name = Convert.ToString(cmd.Parameters["@name"].Value);
                CNIC = Convert.ToString(cmd.Parameters["@cnic"].Value);
                number = Convert.ToString(cmd.Parameters["@contact"].Value);
                Desc = Convert.ToString(cmd.Parameters["@desc"].Value);
                gender = Convert.ToChar(cmd.Parameters["@gender"].Value);
                age = Convert.ToInt16(cmd.Parameters["@age"].Value);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }
        //-----------------------------------------
        //public DataSet SelectItem(string email)
        //{

        //    DataSet ds = new DataSet(); //declare and instantiate new dataset
        //    SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
        //    con.Open(); // open sql Connection
        //    SqlCommand cmd;

        //    try
        //    {
        //        cmd = new SqlCommand("Get_Seller_Listing", con);  //instantiate SQL command 
        //        cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
        //        cmd.Parameters.Add("@sellerid", SqlDbType.VarChar, 30);
        //        cmd.Parameters["@sellerid"].Value = email;
        //        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //        {
        //            da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
        //        }
        //    }
        //    catch (SqlException ex)
        //    {

        //        Console.WriteLine("SQL Error" + ex.Message.ToString());
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }

        //    return ds; //return the dataset
        //}

        //public DataSet SelectItem2(string email) //to get the values of all the items from table Items and return the Dataset
        //{

        //    DataSet ds = new DataSet(); //declare and instantiate new dataset
        //    SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
        //    con.Open(); // open sql Connection
        //    SqlCommand cmd;

        //    try
        //    {
        //        cmd = new SqlCommand("userFavList", con);  //instantiate SQL command 
        //        cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
        //        cmd.Parameters.Add("@input_id", SqlDbType.VarChar, 30);
        //        cmd.Parameters["@input_id"].Value = email;
        //        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //        {
        //            da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
        //        }
        //    }
        //    catch (SqlException ex)
        //    {

        //        Console.WriteLine("SQL Error" + ex.Message.ToString());
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }

        //    return ds; //return the dataset
        //}

        //-----------------------------------------

        public DataSet Cal_Commison(int id) //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Calculate_Commison", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@input1", SqlDbType.Int);

                // cmd.Parameters.Add("@amount",SqlDbType.Int);
                //cmd.Parameters.Add("@commision", SqlDbType.Float);
                //cmd.Parameters.Add("plot_Category", SqlDbType.Char);
                cmd.Parameters["@input1"].Value = id;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {

                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public void UpdateProfile (String name, String Contact, int age, String desc)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("updateProfile", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@id", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@newName", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@newAge", SqlDbType.Int, 1);
                cmd.Parameters.Add("@newContact", SqlDbType.NVarChar, 15);
                cmd.Parameters.Add("@newdescription", SqlDbType.NVarChar, 100);

                // cmd.Parameters.Add("@amount",SqlDbType.Int);
                //cmd.Parameters.Add("@commision", SqlDbType.Float);
                //cmd.Parameters.Add("plot_Category", SqlDbType.Char);
                cmd.Parameters["@id"].Value = current_user;
                cmd.Parameters["@newName"].Value = name;
                cmd.Parameters["@newAge"].Value = age;
                cmd.Parameters["@newContact"].Value = Contact;
                cmd.Parameters["@newdescription"].Value = desc;

                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {

                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }
    }
}