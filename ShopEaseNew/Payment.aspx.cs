using System;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Payment :
        System.Web.UI.Page
    {
        string cs =
            @"Data Source=(LocalDB)\MSSQLLocalDB;
              Initial Catalog=ShopEaseDB;
              Integrated Security=True";

        protected void btnPay_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                    Session["UserId"]);

                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    con.Open();

                    // GET TOTAL

                    string totalQuery = @"

                    SELECT SUM
                    (
                        Products.Price * Cart.Quantity
                    )

                    FROM Cart

                    INNER JOIN Products
                    ON Cart.ProductID = Products.ProductID

                    WHERE Cart.UserID=@UserID";

                    SqlCommand totalCmd =
                        new SqlCommand(totalQuery, con);

                    totalCmd.Parameters.AddWithValue(
                        "@UserID",
                        userId);

                    decimal totalAmount =
                        Convert.ToDecimal(
                        totalCmd.ExecuteScalar());

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
                        'Paid'
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
                    ON Cart.ProductId =
                    Products.ProductId

                    WHERE Cart.UserId=@UserId";

                    SqlCommand detailCmd =
                        new SqlCommand(detailQuery, con);

                    detailCmd.Parameters.AddWithValue(
                        "@OrderId",
                        orderId);

                    detailCmd.Parameters.AddWithValue(
                        "@UserId",
                        userId);

                    detailCmd.ExecuteNonQuery();

                    // INSERT PAYMENT

                    string paymentQuery = @"

                    INSERT INTO Payments
                    (
                        UserID,
                        OrderID,
                        PaymentMethod,
                        CardNumber,
                        Amount,
                        PaymentStatus
                    )

                    VALUES
                    (
                        @UserID,
                        @OrderID,
                        @Method,
                        @Card,
                        @Amount,
                        'Success'
                    )";

                    SqlCommand payCmd =
                        new SqlCommand(paymentQuery, con);

                    payCmd.Parameters.AddWithValue(
                        "@UserID",
                        userId);

                    payCmd.Parameters.AddWithValue(
                        "@OrderID",
                        orderId);

                    payCmd.Parameters.AddWithValue(
                        "@Method",
                        ddlMethod.SelectedValue);

                    payCmd.Parameters.AddWithValue(
                        "@Card",
                        txtCard.Text);

                    payCmd.Parameters.AddWithValue(
                        "@Amount",
                        totalAmount);

                    payCmd.ExecuteNonQuery();

                    // CLEAR CART

                    string deleteQuery =
                        "DELETE FROM Cart WHERE UserId=@UserId";

                    SqlCommand deleteCmd =
                        new SqlCommand(deleteQuery, con);

                    deleteCmd.Parameters.AddWithValue(
                        "@UserId",
                        userId);

                    deleteCmd.ExecuteNonQuery();

                    lblMessage.Text =
                        "Payment Successful";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Green;
                }
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