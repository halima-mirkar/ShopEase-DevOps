using System;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Fashion : System.Web.UI.Page
    {
        string cs = @"Data Source=(LocalDB)\MSSQLLocalDB;
                      Initial Catalog=ShopEaseDB;
                      Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void AddToCart(int productId)
        {
            try
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                int userId =
                    Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    con.Open();

                    string checkQuery = @"
                    SELECT COUNT(*)
                    FROM Cart
                    WHERE UserID=@UserID
                    AND ProductID=@ProductID";

                    SqlCommand checkCmd =
                        new SqlCommand(checkQuery, con);

                    checkCmd.Parameters.AddWithValue(
                        "@UserID", userId);

                    checkCmd.Parameters.AddWithValue(
                        "@ProductID", productId);

                    int count =
                        Convert.ToInt32(
                        checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        string updateQuery = @"
                        UPDATE Cart
                        SET Quantity = Quantity + 1
                        WHERE UserID=@UserID
                        AND ProductID=@ProductID";

                        SqlCommand updateCmd =
                            new SqlCommand(updateQuery, con);

                        updateCmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        updateCmd.Parameters.AddWithValue(
                            "@ProductID", productId);

                        updateCmd.ExecuteNonQuery();
                    }

                    else
                    {
                        string insertQuery = @"
                        INSERT INTO Cart
                        (UserID, ProductID, Quantity)

                        VALUES
                        (@UserID, @ProductID, 1)";

                        SqlCommand insertCmd =
                            new SqlCommand(insertQuery, con);

                        insertCmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        insertCmd.Parameters.AddWithValue(
                            "@ProductID", productId);

                        insertCmd.ExecuteNonQuery();
                    }

                    Response.Redirect("Cart.aspx");
                }
            }

            catch (Exception ex)
            {
                Response.Write(
                "<script>alert('"
                + ex.Message.Replace("'", "")
                + "')</script>");
            }
        }

        protected void Button1_Click(
            object sender, EventArgs e)
        {
            AddToCart(4);
        }

        protected void Button2_Click(
            object sender, EventArgs e)
        {
            AddToCart(5);
        }

        protected void Button3_Click(
            object sender, EventArgs e)
        {
            AddToCart(6);
        }
    }
}