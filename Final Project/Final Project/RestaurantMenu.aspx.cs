using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Final_Project
{
    public partial class RestaurantMenu : System.Web.UI.Page
    {
        protected String restaurantName;
        protected List<Menu> menu = new List<Menu>();
        protected int id = 0;
        string csd = ConnectionString.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection queryString = Request.QueryString;


            if (queryString != null)
            {
                restaurantName = queryString["name"];
            }
            getDish();

        }


        protected void getDish()
        {

            string query = " select DISTINCT DishName,Price, RestaurantMenu.Image as image from Restaurant "+
                "inner join RestaurantMenu On Restaurant.R_ID = RestaurantMenu.R_ID inner join Dishes "+
                "on RestaurantMenu.D_ID = Dishes.D_ID WHERE RName = @Rname";

            using (SqlConnection conn = new SqlConnection(csd))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                cmd.Parameters.AddWithValue("@RName", restaurantName);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Menu m = new Menu();
                    m.Dish = reader["DishName"].ToString();
                     if (!reader.IsDBNull(reader.GetOrdinal("Price")))
                    {
                        m.Price = reader["Price"].ToString();
                    }
                    else
                    {
                        m.Price = "N/A";
                    }

                     m.Image= reader["image"].ToString();
                    menu.Add(m);
                }


            }

        }

    }
}