﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace Final_Project
{
    class ConnectionString
    {

        public static string getConnection()
        {
            return ConfigurationManager.ConnectionStrings["FoodiesDatabase"].ConnectionString;
        }

    }
}