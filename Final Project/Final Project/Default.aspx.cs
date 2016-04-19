using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Final_Project
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected List<Restaurant> restaurant = new List<Restaurant>();
        protected int id = 0;

        string cs = ConnectionString.getConnection();
        string searchText;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            var arg = Request.Form["__EVENTTARGET"];
            string data = (string)arg;

            if (data != null)
            {
                if (data.Contains(','))
                {
                   
                    redirect(data);
                }
            }
         
            searchText = search.Text.Trim();

            if (searchText.Trim().Equals(""))
            {
                getTrending();
            }
            else
            { 
                 getSearchDishes(searchText);
            }
        }


        protected void redirect(string data)
        {
            string[] value = data.Split(',');

            string restID = Server.UrlEncode(value[0]);
            string DishID = Server.UrlEncode(value[1]);
            Response.Redirect("~/Review.aspx?restaurant=" + restID+"&dish="+DishID);

        }


        protected void getSearchDishes(string search)
        {
            string query = "select distinct RestaurantMenu.R_ID, RestaurantMenu.D_ID, Price, Restaurant.RLocation, RName,DishName,RContact, Price, RestaurantMenu.Image from Restaurant " +
                "inner join RestaurantMenu On Restaurant.R_ID = RestaurantMenu.R_ID inner join Dishes "+
                "on RestaurantMenu.D_ID = Dishes.D_ID WHERE DishName like '%"+search+"%' or " +
                " Dishes.type like '%" + search + "%'  or Dishes.DishCousine like '%" + search + "%'" ;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Restaurant res = new Restaurant();
                    res.restaurant = reader["RName"].ToString();
                    res.location = reader["RLocation"].ToString();
                    if (!reader.IsDBNull(reader.GetOrdinal("RContact")))
                    {
                        res.contact = reader["RContact"].ToString();
                    }
                    else { res.contact = "N/A"; }

                    res.dish = reader["DishName"].ToString();
                    res.image = reader["Image"].ToString();

                    if (!reader.IsDBNull(reader.GetOrdinal("Price")))
                    {
                        res.Price = reader["Price"].ToString();
                    }
                    else
                    {
                        res.Price = "N/A";
                    }

                    string rID = reader["R_ID"].ToString();
                    string dID = reader["D_ID"].ToString();

                    res.restauranID = rID;
                    res.dishID = dID;
                   res.revList=getReviews(rID, dID);
                    restaurant.Add(res);
                }


            }

        }


        protected void getTrending()
        {

            string query = "select top 12 Reviews.R_ID, Reviews.D_ID, Price,  RName, DishName, RLocation, RestaurantMenu.Image as Image, RContact from " +
                " Reviews inner join Restaurant on Restaurant.R_ID = Reviews.R_ID " +
                " inner join Dishes on Dishes.D_ID = Reviews.D_ID"+
                " inner join RestaurantMenu on RestaurantMenu.D_ID = Reviews.D_ID group by " +
                " Reviews.R_ID, Reviews.D_ID, RName, Price, RestaurantMenu.Image, DishName,RLocation, RContact order by count(Review)desc";
            
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Restaurant trending = new Restaurant();
                    trending.restaurant = reader["RName"].ToString();
                    trending.location = reader["RLocation"].ToString();
                    if (!reader.IsDBNull(reader.GetOrdinal("RContact")))
                    {
                        trending.contact = reader["RContact"].ToString();
                    }
                    else{ trending.contact="N/A";}

                    trending.dish = reader["DishName"].ToString();
                    trending.image = reader["Image"].ToString();

                    if (!reader.IsDBNull(reader.GetOrdinal("Price")))
                    {
                        trending.Price = reader["Price"].ToString();
                    }
                    else
                    {
                        trending.Price = "N/A";
                    }

                    string rID = reader["R_ID"].ToString();
                    string dID = reader["D_ID"].ToString();

                    trending.restauranID = rID;
                    trending.dishID = dID;
                    trending.revList = getReviews(rID, dID);
                    restaurant.Add(trending);
                }


            }

        }

        public List<String> getReviews(string rID, string dID)
        {
            string query = "select Review, UserName, Image from Reviews where R_ID=@RID and D_ID=@DID";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                List<String> reviewLsit = new List<String>();
                
                conn.Open();
                cmd.Parameters.AddWithValue("@RID", rID);
                cmd.Parameters.AddWithValue("@DID", dID);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    if (!reader.IsDBNull(reader.GetOrdinal("Image")))
                    {
                        reviewLsit.Add(reader["Image"].ToString());
                    }
                    else { reviewLsit.Add("N/A"); }

                     
                    reviewLsit.Add(reader["UserName"].ToString());
                    

                    reviewLsit.Add(reader["Review"].ToString());
                    
                }

                if (reviewLsit.Count==0)
                {
                    
                    reviewLsit.Add("empty");
                   
                }

               return reviewLsit;

            }
        }

      
    }
}