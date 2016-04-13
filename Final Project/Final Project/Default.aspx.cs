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
        protected List<Restaurant> restaurant = new List <Restaurant>();

        string cs = ConnectionString.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            getDishes();
        }

        protected void getDishes()
        {

            string query = "Select RName, RLocation, RContact from Restaurant";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Restaurant res = new Restaurant();
                    res.restaurantName = reader["RName"].ToString();
                    res.location = reader["RLocation"].ToString();
                    if (!reader.IsDBNull(reader.GetOrdinal("RContact")))
                    {
                        res.contact = reader["RContact"].ToString();
                    }
                    else
                    {
                        res.contact="N/A";
                    }
                    restaurant.Add(res);
                }


            }

        }


        protected void getRestaurant()
        {

            string query = "Select RName, RLocation, RContact from Restaurant";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Restaurant res = new Restaurant();
                    res.restaurantName = reader["RName"].ToString();
                    res.location = reader["RLocation"].ToString();
                    res.contact = reader["Contact"].ToString();

                    restaurant.Add(res);
                }

            }

        }
    }
}