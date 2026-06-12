using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ShopEaseNew.DAL
{
    public class DBHelper
    {
        SqlConnection con =
            new SqlConnection(
            ConfigurationManager.ConnectionStrings["ShopEaseDB"].ConnectionString);

        // SELECT OPERATION

        public DataTable ExecuteSelect(
            string procedure,
            SqlParameter[] param)
        {
            SqlCommand cmd =
                new SqlCommand(
                procedure,
                con);

            cmd.CommandType =
                CommandType.StoredProcedure;

            if (param != null)
            {
                cmd.Parameters.AddRange(param);
            }

            SqlDataAdapter da =
                new SqlDataAdapter(cmd);

            DataTable dt =
                new DataTable();

            da.Fill(dt);

            return dt;
        }
    }
}