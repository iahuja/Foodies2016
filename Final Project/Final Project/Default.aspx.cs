using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Final_Project
{
    public partial class HomePage : System.Web.UI.Page
    {
        string cs = ConnectionString.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select RName, RLocation, RContact from Restaurant";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query,conn);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string name = reader["RName"].ToString();
                    string location = reader["RLocation"].ToString();
                    string contact = reader["Contact"].ToString();

                }

            }
        }

    }
}