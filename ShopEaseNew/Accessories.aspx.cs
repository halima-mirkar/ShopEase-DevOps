using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Accessories : System.Web.UI.Page
    {
        // Connection string from Web.config
        private string cs;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load connection string from Web.config
            if (ConfigurationManager.ConnectionStrings["ShopEaseDB"] != null)
            {
                cs = ConfigurationManager
                        .ConnectionStrings["ShopEaseDB"]
                        .ConnectionString;
            }
            else
            {
                throw new Exception(
                    "Connection string 'ShopEaseDB' was not found in Web.config.");
            }
        }

        // =========================================================
        // ADD TO CART
        // =========================================================
        private void AddToCart(int productId)
        {
            try
            {
                // Check whether user is logged in
                // (Matches your existing Cart.aspx.cs which uses Session["UserId"])
                if (Session["UserId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                int userId = Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check if product already exists in cart
                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Cart
                        WHERE UserID = @UserID
                          AND ProductID = @ProductID";

                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@UserID", userId);
                        checkCmd.Parameters.AddWithValue("@ProductID", productId);

                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            // Increase quantity if already in cart
                            string updateQuery = @"
                                UPDATE Cart
                                SET Quantity = Quantity + 1
                                WHERE UserID = @UserID
                                  AND ProductID = @ProductID";

                            using (SqlCommand updateCmd =
                                new SqlCommand(updateQuery, con))
                            {
                                updateCmd.Parameters.AddWithValue("@UserID", userId);
                                updateCmd.Parameters.AddWithValue("@ProductID", productId);
                                updateCmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            // Insert new item into cart
                            string insertQuery = @"
                                INSERT INTO Cart
                                (
                                    UserID,
                                    ProductID,
                                    Quantity
                                )
                                VALUES
                                (
                                    @UserID,
                                    @ProductID,
                                    1
                                )";

                            using (SqlCommand insertCmd =
                                new SqlCommand(insertQuery, con))
                            {
                                insertCmd.Parameters.AddWithValue("@UserID", userId);
                                insertCmd.Parameters.AddWithValue("@ProductID", productId);
                                insertCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }

                // Redirect to main cart page
                Response.Redirect("~/Cart.aspx");
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message.Replace("'", ""));
            }
        }

        // =========================================================
        // SHOW ALERT MESSAGE
        // =========================================================
        private void ShowMessage(string message)
        {
            string script = "alert('" + message.Replace("'", "") + "');";

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                script,
                true);
        }

        // =========================================================
        // BUTTON CLICK EVENTS
        // Product IDs must match records in your Products table
        // =========================================================

        // REPLACE ONLY THE BUTTON CLICK METHODS IN Accessories.aspx.cs
        // Use the ACTUAL ProductID values from your Products table.

        // Luxury Watch
        // Luxury Watch
        protected void Button1_Click(object sender, EventArgs e)
        {
            AddToCart(2003);
        }

        // Stylish Backpack
        protected void Button2_Click(object sender, EventArgs e)
        {
            AddToCart(2004);
        }

        // Sunglasses
        protected void Button3_Click(object sender, EventArgs e)
        {
            AddToCart(2005);
        }

        // Leather Wallet
        protected void Button4_Click(object sender, EventArgs e)
        {
            AddToCart(2006);
        }

        // Smart Band
        protected void Button5_Click(object sender, EventArgs e)
        {
            AddToCart(2007);
        }

        // DSLR Camera Bag
        protected void Button6_Click(object sender, EventArgs e)
        {
            AddToCart(2008);
        }
    }
}