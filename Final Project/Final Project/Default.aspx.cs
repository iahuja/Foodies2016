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
        string searchText,sessionSearch;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Session["searchText"] as string))
                {
                    Session["searchText"] = "empty";
                }
            }

            
            searchResults();

        }


        private void searchResults()
        {
            if (search.Text.Trim().ToUpper().Equals("TRENDING"))
            {
                Session["searchText"] = "empty";
                getTrending();
                return;
            }
            else
            {
                sessionSearch = Session["searchText"].ToString();
            }

            if (!sessionSearch.Equals("empty"))
            {
                if (search.Text.Trim().Equals(""))
                {
                    getSearchDishes(sessionSearch);
                }
                else
                {
                    getSearchDishes(search.Text.Trim());
                }
            }
            else
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

                int count = restaurant.Count;
                if (count == 0)
                {
                    Session["searchRecord"] = "Oops we missed " + search;
                }
                else { Session["searchRecord"] = "Showing (" + restaurant.Count + ") results for " + search; }


            }

        }


        protected void getTrending()
        {
            Session["searchRecord"] = "Trending this week";
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
        
        protected void ReviewClicked(object sender, EventArgs e)
        {
            string rid = R_IDForReview.Value;
            string did = D_IDForReview.Value;
            string review = reviewText.Text;
            string userName = SessionUserName.Value;
            string userImage = SessionUserImage.Value;


            string insertQuery = "Insert into Reviews(R_ID,D_ID,Review,UserName,Image) "+
                " Values(@R_ID,@D_ID,@review,@name,@image)";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@R_ID", rid);
                cmd.Parameters.AddWithValue("@D_ID", did);
                cmd.Parameters.AddWithValue("@review", review);
                cmd.Parameters.AddWithValue("@name", userName);
                cmd.Parameters.AddWithValue("@image", userImage);

                conn.Open();

                int result = (int)cmd.ExecuteNonQuery();


            }

              Session["ReviewAdded"] = "true";
            if (!search.Text.Trim().Equals(""))
            {
                if (!search.Text.Trim().ToUpper().Equals("TRENDING"))
                {
                    Session["searchText"] = search.Text.Trim().ToString();
                }
            }
              Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);


        }
    }
}