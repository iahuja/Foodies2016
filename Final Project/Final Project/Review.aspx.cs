using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class Review : System.Web.UI.Page
    {
        string restID, dishID;
        string csd = ConnectionString.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection queryString = Request.QueryString;
           
            locationDropdown.Items.Insert(0, new ListItem("Location", "-1"));
            dishDropdown.Items.Insert(0,new ListItem("Dish","-1"));

            if (queryString != null)
            {
                restID = queryString["restaurant"];
                dishID = queryString["dish"];
            }

            if (!IsPostBack)
            {
                restDropDown(null);
            }


        }


        protected void restDropDown(string rname)
        {
           
            string query = "Select Distinct RName from Restaurant";
            using (SqlConnection conn = new SqlConnection(csd))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                DataTable table = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                adapter.Fill(table);
                dropdownRestaurant.DataSource = table;
                dropdownRestaurant.DataValueField = "RName";  
                dropdownRestaurant.DataTextField = "RName";  
                dropdownRestaurant.DataBind();
                dropdownRestaurant.Items.Insert(0, new ListItem("Restaurant", "-1"));

                if (rname != null)
                {
                 dropdownRestaurant.SelectedIndex = dropdownRestaurant.Items.IndexOf
                        (dropdownRestaurant.Items.FindByText(rname));
                }
            }
            }
    }
}