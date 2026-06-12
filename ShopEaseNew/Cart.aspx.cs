using System;
using System.Data;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Cart :
        System.Web.UI.Page
    {
        string cs =
            @"Data Source=(LocalDB)\MSSQLLocalDB;
              Initial Catalog=ShopEaseDB;
              Integrated Security=True";

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            // LOGIN CHECK

            if (Session["UserId"] == null)
            {
                Response.Redirect(
                    "Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        // LOAD CART

        private void LoadCart()
        {
            int userId =
                Convert.ToInt32(
                Session["UserId"]);

            using (SqlConnection con =
                new SqlConnection(cs))
            {
                string query = @"

                SELECT
                Cart.CartID,
                Products.ProductName,
                Products.Price,
                Cart.Quantity,
                (Products.Price * Cart.Quantity) AS Total

                FROM Cart

                INNER JOIN Products
                ON Cart.ProductID = Products.ProductID

                WHERE Cart.UserID = @UserID";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserID",
                    userId);

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;

                GridView1.DataBind();

                CalculateTotal(dt);
            }
        }

        // CALCULATE TOTAL

        private void CalculateTotal(
            DataTable dt)
        {
            decimal grandTotal = 0;

            foreach (DataRow row in dt.Rows)
            {
                grandTotal +=
                    Convert.ToDecimal(
                    row["Total"]);
            }

            lblTotal.Text =
                "₹ " + grandTotal.ToString("N2");
        }

        // DELETE ITEM

        protected void GridView1_RowDeleting(
            object sender,
            System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int cartId =
                Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con =
                new SqlConnection(cs))
            {
                string query =
                    "DELETE FROM Cart WHERE CartID=@CartID";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@CartID",
                    cartId);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            lblMessage.Text =
                "Item Removed Successfully";

            lblMessage.ForeColor =
                System.Drawing.Color.Red;

            LoadCart();
        }

        // PLACE ORDER

        protected void btnOrder_Click(
    object sender,
    EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        
            try
            {
                int userId =
                    Convert.ToInt32(
                    Session["UserId"]);

                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    con.Open();

                    string totalQuery = @"

                    SELECT SUM
                    (
                        Products.Price * Cart.Quantity
                    )

                    FROM Cart

                    INNER JOIN Products
                    ON Cart.ProductID = Products.ProductID

                    WHERE Cart.UserID = @UserID";

                    SqlCommand totalCmd =
                        new SqlCommand(totalQuery, con);

                    totalCmd.Parameters.AddWithValue(
                        "@UserID",
                        userId);

                    object totalObj =
                        totalCmd.ExecuteScalar();

                    if (totalObj == DBNull.Value
                        || totalObj == null)
                    {
                        lblMessage.Text =
                            "Cart is Empty";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;

                        return;
                    }

                    decimal totalAmount =
                        Convert.ToDecimal(totalObj);

                    // INSERT ORDER

                    string orderQuery = @"

                    INSERT INTO Orders
                    (
                        UserId,
                        OrderDate,
                        TotalAmount,
                        OrderStatus
                    )

                    VALUES
                    (
                        @UserId,
                        GETDATE(),
                        @TotalAmount,
                        'Pending'
                    );

                    SELECT SCOPE_IDENTITY();";

                    SqlCommand orderCmd =
                        new SqlCommand(orderQuery, con);

                    orderCmd.Parameters.AddWithValue(
                        "@UserId",
                        userId);

                    orderCmd.Parameters.AddWithValue(
                        "@TotalAmount",
                        totalAmount);

                    int orderId =
                        Convert.ToInt32(
                        orderCmd.ExecuteScalar());

                    // INSERT ORDER DETAILS

                    string detailQuery = @"

                    INSERT INTO OrderDetails
                    (
                        OrderId,
                        ProductId,
                        Quantity,
                        Price
                    )

                    SELECT
                    @OrderId,
                    Cart.ProductId,
                    Cart.Quantity,
                    Products.Price

                    FROM Cart

                    INNER JOIN Products
                    ON Cart.ProductId = Products.ProductId

                    WHERE Cart.UserId = @UserId";

                    SqlCommand detailCmd =
                        new SqlCommand(detailQuery, con);

                    detailCmd.Parameters.AddWithValue(
                        "@OrderId",
                        orderId);

                    detailCmd.Parameters.AddWithValue(
                        "@UserId",
                        userId);

                    detailCmd.ExecuteNonQuery();

                    // CLEAR CART

                    string deleteQuery =
                        "DELETE FROM Cart WHERE UserId=@UserId";

                    SqlCommand deleteCmd =
                        new SqlCommand(deleteQuery, con);

                    deleteCmd.Parameters.AddWithValue(
                        "@UserId",
                        userId);

                    deleteCmd.ExecuteNonQuery();
                }

                lblMessage.Text =
                    "Order Placed Successfully";

                lblMessage.ForeColor =
                    System.Drawing.Color.Green;

                LoadCart();
            }

            catch (Exception ex)
            {
                lblMessage.Text =
                    ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }
    }
}