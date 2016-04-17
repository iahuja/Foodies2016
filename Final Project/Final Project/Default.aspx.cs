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


        protected void getSearchDishes(string search)
        {
            string query = "select distinct Restaurant.RLocation, RName,DishName,RContact, Price, RestaurantMenu.Image from Restaurant " +
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
                    Restaurant trending = new Restaurant();
                    trending.restaurant = reader["RName"].ToString();
                    trending.location = reader["RLocation"].ToString();
                    if (!reader.IsDBNull(reader.GetOrdinal("RContact")))
                    {
                        trending.contact = reader["RContact"].ToString();
                    }
                    else { trending.contact = "N/A"; }

                    trending.dish = reader["DishName"].ToString();
                    trending.image = reader["Image"].ToString();
                    restaurant.Add(trending);
                }


            }

        }


        protected void getTrending()
        {

            string query = "select top 12  RName, DishName, RLocation, RestaurantMenu.Image as Image, RContact from " +
                " Reviews inner join Restaurant on Restaurant.R_ID = Reviews.R_ID " +
                " inner join Dishes on Dishes.D_ID = Reviews.D_ID"+
                " inner join RestaurantMenu on RestaurantMenu.D_ID = Reviews.D_ID group by " +
                "  RName, RestaurantMenu.Image, DishName,RLocation, RContact order by count(Review)desc";
            
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
                    restaurant.Add(trending);
                }


            }

        }

        
       
    }
}