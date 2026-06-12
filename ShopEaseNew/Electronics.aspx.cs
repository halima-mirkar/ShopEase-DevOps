using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Electronics : System.Web.UI.Page
    {
        // Read connection string from Web.config
        string cs = ConfigurationManager
            .ConnectionStrings["ShopEaseDB"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No code required here
        }

        // =========================================================
        // ADD TO CART
        // IMPORTANT:
        // Use the actual ProductId values from your Products table.
        //
        // Product IDs for Electronics:
        // 1001 = Hair Dryer
        // 1002 = Hair Straightener
        // 1003 = Smartphone
        // 1004 = DSLR Camera
        // 1005 = Bluetooth Speaker
        // =========================================================
        private void AddToCart(int productId)
        {
            try
            {
                // Check if user is logged in
                if (Session["UserId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                int userId = Convert.ToInt32(Session["UserId"]);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check whether product already exists in cart
                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Cart
                        WHERE UserId = @UserId
                          AND ProductId = @ProductId";

                    using (SqlCommand checkCmd =
                        new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue(
                            "@UserId", userId);

                        checkCmd.Parameters.AddWithValue(
                            "@ProductId", productId);

                        int count = Convert.ToInt32(
                            checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            // Increase quantity
                            string updateQuery = @"
                                UPDATE Cart
                                SET Quantity = Quantity + 1
                                WHERE UserId = @UserId
                                  AND ProductId = @ProductId";

                            using (SqlCommand updateCmd =
                                new SqlCommand(updateQuery, con))
                            {
                                updateCmd.Parameters.AddWithValue(
                                    "@UserId", userId);

                                updateCmd.Parameters.AddWithValue(
                                    "@ProductId", productId);

                                updateCmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            // Insert new cart row
                            string insertQuery = @"
                                INSERT INTO Cart
                                (
                                    UserId,
                                    ProductId,
                                    Quantity
                                )
                                VALUES
                                (
                                    @UserId,
                                    @ProductId,
                                    1
                                )";

                            using (SqlCommand insertCmd =
                                new SqlCommand(insertQuery, con))
                            {
                                insertCmd.Parameters.AddWithValue(
                                    "@UserId", userId);

                                insertCmd.Parameters.AddWithValue(
                                    "@ProductId", productId);

                                insertCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }

                // Redirect to cart page
                Response.Redirect("~/Cart.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('"
                    + ex.Message.Replace("'", "")
                    + "');</script>");
            }
        }

        // =========================================================
        // SEARCH FUNCTIONALITY
        // =========================================================
        protected void btnSearch_Click(
            object sender,
            EventArgs e)
        {
            string keyword = txtSearch.Text
                .Trim()
                .ToLower();

            string category =
                ddlCategory.SelectedValue;

            // Hide all cards initially
            dryerCard.Visible = false;
            straightenerCard.Visible = false;
            mobileCard.Visible = false;
            cameraCard.Visible = false;
            speakerCard.Visible = false;

            // Show products based on search/category
            if (keyword.Contains("dryer") ||
                category == "Beauty Appliances")
            {
                dryerCard.Visible = true;
            }

            if (keyword.Contains("straightener") ||
                category == "Beauty Appliances")
            {
                straightenerCard.Visible = true;
            }

            if (keyword.Contains("mobile") ||
                keyword.Contains("phone") ||
                keyword.Contains("smartphone") ||
                category == "Mobiles")
            {
                mobileCard.Visible = true;
            }

            if (keyword.Contains("camera") ||
                keyword.Contains("dslr") ||
                category == "Cameras")
            {
                cameraCard.Visible = true;
            }

            if (keyword.Contains("speaker") ||
                keyword.Contains("bluetooth") ||
                keyword.Contains("audio") ||
                category == "Audio")
            {
                speakerCard.Visible = true;
            }

            // If no search and all categories selected
            if (string.IsNullOrEmpty(keyword) &&
                category == "All Categories")
            {
                dryerCard.Visible = true;
                straightenerCard.Visible = true;
                mobileCard.Visible = true;
                cameraCard.Visible = true;
                speakerCard.Visible = true;
            }
        }

        // =========================================================
        // BUTTON EVENTS
        // Use ACTUAL ProductIds from Products table
        // =========================================================

        // Hair Dryer -> ProductId = 1001
        // Hair Dryer
        protected void Button1_Click(
            object sender,
            EventArgs e)
        {
            AddToCart(1002);
        }

        // Hair Straightener
        protected void Button2_Click(
            object sender,
            EventArgs e)
        {
            AddToCart(1003);
        }

        // Smartphone
        protected void Button3_Click(
            object sender,
            EventArgs e)
        {
            AddToCart(1004);
        }

        // DSLR Camera
        protected void Button4_Click(
            object sender,
            EventArgs e)
        {
            AddToCart(1005);
        }

        // Bluetooth Speaker
        protected void Button5_Click(
            object sender,
            EventArgs e)
        {
            AddToCart(1006);
        }
    }
}